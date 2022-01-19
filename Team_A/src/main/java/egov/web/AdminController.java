package egov.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egov.service.AdminService;
import egov.service.NikeVO;

@Controller
public class AdminController {
	@Resource(name="adminService")
	AdminService adminService;
	
	@RequestMapping("adminGoodsWrite.do")
	public String adminGoodsWirte(HttpSession session) throws Exception{
	
		return "nike/nikeweb/admin/adminGoodsWrite";
	}
	
	@RequestMapping("adminGoodsWriteSave.do")
	@ResponseBody
	public String insertGoodsInfo(MultipartHttpServletRequest multiRequest,
								  NikeVO vo) throws Exception{
		
		// admin 세션 검사 하기
		
		
		String msg="ok";
		int unq=adminService.selectLastGoodsUnq(vo);
		
		try {
			// 여기서 예외발생 == unq.nextval이 실행된적이 없다는 것
			//unq=
		} catch(Exception e) {
			System.out.println(e.getMessage() + "에서 예외를 받았습니다.");
		}
		
		Map<String,String> map = uploadProcess(multiRequest,unq);
		
		if(map.get("isDIrExist")!=null) {
			msg="er1";	
		} else if(map.get("isEmpty")!=null) {
			msg="er2";
		} else {

			vo.setThumbnail(map.get("thumbnail"));
			vo.setGoodsimg(map.get("goodsImg"));
			if(vo.getSale()==null) {
				vo.setSale("null");
			}
			
			// sql문 실행	
			String result = adminService.insertGoodsInfo(vo);
			if(result!=null) msg="er3";
		}
		
		return msg;
	}
	
	@RequestMapping("adminGoodsDetail.do")
	public String selectGoodsDetail(NikeVO vo,Model model) throws Exception{
		// admin 세션 검사 하기
		
		// 조회수 증가
		int Hits=adminService.updateGoodsInfoHits(vo.getUnq());
		
		// 게시판 정보 가져오기
		NikeVO goodsinfo=adminService.selectGoodsInfo(vo.getUnq());
		goodsinfo.setColor(goodsinfo.getColor().replaceAll("/", ","));
		
		// 파일 이름 가지고 오기
		Map<String,List<String>> map = getFiles(vo);
		
		// Model에 실어서 보내면 됨
		model.addAttribute("thumbnails",map.get("thumbnails"));
		model.addAttribute("goodsImgs",map.get("goodsImgs"));
		
		goodsinfo.setInfo(goodsinfo.getInfo().replaceAll("\n", "<br>"));
		model.addAttribute("goodsinfo",goodsinfo);
		return "nike/nikeweb/admin/adminGoodsDetail";
	}
	

	@RequestMapping("adminDeleteGoodsInfo.do")
	@ResponseBody
	public String deleteGoodsInfo(NikeVO vo) throws Exception{
		// admin 세션 검사 하기
		
		String msg="ok";
		
		// 경로 및 파일 삭제
		int err=deleteDirProcess(vo);
		
		// db 삭제
		int result=adminService.deleteGoodsInfo(vo.getUnq());
		
		if(result!=1&&err!=0) msg="er1";
		else if(result!=1) msg="er2";
		else if(err!=0) msg="er3";
	
		return msg;
	}
	
	@RequestMapping("adminGoodsModify.do")
	public String adminGoodsModify(NikeVO vo,Model model) throws Exception{
		// admin 세션 검사 하기
		
		NikeVO goodsinfo=adminService.selectGoodsInfo2(vo.getUnq());
		goodsinfo.setCsize(goodsinfo.getCsize().replaceAll("/", ","));
		goodsinfo.setColor(goodsinfo.getColor().replaceAll("/", ","));
		
		// 파일 이름 가지고 오기
		Map<String,List<String>> map = getFiles(vo);
		
		// Model에 실어서 보내면 됨
		model.addAttribute("thumbnails",map.get("thumbnails"));
		model.addAttribute("goodsImgs",map.get("goodsImgs"));
		
		model.addAttribute("goodsinfo",goodsinfo);
		return "nike/nikeweb/admin/adminGoodsModify";
	}
	
	@RequestMapping("adminGoodsModifySave.do")
	@ResponseBody
	public String updateGoodsInfo(HttpServletRequest req,
								  MultipartHttpServletRequest multiRequest,
			  					  NikeVO vo) throws Exception{
		// admin 세션 검사 하기
		
		String msg="ok";
		NikeVO target=vo;
		Map<String, String> map=updateProcess(req,multiRequest,target);
		
		vo.setThumbnail(map.get("thumbnail"));
		vo.setGoodsimg(map.get("goodsImg"));
		if(vo.getSale()==null) {
			vo.setSale("null");
		}
		
		// sql문 실행	
		int result = adminService.updateGoodsInfo(vo);
		if(result!=1) msg="er1";
	
		return msg;
	}
	
	
	@RequestMapping("adminDeleteFile.do")
	@ResponseBody
	public String deleteImgFile(NikeVO vo) throws Exception{
		// admin 세션 검사 하기
		
		String msg="ok";
		int result=0;
		
		// 파일 삭제
		NikeVO target=vo;
		String fileDelete = deleteFile(target);
		
		String filename=target.getFilename();
		System.out.println(filename);
		if(fileDelete.equals("delOk") && filename.trim().length()>0) {
			if(filename.contains("th")) {
				target.setImageList("thumbnail");
			} else {
				target.setImageList("goodsImg");
			} 
			String imageList=adminService.selectImageList(target);
			
			String[] arr=imageList.split("/");
			List<String> list=new ArrayList<>(Arrays.asList(arr));
			int idx=list.indexOf(filename);
			System.out.println(list);
			System.out.println(idx);			
			list.remove(idx);
			filename=String.join("/", list);
			target.setFilename(filename);
			result=adminService.updateImageList(target);
			if(result!=1) msg="er1";
		} else if(!fileDelete.equals("delOk")) {
			msg="er2";
		}
	
		return msg;
	}

	
	// 파일 업로드
	public static Map<String,String> uploadProcess(MultipartHttpServletRequest multiRequest, 
													   int unq_int) throws Exception {
			
		List<MultipartFile> fileList1=multiRequest.getFiles("thumbnails");
		List<MultipartFile> fileList2=multiRequest.getFiles("goodsImgs");
		
		Map<String,String> map = new HashMap<String,String>();
		
		String uploadDir="D:/project_ezen/eGovFrameDev-3.10.0-64bit/workspace/Team_A/Team_A/src/main/webapp/nike/goods";
		
		String fileName="";			// 파일명
		String ext="";				// 확장자
		String fulldir = "";		// 파일명 포함한 저장 경로
		
		// DB 저장용 (vo에 실을 예정)
		String thumbnail = "";
		String goodsImg = "";
		
		// 현재 unq+1 폴더 생성
		
		String unq = Integer.toString(unq_int);
		uploadDir+="/"+unq;

		// 디렉토리 여부 확인 및 생성
		File dirname = new File(uploadDir);  // 물리적인 위치로 인식
		
		// 경로가 존재하면 -> 문자열만 전송하기 (오류)
		if (dirname.exists()) {
			map.put("isDirExist","exist");
		
		// 파일리스트가 비어있다면 -> 문자열만 전송하기 (오류)
		} else if(fileList1.isEmpty()||fileList2.isEmpty()){
			map.put("isEmpty","empty");

		// 경로가 없고, 파일리스트에 이미지가 있으면 -> 경로 생성 / 파일 전송 / 문자열 전송
		} else {

			// 경로 생성
			dirname.mkdirs();	

			// thumbnail 파일 전송 / 문자열 준비
			int index=1;
			for(MultipartFile file : fileList1) {
				// 파일의 확장자 가져오기
				fileName=file.getOriginalFilename();
				ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				
				// 확장자 붙여서 파일 전송하기
				fileName="th_"+unq+"_"+index+"."+ext;
				fulldir = uploadDir + "/"+fileName;
	            file.transferTo(new File(fulldir));
				thumbnail += fileName + "/";
				index++;
			}
			
			// goodsImg 파일 전송 / 문자열 준비
			index=1;
			for(MultipartFile file : fileList2) {
				// 파일의 확장자 가져오기
				fileName=file.getOriginalFilename();
				ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				
				// 확장자 붙여서 파일 전송하기
				fileName="in_"+unq+"_"+index+"."+ext;
				fulldir = uploadDir + "/"+fileName;
	            file.transferTo(new File(fulldir));
	            
				goodsImg += fileName + "/";
				index++;
			}
			
			// 마지막의 "/" 자르기
			thumbnail = thumbnail.substring(0, thumbnail.length() - 1);
			goodsImg = goodsImg.substring(0, goodsImg.length() - 1);
		}

		// 문자열 전달
		map.put("thumbnail",thumbnail);
		map.put("goodsImg",goodsImg);
		
		return map;
	}
	
	public Map<String,List<String>> getFiles(NikeVO vo) throws Exception {
		/* 업로드된 파일 가져오기 */
		// 파일 경로 설정
		int unq = vo.getUnq();
		String uploadDir="D:/project_ezen/eGovFrameDev-3.10.0-64bit/workspace/Team_A/Team_A/src/main/webapp/nike/goods";
		String goodsDir=uploadDir+"/"+unq;
		
		// 빈 리스트 생성
		List<String> fileList1= new ArrayList<>();	// thumbnail
		List<String> fileList2= new ArrayList<>();	// goodsImg
		
		// 전달할 map 객체 생성
		Map<String,List<String>> map = new HashMap<String,List<String>>();
		
		// 경로에서 파일 가져오기
		File imgFile = new File(goodsDir);
		File imgFiles[] = imgFile.listFiles();
		
		// 폴더내의 파일 수만큼 돌리기
		for(File file : imgFiles) {
			System.out.println(file.getName());
			String filename=file.getName();
			
			// th라고 붙은 파일들 -> fileList1에 넣기
			if(filename.contains("th")) fileList1.add(filename);
			
			// in이라고 붙은 파일들 -> fileList2에 넣기
			else if(filename.contains("in"))fileList2.add(filename);
			
			// 그 외의 것들은 오류
			else System.out.println("(오류 발생) 파일명 : "+filename);	
		}
		
		map.put("thumbnails",fileList1);
		map.put("goodsImgs",fileList2);
		
		return map;
	}
	
	//update
	public static Map<String,String> updateProcess(HttpServletRequest req,
									 MultipartHttpServletRequest multiRequest,
									 NikeVO vo) throws Exception {
		
		int unq=vo.getUnq();
		List<String> tList=vo.gettList();
		List<String> gList=vo.getgList();
		
		List<MultipartFile> fileList1=multiRequest.getFiles("thumbnails");
		List<MultipartFile> fileList2=multiRequest.getFiles("goodsImgs");
		
		Map<String,String> map = new HashMap<String,String>();
		
		String uploadDir="D:/project_ezen/eGovFrameDev-3.10.0-64bit/workspace/Team_A/Team_A/src/main/webapp/nike/goods";
		String tmpDir=uploadDir+"/tmp";
		uploadDir=uploadDir+"/"+unq;

		String fileName="";			// 파일명
		String newName="";			// 변경한 파일명
		String ext="";				// 확장자
		String fulldir = "";		// 파일명 포함한 저장 경로
		
		// DB 저장용 (vo에 실을 예정)
		String thumbnail = "";
		String goodsImg = "";
		
		// 임시 폴더 생성
		File tmp = new File(tmpDir);
		if(!tmp.exists()) tmp.mkdir();

		int index=0;
		for(int i=0;i<tList.size();i++) {
			if(tList.get(i).contains("(#n#e#w#)indexNum")) {
				MultipartFile file = fileList1.get(index);
				fileName=file.getOriginalFilename();
				ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				
				// 확장자 붙여서 파일 전송하기
				newName="th_"+unq+"_"+(i+1)+"."+ext;
				fulldir = tmpDir + "/"+newName;
				file.transferTo(new File(fulldir));
				thumbnail += newName + "/";
				index++;
			} else {
				fileName=tList.get(i);
				File file=new File(uploadDir+"/"+fileName);
				ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				newName="th_"+unq+"_"+(i+1)+"."+ext;
				
				fulldir = tmpDir + "/"+newName;
				file.renameTo(new File(fulldir));
				thumbnail += newName+ "/";
			}


		}
		
		index=0;
		for(int i=0;i<gList.size();i++) {
			if(gList.get(i).contains("(#n#e#w#)indexNum")) {
				MultipartFile file = fileList2.get(index);
				fileName=file.getOriginalFilename();
				ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				
				// 확장자 붙여서 파일 전송하기
				newName="in_"+unq+"_"+(i+1)+"."+ext;
				fulldir = tmpDir + "/"+newName;
				file.transferTo(new File(fulldir));
				goodsImg += newName + "/";
				index++;
			} else {
				fileName=gList.get(i);
				File file=new File(uploadDir+"/"+fileName);
				ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				newName="in_"+unq+"_"+(i+1)+"."+ext;
				
				fulldir = tmpDir + "/"+newName;
				file.renameTo(new File(fulldir));
				goodsImg += newName+ "/";
			}
		}
		
		thumbnail = thumbnail.substring(0, thumbnail.length() - 1);
		goodsImg = goodsImg.substring(0, goodsImg.length() - 1);
		
		// 임시폴더 -> 본래 폴더
		File tmpFiles = new File(tmpDir);
		File tmpList[] = tmpFiles.listFiles();
		
		for(int i=0;i<tmpList.length;i++) {
			String filename=tmpList[i].getName();
			tmpList[i].renameTo(new File(uploadDir+"/"+filename));
		}
		
		// 문자열 전달
		map.put("thumbnail",thumbnail);
		map.put("goodsImg",goodsImg);
		
		return map;
	}
	
	public int deleteDirProcess(NikeVO vo) {
		String uploadDir="D:/project_ezen/eGovFrameDev-3.10.0-64bit/workspace/Team_A/Team_A/src/main/webapp/nike/goods";
		String dir=uploadDir+"/"+vo.getUnq();
		File upload=new File(dir);
		File fileList[]=upload.listFiles();
		
		String filename="";
		String fullDir="";
		
		int errCount=0;
		
		for(int i=0;i<fileList.length;i++) {
			filename=fileList[i].getName();
			fullDir=dir+"/"+filename;
			
			System.out.println(fullDir);
			File delFile=new File(fullDir);

			// 오류가 생긴 경우는?
			if(delFile.exists()) delFile.delete();
			else errCount+=1;
		}
		
		File delDir= new File(dir);
		if(delDir.exists()) delDir.delete();
		else errCount+=1;
		
		return errCount;
	}
	
	public String deleteFile(NikeVO vo) {
		String msg="delOk";
		String dir="D:/project_ezen/eGovFrameDev-3.10.0-64bit/workspace/Team_A/Team_A/src/main/webapp/nike/goods";
		int unq=vo.getUnq();
		String filename=vo.getFilename();

		String fulldir=dir+"/"+unq+"/"+filename;
		
		File delFile = new File(fulldir);
		
		if(delFile.exists()) delFile.delete();
		else msg="delFail";
		return msg;
	}
}



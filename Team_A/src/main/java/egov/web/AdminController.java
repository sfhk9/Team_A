package egov.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
		String target = "Write";
		int unq=adminService.selectLastGoodsUnq(vo);
		
		try {
			// 여기서 예외발생 == unq.nextval이 실행된적이 없다는 것
			//unq=
		} catch(Exception e) {
			System.out.println(e.getMessage() + "에서 예외를 받았습니다.");
		}
		
		Map<String,String> map = uploadProcess(multiRequest,target,unq);
		
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
		NikeVO goodsinfo=adminService.selectGoodsInfo(vo.getUnq());
		goodsinfo.setColor(goodsinfo.getColor().replaceAll("/", ","));
		
		goodsinfo.setInfo(goodsinfo.getInfo().replaceAll("\n", "<br>"));
		model.addAttribute("goodsinfo",goodsinfo);
		return "nike/nikeweb/admin/adminGoodsDetail";
	}
	
	@RequestMapping("adminGoodsModify.do")
	public String adminGoodsModify(NikeVO vo,Model model) throws Exception{
		// admin 세션 검사 하기
		
		NikeVO goodsinfo=adminService.selectGoodsInfo2(vo.getUnq());
		goodsinfo.setCsize(goodsinfo.getCsize().replaceAll("/", ","));
		goodsinfo.setColor(goodsinfo.getColor().replaceAll("/", ","));
		
		model.addAttribute("goodsinfo",goodsinfo);
		return "nike/nikeweb/admin/adminGoodsModify";
	}
	
	@RequestMapping("adminGoodsModifySave.do")
	@ResponseBody
	public String updateGoodsInfo(MultipartHttpServletRequest multiRequest,
			  					  NikeVO vo) throws Exception{
		// admin 세션 검사 하기
		
		String msg="ok";
		String target = "Modify";
		int unq=adminService.selectLastGoodsUnq(vo);
		try {
			// 여기서 예외발생 == unq.nextval이 실행된적이 없다는 것
			//unq=
		} catch(Exception e) {
			System.out.println(e.getMessage() + "에서 예외를 받았습니다.");
		}

		Map<String,String> map = uploadProcess(multiRequest,target,unq);
		
		
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
	
	// 파일 업로드 함수
	public static Map<String,String> uploadProcess(MultipartHttpServletRequest multiRequest,
			   									   String target, 
												   int unq_int) throws Exception {
		
		List<MultipartFile> fileList1=multiRequest.getFiles("thumbnails");
		List<MultipartFile> fileList2=multiRequest.getFiles("goodsImgs");
		
		Map<String,String> map = new HashMap<String,String>();
		
		String uploadDir="D:/project_ezen/eGovFrameDev-3.10.0-64bit/workspace/Team_A/Team_A/src/main/webapp/nike/goods";
		String tmpDir=uploadDir+"/tmp";	
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
		

		// 파일리스트가 비어있다면 -> 문자열만 전송하기 (오류)
		if(fileList1.isEmpty()||fileList2.isEmpty()){
			map.put("isEmpty","empty");

		// (상품 등록시) 경로가 존재하면 -> 문자열만 전송하기 (오류)
		} else if (target=="Write"&&dirname.exists()) {
				map.put("isDirExist","exist");
				
		// (정보 수정시) 해당 unq의 경로가 존재하지 않는다면 -> 문자열만 전송하기 (오류)
		} else if (target=="Modify"&&!dirname.exists()) {
			map.put("isDirExist","notExist");
			
		// 파일리스트에 이미지가 있으면 -> 경로 생성 / 파일 전송 / 문자열 전송
		} else {

			// (상품 등록시) 경로 생성;	
			if(target=="Write") dirname.mkdirs();
			
			// 폴더째로 복사하기
			

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
				thumbnail += file.getOriginalFilename() + "/";
				
				if(target=="Modify") {
					// 임시경로 파일 지우기
				}
				
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
	            
				goodsImg += file.getOriginalFilename() + "/";
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
	
}



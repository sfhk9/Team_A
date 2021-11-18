package egov.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import egov.service.FileService;
import egov.service.FileVO;

@Controller
public class FileController {

	
	
	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;
	
	@Resource(name = "fileService")
	FileService fileService;
	
	@RequestMapping("fileboardWrite.do")
	public String fileboardWrite() {

		return "admin/fileWrite";
	}

	@RequestMapping("fileboardWriteSave.do")
	@ResponseBody
	public String insertFileboard( MultipartHttpServletRequest multiRequest, FileVO vo ) 
																			throws Exception {
		Map<String,String> map1 = uploadProcess(multiRequest);
		
		vo.setFilename(map1.get("f1"));
		vo.setFilesize(map1.get("f2"));
		
		String result = fileService.insertFileboard(vo);
	
		String message = "ok";
		
		if( result != null ) message = "error"; 
		//map.put("filename", filename);
		//map.put("cnt", Integer.toString(cnt));
		//System.out.println("filename :::: " + filename);

		return message;
	}
	
	@RequestMapping("fileboardDetail.do")
	public String selectFileboardDetail( FileVO vo, Model model ) throws Exception {
		
		// 상세보기 서비스 실행
		vo = fileService.selectFileboardDetail(vo);
		
		String content = vo.getContent();
		if( content != null ) {
			content = content.replace("\n", "<br>");
			content = content.replace(" ", "&nbsp;");
			vo.setContent(content);
		}

		// 화면으로 전송                    
		model.addAttribute("vo",vo);
		
		return "admin/fileDetail";
	}
	
	
	@RequestMapping("fileboardList.do")
	public String selectFileboardList( FileVO vo, Model model ) 
															throws Exception {
		// 출력페이지 번호 가져오기
		int page_no = vo.getPage_no();
		
		// 출력페이지 번호를 이용하여 SQL의 출력 범위 설정
		// 1p->1, 2p->11, 3p->21
		int s_no = (page_no-1)*10 + 1 ;
		int e_no = s_no + (10-1);
		
		// s_no 변수와 e_no 변수의 vo 세팅
		vo.setS_no(s_no);
		vo.setE_no(e_no);
		
		// 목록 출력 서비스 실행
		List<?> list = fileService.selectFileboardList(vo);
		
		// 총 데이터 값을 얻는 서비스 실행 
		int total = fileService.selectFileboardTotal(vo);
		
		// 총 페이지 값을 얻는 설정(세팅)
		// 17개 (2페이지의 결과);; (double)17/10 ->ceil(1.7) -> (int)2.0  -> 2
		int total_page =  (int) Math.ceil((double)total/10);
		
		// 출력 페이지의 시작 행번호
		int rownum = total - (page_no-1)*10;
		
		vo.setTotal(total);
		vo.setTotal_page(total_page);
		vo.setRownum(rownum);

		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		
		return "admin/fileList";
	}

	public static Map<String,String> uploadProcess( MultipartHttpServletRequest multiRequest ) 
															throws Exception {
		MultipartFile file;
		String save_dir = "D:/바탕화면/eGovFrameDev-3.10.0-64bit/workspace/apple1/src/main/webapp/upload";
		String save_file  = "";
		String filenames = "";
		String filesizes = "";
		
		Map<String, String> map = new HashMap<String, String>();

		File dirname = new File(save_dir);  // 물리적인 위치로 인식
		if (!dirname.exists()) dirname.mkdirs();
		
		//   업로드 파일 인식 ;;;   files : 파일이름(오리지널,암호화된이름),파일크기,파일종류 
		//   /tmp 디렉토리에 임시시장 ( abc.jpg -> xxxefsdf.sdfdf)
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		// 다중
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			if (!"".equals(file.getOriginalFilename())) {
				save_file = save_dir + "/" + file.getOriginalFilename();
				file.transferTo(new File(save_file));
				filenames += file.getOriginalFilename() + "／";
				filesizes += file.getSize() + "／";
			}
		}
		
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("f1",filenames);
		map1.put("f2",filesizes);
	
		return map1;
	}
	
	@RequestMapping(value = "/downloadFile.do")
	public void downloadFile(   String requestedFile,
								HttpServletResponse response) throws Exception {
		
		String uploadPath = "D:/바탕화면/eGovFrameDev-3.10.0-64bit/workspace/apple1/src/main/webapp/upload";
		File uFile = new File(uploadPath, requestedFile);
		int fSize = (int) uFile.length();

		if (fSize > 0) {
		
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(uFile));
			// String mimetype = servletContext.getMimeType(requestedFile);
			String mimetype = "text/html";
			
			response.setBufferSize(fSize);
			response.setContentType(mimetype);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + requestedFile + "\"");
			response.setContentLength(fSize);
			FileCopyUtils.copy(in, response.getOutputStream());
			in.close();
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} else {
			//setContentType을 프로젝트 환경에 맞추어 변경
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>"+ requestedFile + "</h2>");
			printwriter.println("<br><br><br><center><h3><a href='javascripｔ: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>© webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}
	
	
}




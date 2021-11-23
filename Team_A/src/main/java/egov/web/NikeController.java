package egov.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.service.FileService;
import egov.service.NikeService;

@Controller
public class NikeController {

	@Resource(name = "nikeService")
	NikeService nikeService;
	
	@RequestMapping("test.do")
	public String test() throws Exception {
		
		System.out.println("hi");
		
		return "";
	}
	
	
}

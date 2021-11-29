package egov.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.service.NikeService;

@Controller
public class NikeController {

	@Resource(name = "nikeService")
	NikeService nikeService;
	
	@RequestMapping("goodsList.do")
	public String goodsList() {
		return "nike/goodsList";
	}


}

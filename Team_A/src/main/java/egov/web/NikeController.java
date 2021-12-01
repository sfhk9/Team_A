package egov.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.service.NikeService;
import egov.service.NikeVO;

@Controller
public class NikeController {

	@Resource(name = "nikeService")
	NikeService nikeService;
	
	@RequestMapping("goodsList.do")
	public String goodsList( NikeVO vo, Model model ) throws Exception {
		
		List<?> list = nikeService.selectGoodsList(vo);
		
		model.addAttribute("list",list); 
		
		return "nike/goodsList";
	}

	

}

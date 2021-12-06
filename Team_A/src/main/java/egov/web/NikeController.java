package egov.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("goodsDetail.do")
	public String goodsDetail() throws Exception {

		return "nike/goodsDetail";
	}

	@RequestMapping("joinWrite.do")
	public String joinWrite() throws Exception{
		
		return "nike/member/join_r";
	}
	
	@RequestMapping("joinWriteSave.do")
	@ResponseBody
	public String joinWriteSave( NikeVO vo  ) throws Exception {
		
		String msg = "ok";
		String result = nikeService.insertJoin(vo);
		if(result != null) msg = "save_fail";
		
		return msg;
	}
}

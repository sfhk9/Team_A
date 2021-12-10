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
		
		//ctgtype=LIF,SPT,&ctggender=M,&color=white,red,
		
		// 타입
		String[] ctgtype;
		String ctgtype_sql = "( ";
			if ( vo.getCtgtype() != null ) {
				ctgtype = vo.getCtgtype().split(",");
	
				for (int i=0; i<ctgtype.length; i++) {
					ctgtype_sql += "ctgtype LIKE'%" + ctgtype[i] + "%'";
					
					if ( ctgtype.length-1 != i ) {
						ctgtype_sql += " or ";
					} else {
						ctgtype_sql += " )";
					}
					
				}
			}
		// ( CTGTYPE like '%LIF%' or CTGTYPE like '%SPT%' )
			
			
		// 사이즈
		String[] csize;
		String csize_sql = "( ";
			if ( vo.getCsize() != null ) {
				csize = vo.getCsize().split(",");
	
				for (int i=0; i<csize.length; i++) {
					csize_sql += "csize LIKE'%" + csize[i] + "%'";
					
					if ( csize.length-1 != i ) {
						csize_sql += " or ";
					} else {
						csize_sql += " )";
					}
					
				}
			}
		
		// 색상
		String[] color;
		String color_sql = "( ";
			if ( vo.getColor() != null ) {
				color = vo.getColor().split(",");
	
				for (int i=0; i<color.length; i++) {
					color_sql += "color LIKE'%" + color[i] + "%'";
					
					if ( color.length-1 != i ) {
						color_sql += " or ";
					} else {
						color_sql += " )";
					}
					
				}
			}

		String sql = "";

		
			if ( !ctgtype_sql.equals("( ") ) {
				sql += "and" + ctgtype_sql;
			}
			if ( !csize_sql.equals("( ") ) {
				sql += "and" +  csize_sql;
			}
			if ( !color_sql.equals("( ") ) {
				sql += "and" +  color_sql;
			}
			
			if ( !sql.equals("") ) {
				vo.setSql(sql);
			}

		
		System.out.println( vo.getSql() + "  sql!!!" );
		
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

package egov.web;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.service.NikeService;
import egov.service.NikeVO;

@Controller
public class NikeController {

	@Resource(name = "nikeService")
	NikeService nikeService;
	
	
	
	@RequestMapping("goodsList.do")
	public String goodsList( NikeVO vo, Model model ) throws Exception {
		
		String sql = getSetSql(vo);
		
		System.out.println( sql + "  sql!!!" );
		
		List<?> list = nikeService.selectGoodsList(vo);
		
		System.out.println("리스트"+list);
  
		model.addAttribute("list",list);
		
		return "nike/goodsList";
	}
	
	@RequestMapping("goodsListAdd.do")
	@ResponseBody
	public List<?> goodsListAdd( NikeVO vo, Model model ) throws Exception {
		
		// 현재 출력할 페이지 번호
		int page_no = vo.getPage_no();

		int s_no = ((page_no - 1) * 12) + 1;
		int e_no = s_no + (12-1);
		
		vo.setS_no(s_no);
		vo.setE_no(e_no);
		/////
		
		//sql 확인
		String sql = getSetSql(vo);
		System.out.println( sql + "  sql!!!" );
		///
		
		List<?> list = nikeService.selectGoodsList(vo);
		return list;
	}
	
	
	// sql 작성 함수
	public String getSetSql( NikeVO vo ) {

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

		String ctggender;	
		String ctggender_sql = "( ";
		if ( vo.getCtggender() != null ) {
			ctggender = vo.getCtggender();
			ctggender_sql += "ctggender LIKE'%" + ctggender + "%'";	//남여
			ctggender_sql += "or ctggender LIKE '%N%' )";	//무관 추가
		}
		
		int pricemin = 0;	
		int pricemax = 0;
		String price_sql = "( ";
		if ( vo.getPricemin() != 0 || vo.getPricemax() != 0) {
			pricemin = vo.getPricemin();
			pricemax = vo.getPricemax();
			if ( pricemax > pricemin) {
				price_sql += "price BETWEEN " + pricemin + " and " + pricemax + " )";	
			} else if ( pricemin > pricemax ) {
				price_sql += "price BETWEEN " + pricemax + " and " + pricemin + " )";	
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
				sql += " and " + ctgtype_sql;
			}
			
			if ( !ctggender_sql.equals("( ") ) {
				sql += " and " + ctggender_sql;
			}
			
			if ( !price_sql.equals("( ") ) {
				sql += " and " + price_sql;
			}
			
			if ( !color_sql.equals("( ") ) {
				sql += " and " + color_sql;
			}
			
			if ( !sql.equals("") ) {
				vo.setSql(sql);
			}

		
		return vo.getSql();
		
	}
	

	@RequestMapping("goodsDetail.do")
	public String goodsDetail(NikeVO vo, Model model) throws Exception {
		
		// 조회수 증가 서비스 실행
		nikeService.updateGoodsInfoHits(vo);
		
		//상세보기 서비스 실행
		vo = nikeService.selectGoodsDetail(vo);
		model.addAttribute("vo",vo);
		
		return "nike/goodsDetail";
	}

	
	@RequestMapping("Login.do")
	public String Login() throws Exception{
		
		return "nike/member/login2_r";
	}
	
	@RequestMapping("joinAgree.do")
	public String joinAgree() throws Exception{
		return "nike/member/join_agree_r";
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

class Item {
	private int id;
	private String value;
	public Item(int id, String value) {
	    this.id = id;
	    this.value = value;
	}
	
	public int getId() {
	    return id;
	}
	
	public String getValue() {
	    return value;
	}
}

package egov.web;


import java.util.List;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egov.service.NikeService;
import egov.service.NikeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class NikeController {

	@Resource(name = "nikeService")
	NikeService nikeService;
	
	@RequestMapping("index.do")
	public String mainpage( Model model ) throws Exception {

		List<?> listNew = nikeService.selectNewGoodsList();
		List<?> listHit = nikeService.selectHitGoodsList();
		List<?> listSal = nikeService.selectSalGoodsList();

		//디버그용
		System.out.println("리스트");

		model.addAttribute("listNew",listNew);
		model.addAttribute("listHit",listHit);
		model.addAttribute("listSal",listSal);
		
		return "nike/nikeweb/index";
	}
	
	@RequestMapping("goodsList.do")
	public String goodsList( NikeVO vo, Model model ) throws Exception {
		
		model.addAttribute("goodsname",vo.getGoodsname() );

		return "nike/nikeweb/goodsList";
	}
	
	@RequestMapping("addList.do")
	public String addList( NikeVO vo, Model model ) throws Exception {
		
		// 현재 출력할 페이지 번호
		int pageno = vo.getPage_no();

		int s_no = ((pageno - 1) * 12) + 1;
		int e_no = s_no + (12-1);
	
		vo.setS_no(s_no);
		vo.setE_no(e_no);
		/////
		
		// 디버그용
		String sql = getSetSql(vo);
		System.out.println( sql + "  sql!!!" );
		///
		
		List<?> list = nikeService.selectGoodsList(vo);
		int total = nikeService.selectGoodsTotal(vo);
		
		int total_page = (int) Math.ceil( (double)total/12 );
		
		System.out.println("pageno"+pageno);
		System.out.println("리스트"+list);
		  
		model.addAttribute("total",total);
		model.addAttribute("s_no",s_no);
		model.addAttribute("e_no",e_no);
		
		model.addAttribute("total_page",total_page);
		model.addAttribute("list",list);
		model.addAttribute("pageno",pageno);
		
		return "nike/nikeweb/subList";
	}
	

	
	// sql 작성 함수
	public String getSetSql( NikeVO vo ) {

		//ctgtype=LIF,SPT,&ctggender=M,&color=white,red,
		
		// 이름 ////////////////////////////////////////
		String goodsname;
		String goodsname_sql = "( ";
			if ( vo.getGoodsname() != null ) {
				goodsname = vo.getGoodsname();
				
				goodsname_sql += " name LIKE'%" + goodsname + "%' )";
			}
		// 타입 ////////////////////////////////////////
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
		// 성별 ////////////////////////////////////////
		String ctggender;	
		String ctggender_sql = "( ";
			if ( vo.getCtggender() != null ) {
				ctggender = vo.getCtggender();
				ctggender_sql += "ctggender LIKE'%" + ctggender + "%'";	//남여
				ctggender_sql += "or ctggender LIKE '%N%' )";	//무관 추가
			}
		// 가격 ////////////////////////////////////////
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
		// 색상 ////////////////////////////////////////
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

			
		/////////////////////////////////////////////////	
		/////////////////////////////////////////////////			
			
			
		String sql = "";
			
			if ( !goodsname_sql.equals("( ") ) {
				sql += " and " + goodsname_sql;
			}
			
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

		//디버그용
		System.out.println(vo.getSql());
		
		return vo.getSql();
		
	}
	

	@RequestMapping("goodsDetail.do")
	public String goodsDetail(NikeVO vo, Model model) throws Exception {
		
		// 조회수 증가 서비스 실행
		nikeService.updateGoodsInfoHits(vo);
		
		//상세보기 서비스 실행
		vo = nikeService.selectGoodsDetail(vo);
		
		//리뷰관련 서비스 실행
		List<?> comm_list = nikeService.selectCommList(vo);
		
		//리뷰 갯수
		int review_cnt = nikeService.selectReviewCnt(vo);
		
		model.addAttribute("vo",vo);
		model.addAttribute("comm_list",comm_list);
		model.addAttribute("review_cnt",review_cnt);
		
		return "nike/nikeweb/goodsDetail";
	}
	@RequestMapping("detailTab1.do")
	public String detailTab1(NikeVO vo, Model model) throws Exception {
		
		vo = nikeService.selectTab1(vo);
		model.addAttribute("vo",vo);
		
		return "nike/detailTab1";
	}

	
	@RequestMapping("mainPage.do")
	public String mainList( NikeVO vo, Model model ) throws Exception {
		
		//sql 확인
		String sql = getSetSql(vo);
		System.out.println( sql + "  sql!!!" );
		///
		
		List<?> list = nikeService.selectGoodsList(vo);
		int total = nikeService.selectGoodsTotal(vo);
		
		int total_page = (int) Math.ceil( (double)total/12 );
		
		System.out.println("리스트"+list);
  
		model.addAttribute("list",list);
		model.addAttribute("total",total);
		model.addAttribute("total_page",total_page);
		
		return "nike/nikeweb/index-2";
	}
	
	@RequestMapping("joinAgree.do")
	public String joinAgree() throws Exception{
		return "nike/member/join_agree_r";
	}

	@RequestMapping("joinWrite.do")
	public String joinWrite() {
		
		return "nike/nikeweb/login-register";
	}
	
	@RequestMapping("joinWriteSave.do")
	@ResponseBody
	public String insertJoin( NikeVO vo ) throws Exception {
		
		String msg = "ok";
		int chk = nikeService.selectIdCheck(vo.getUserid());
		
		if( chk == 0 ) {
			String result = nikeService.insertJoin(vo);
			if( result != null ) {
				msg = "save_fail";
			}
		} else { msg = "er1";  }
		
		return msg;
	} 
	
	@RequestMapping("memberModifySave.do")
	@ResponseBody
	public String updateMember( NikeVO vo, HttpSession session ) throws Exception {
		
		String msg = "ok";
		
		String userid = (String)session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		/*
		 *  회원 아이디/암호 일치 검사;; userid + pass
		 */
		int cnt = nikeService.selectMemberCertify(vo);
		
		if( cnt == 0 ) {
			msg = "er1";
		} else {	
	
		    int result = nikeService.updateMember(vo);
			if( result == 0 ) {
				msg = "save_fail";
			}
		} 
		
		return msg;
	} 
	
	@RequestMapping("memberModify.do")
	public String selectMemberDetail(NikeVO vo , 
									 HttpSession session ,
									 Model model ) throws Exception {
		
		String userid = (String)session.getAttribute("MemberSessionId");
		vo.setUserid(userid);

		vo = nikeService.selectMemberDetail(vo);
		model.addAttribute("vo",vo);
		
		return "nike/nikeweb/my-account";
	}

	
	@RequestMapping("id_check.do")
	@ResponseBody
	public String selectMemberIdCheck( String userid ) throws Exception {
		
		String msg = "ok";
		// 아이디 : 맨앞 첫글자 영문, 총길이 4 ~ 12; 
		String pattern = "^[a-zA-Z]{1}[a-zA-Z0-9_-]{3,11}";
		boolean chk = userid.matches(pattern);  // true, false;
		
		if( chk == false ) {
			msg = "er1";
		} else {
			int result = nikeService.selectIdCheck(userid);
			if( result > 0 ) {
				msg = "er2";
			}
		}
		return msg;
	}
	
	
	@RequestMapping("loginWrite.do")
	public String loginWrite() {
		
		return "nike/nikeweb/login-register";
	}
	
	

	@RequestMapping("logout.do")
	@ResponseBody
	public String logout(HttpSession session) {	
		session.removeAttribute("MemberSessionId");	
		return "ok";
	}
	
	@RequestMapping("loginCertify.do")
	@ResponseBody
	public String selectMemberCertify(NikeVO vo, HttpSession session) throws Exception {
		
		String msg = "ok";
		
		int cnt = nikeService.selectMemberCertify(vo);
		
		if(cnt == 0) {
			msg = "er1";
		} else if( cnt == 1 ) {
			session.setAttribute("MemberSessionId", vo.getUserid());			
		}
		
		return msg;
	}
	@RequestMapping("findInfo.do")
	public String findInfo() throws Exception{
		
		return "nike/member/find_info_r";
	}
	
	@RequestMapping("myPage.do")
	public String myPage() throws Exception{
		
		return "nike/mypage";
	}
	
	@RequestMapping("cart.do")
	public String cart(NikeVO vo, Model model,HttpSession session) throws Exception{
		String userid = (String) session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		List<?> list = nikeService.selectCartList(vo);
		model.addAttribute("list",list);
		
		return "nike/nikeweb/cart-page";
	}
	
	@RequestMapping("cartSave.do")
	@ResponseBody
	public String updateCartList(@RequestBody String jsonList, NikeVO vo) throws Exception{	
		String msg="ok";
		int unq=0;		// cart 테이블 unq
		int qty=0;		// cart 테이블 qty
		int result=0;	// cart 한 상품에 대한 sql 결과 저장
		int cnt=0;		// cart 전체 update or delete 결과
		
		// 객체 생성
		ObjectMapper mapper = new ObjectMapper();
		// JSON String -> LinkedHashMap 변환
		List<NikeVO> readList=mapper.readValue(jsonList, List.class);
		// LinkedHashMap -> ArrayList 변환
		List<NikeVO> convertList = mapper.convertValue(readList,new TypeReference<List<NikeVO>>(){});
		
		for(int i=0;i<convertList.size();i++) {
			// i번째 리스트에서 unq, qty 추출
			unq=convertList.get(i).getUnq();
			qty=convertList.get(i).getQty();
			
			// 추출한 unq, qty를 VO에 셋팅
			vo.setUnq(unq);
			vo.setQty(qty);
			
			// qty = 0 -> 항목 삭제 / qty > 0 -> 수량 변경
		    if(qty==0) { 
		    	result=nikeService.deleteCartList(vo); cnt+=result; 
		    } else if(qty>0) { 
		    	result=nikeService.updateCartList(vo); cnt+=result; 
		    } else {
		    	msg="err1";
		    }
			 
		}
		
		// 전체 update or delete 중 누락된 경우 (오류가 발생한 경우)
		if(cnt<convertList.size()) {
			msg="err2";
		}
		
		return msg;
	}
	
	@RequestMapping("cartClear.do")
	@ResponseBody
	public String deleteAllCartList(HttpSession session, NikeVO vo) throws Exception{
		String msg="ok";
		
		String userid = (String) session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		int cnt=nikeService.selectCartListCnt(vo);
		int result=nikeService.deleteAllCartList(vo);
		
		if(cnt==0) msg="er1";
		else if(result!=cnt) msg="er2";

		return msg;
	}
	
	@RequestMapping("checkout.do")
	public String selectCheckout(HttpSession session, NikeVO vo, Model model) throws Exception{
		String userid = (String) session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		List<?> list=nikeService.selectCheckout(vo);		
		NikeVO userinfo = nikeService.selectMemberDetail(vo);
		
		model.addAttribute("list",list);
		model.addAttribute("vo",userinfo);
		return "nike/nikeweb/checkout";
	}
	
	@RequestMapping("checkoutSave.do")
	@ResponseBody
	public String insertOrderList(HttpSession session, NikeVO vo) throws Exception{
		String msg="ok";
		String result="";
		int resultCnt=0;

		String userid = (String) session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		// 상품 가져오기
		List<?> list=nikeService.selectCheckout(vo);
		int cnt=nikeService.selectCartListCnt(vo);	
		
		// 만약 리스트 가져오는 도중 문제가 발생했다면?
		
		// 반복문 돌리기
		for(Object object:list) {
			EgovMap item = (EgovMap) object;
			String name = (String) item.get("name");
			String goodsunq = (String) item.get("goodsunq");
			String csize = (String) item.get("csize");
			String color = (String) item.get("color");
			vo.setName(name);
			vo.setName(goodsunq);
			vo.setCsize(csize);
			vo.setName(color);
			
			//result=nikeService.insertOrderList(vo);

			if(result!=null) resultCnt+=1;
		}
		
		if(cnt!=resultCnt) msg="er1";
		
		return msg;
	}
	
	@RequestMapping("wishList.do")
	@ResponseBody
	public String selectWishList(HttpSession session, NikeVO vo, HttpServletRequest request) throws Exception{
		String userid = (String) session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		int wishCnt = nikeService.selectCartListCnt(vo);
		//List<?> wishList = nikeService.selectCartList(vo);
		
		request.setAttribute("wishCnt",wishCnt);
		//model.addAttribute("wishList",wishList);
		
		return "ok";
	}
	
	@RequestMapping("contact.do")
	public String contact(NikeVO vo, Model model) throws Exception{

		return "nike/nikeweb/contact";
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

package egov.web;


import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
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
	
	//메인페이지
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
	
	//상품 리스트
	@RequestMapping("goodsList.do")
	public String goodsList( NikeVO vo, Model model ) throws Exception {
		
		model.addAttribute("goodsname",vo.getGoodsname() );

		return "nike/nikeweb/goodsList";
	}
	
	//상품 리스트 호출
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
		System.out.println( vo.getGoodsname() );
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
		
		model.addAttribute("goodsname",vo.getGoodsname());
		
		return "nike/nikeweb/subList";
	}
	

	
	//상품  리스트 호출 sql 작성 함수
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
		NikeVO goods = nikeService.selectGoodsDetail(vo);
		
		//리뷰관련 서비스 실행
		List<?> comm_list = nikeService.selectCommList(vo);
		
		//리뷰 갯수
		int review_cnt = nikeService.selectReviewCnt(vo);
		
		//상품 추천 리스트
		List<?> list = nikeService.selectHitGoodsList();
		
		// 상품 세일 관련
		List<?> saleOff = nikeService.selectGoodsList(vo);
		
		model.addAttribute("off",goods.getOff() );
		model.addAttribute("goods",goods);
		model.addAttribute("comm_list",comm_list);
		model.addAttribute("review_cnt",review_cnt);
		model.addAttribute("list",list);
		model.addAttribute("saleOff",saleOff);
		
		return "nike/nikeweb/goodsDetail";
	}
	
	@RequestMapping("detailReviewSave.do")
	@ResponseBody
	public String insertReview( NikeVO vo, HttpSession session ) throws Exception {
		
		String userid = (String)session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		String msg = "ok";
		
		// 저장 서비스 실행
		String result = nikeService.insertReview(vo);
		if( result != null ) msg = "save_fail"; 
		
		return msg;
	}
	
	@RequestMapping("sendCart.do")
	@ResponseBody
	public String insertCart( NikeVO vo, HttpSession session ) throws Exception {
		
		String userid = (String)session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		String msg = "ok"	;
		
		// 저장 서비스 실행
		String result = nikeService.insertCart(vo);
		if( result != null ) msg = "save_fail"; 
		
		return msg;
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
	
	
	@RequestMapping("adminLogin.do")
	public String adminLogoin() {
		
		return "nike/nikeweb/admin/adminLogin";
	}
	@RequestMapping("adminCertify.do")
	@ResponseBody
	public String selectAdminCertify(NikeVO vo, HttpSession session) throws Exception {
		
		String msg = "ok";
		
		int cnt = nikeService.selectAdminCertify(vo);
		
		if(cnt == 0) {
			msg = "er1";
		} else if( cnt == 1 ) {
			session.setAttribute("AdminSessionId", vo.getAdminid());			
		}
		
		return msg;
	}
	@RequestMapping("adminout.do")
	@ResponseBody
	public String adminout(HttpSession session) {	
		session.removeAttribute("AdminSessionId");	
		return "ok";
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
			session.setMaxInactiveInterval(3600);
		}
		
		return msg;
	}
	
	@RequestMapping("adminList.do")
	public String selectAdminList(  NikeVO vo , Model model )  
														throws Exception {
				// 출력페이비 번호 가져오기
				int page_no = vo.getPage_no();
				
				// 출력페이지 번호를 이용하여 SQL의 출력 범위 설정
				int s_no = (page_no-1)*10 + 1 ;
				int e_no = s_no + (10-1);
				
				// s_no 변수와 e_no 변수의 vo 셋팅
				vo.setS_no(s_no);
				vo.setE_no(e_no);
								
				// 목록 출력 서비스 실행		
				List<?> list = nikeService.selectGoodsList(vo);
				
				// 총 데이터 값 출력 서비스 실행
				int total = nikeService.selectGoodsTotal(vo);
				
				// 총 페이지 값을 얻는 설정(세팅)
				int total_page = (int) Math.ceil((double)total/10);
				
				// 출력 페이지의 시작 행 번호
				int rownum = total - (page_no-1)*10;
				
				vo.setTotal(total);
				vo.setTotal_page(total_page);
				vo.setRownum(rownum);
				
				model.addAttribute("vo",vo);
				model.addAttribute("list",list);
				model.addAttribute("total_page",total_page);
				
				model.addAttribute("s_field",vo.getS_field());
				model.addAttribute("s_text",vo.getS_text());
				
			
			    model.addAttribute("total",total); 
				model.addAttribute("rownum",rownum);
				 
						
		return "nike/nikeweb/admin/adminGoodsList";
	}
	
	@RequestMapping("adminListDelete.do")
	@ResponseBody
	public String deleteAdminList( NikeVO vo ) throws Exception {
		
		String msg = "ok";
		
		// 암호 확인 서비스 실행
		// pass_cnt -> 1
		int pass_cnt = nikeService.selectAdminPass(vo);
		
		if( pass_cnt == 1) {
			// 삭제 서비스 실행
			// result - > 1
			int result = nikeService.deleteAdminList(vo);
			
			if( result != 1) { // 삭제 실패
				msg = "delete_fail"; 
			} else if( result == 1) { // 삭제 성공
			
			}else {
				msg = "pass_fail"; // 암호 일치하지 않음
			}
			
			return msg;
			
		}
		return msg;
	
	}
	@RequestMapping("adminListAllDelete.do")
	@ResponseBody
	public String admin_nboardAllDelete( String values ) throws Exception {
		
		// 11,8,5,
		// delete from nboard where unq='11' or unq='8' or unq='5'; 
		// delete from nboard where unq in(11,8,5);
		
		// 11,5,
		// delete from nboard where unq='11' or unq='5'; 
		// delete from nboard where unq in('11','5');
		
		// delete from nboard where unq='11';
		// delete from nboard where unq='5';
		
		// 11,8,5,  -->  11,8,5
		values = values.substring(0,values.length()-1); 
		
		int result = nikeService.deleteAdminALL(values);
		System.out.println("result : " + result);
		
		String message = "ok";
		if( result == 0 ) message = "fail";
		return message;
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
		int deleteResult=0;
		int deleteCnt=0;

		String userid = (String) session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		// 상품 가져오기
		List<?> list=nikeService.selectCheckout(vo);
		int cnt=nikeService.selectCartListCnt(vo);	
		
		// 만약 리스트 가져오는 도중 문제가 발생했다면?
		
		// 반복문 돌리기
		for(Object object:list) {
			EgovMap item = (EgovMap) object;
			BigDecimal bigDecimalNumber = (BigDecimal) item.get("unq");
			int cartunq=bigDecimalNumber.intValue();
			bigDecimalNumber = (BigDecimal) item.get("goodsunq");
			int goodsunq = bigDecimalNumber.intValue();
			String csize = (String) item.get("csize");
			String color = (String) item.get("color");
			bigDecimalNumber = (BigDecimal) item.get("qty");
			int qty= bigDecimalNumber.intValue();
			vo.setGoodsunq(goodsunq);
			vo.setCsize(csize);
			vo.setColor(color);
			vo.setQty(qty);

			result=nikeService.insertOrderList(vo);
			vo.setUnq(cartunq);
			if(result==null) {
				if(result==null) resultCnt+=1;
				deleteResult = nikeService.deleteCartList(vo);
				if(deleteResult==1) deleteCnt+=1;
			}
		}
		
		// 장바구니 목록 삭제에 문제가 생긴 경우
		if(resultCnt!=deleteCnt) msg="er1";
		
		// 주문 접수에만 문제가 생긴 경우 (접수된 상품은 장바구니에서 삭제되고, 안된 상품은 장바구니에서 삭제 X인 경우)
		if((cnt!=resultCnt) && (resultCnt==deleteCnt)) msg="er2";
		
		// 주문 접수와 장바구니 목록 모두에 문제가 생긴 경우
		if((cnt!=resultCnt) && (resultCnt!=deleteCnt)) msg="er3";
		
		return msg;
	}
	
	@RequestMapping("cartCnt.do")
	@ResponseBody
	public String selectWishList(Model model, HttpSession session, NikeVO vo) throws Exception{
		String userid = (String) session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		int wishCnt = nikeService.selectCartListCnt(vo);
		String wishCnt_str=Integer.toString(wishCnt);
		
		return wishCnt_str;
	}
	
	@RequestMapping("contact.do")
	public String contact(NikeVO vo, Model model) throws Exception{

		return "nike/nikeweb/contact";
	}
	
	
	
	
	
	
	
	
	
	///////////////////////////////////
	//주문 목록
	@RequestMapping("orderList.do")
	public String selectOrderList(NikeVO vo, Model model,HttpSession session) throws Exception{
		
		String userid = (String) session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		List<?> list = nikeService.selectOrderList(vo);
		System.out.println(list);
		model.addAttribute("list",list);
		  
		return "nike/nikeweb/orderList";
	}
	
	@RequestMapping("complete.do")
	@ResponseBody
	public String UpdateOrderList(HttpSession session, NikeVO vo, HttpServletRequest request) throws Exception{
		
		String userid = (String) session.getAttribute("MemberSessionId");
		vo.setUserid(userid);
		
		String msg = "err";
		
	    int result = nikeService.updateOrderList(vo);
		if( result == 1 ) {
			msg = "ok";
		}
	
		
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

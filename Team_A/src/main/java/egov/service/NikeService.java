package egov.service;

import java.util.List;

public interface NikeService {

	//신상품 리스트 서비스
	List<?> selectNewGoodsList() throws Exception;
	//인기 상품 리스트 서비스
	List<?> selectHitGoodsList() throws Exception;
	//세일 상품 리스트서비스
	List<?> selectSalGoodsList() throws Exception;
	
	//상품 리스트 서비스
	List<?> selectGoodsList(NikeVO vo) throws Exception;
	
	//상품리스트 개수
	int selectGoodsTotal(NikeVO vo) throws Exception;
	
	// 회원 가입
	String insertJoin(NikeVO vo) throws Exception;
	
	// 상품 상세 보기
	NikeVO selectGoodsDetail(NikeVO vo) throws Exception;
	
	// 조회수 증가 서비스
	void updateGoodsInfoHits(NikeVO vo) throws Exception;
	
	// detail 댓글 저장 처리
	String insertReview(NikeVO vo) throws Exception;
	
	// detail -> 장바구니
	String insertCart(NikeVO vo) throws Exception;

	// Id 중복체크
	int selectIdCheck(String userid) throws Exception;

	// 로그인 검증
	int selectMemberCertify(NikeVO vo) throws Exception;
	
	// 회원정보 업데이트
	int updateMember(NikeVO vo) throws Exception;
	
	// 회원정보 수정
	NikeVO selectMemberDetail(NikeVO vo) throws Exception;

	// 리뷰 서비스
	List<?> selectCommList(NikeVO vo) throws Exception;
	
	// 리뷰 갯수
	int selectReviewCnt(NikeVO vo) throws Exception;

	// 장바구니 리스트
	List<?> selectCartList(NikeVO vo) throws Exception;
	
	// 장바구니 리스트 상품 수
	int selectCartListCnt(NikeVO vo) throws Exception;
	
	// 장바구니 항목 1개 수량 변경
	int updateCartList(NikeVO vo) throws Exception;

	// 장바구니 항목 1개 삭제
	int deleteCartList(NikeVO vo) throws Exception;

	// 장바구니 전체 비우기
	int deleteAllCartList(NikeVO vo) throws Exception;

	// 주문 결제 명세서
	List<?> selectCheckout(NikeVO vo) throws Exception;

	// 주문 접수
	String insertOrderList(NikeVO vo) throws Exception;

	// 관리자 로그인 검증
	int selectAdminCertify(NikeVO vo) throws Exception;
	
	// 관리자 암호 체크
	int selectAdminPass(NikeVO vo) throws Exception;
	
	// 관리자 상품리스트 삭제
	int deleteAdminList(NikeVO vo) throws Exception;
	
	// 관리자 상품리스트 올삭제
	int deleteAdminALL(String values) throws Exception;
	
	// 관리자 상품리스트
	List<?> adminGoodsList(NikeVO vo) throws Exception;
	
	// 주문목록 리스트
	List<?> selectOrderList(NikeVO vo) throws Exception;
	
	// 주문목록 거래완료 갱신 서비스
	int updateOrderList(NikeVO vo) throws Exception;
	 

}

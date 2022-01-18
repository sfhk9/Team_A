package egov.service;

public interface AdminService {

	// 상품 정보 등록
	String insertGoodsInfo(NikeVO vo) throws Exception;
	
	// 가장 최근 등록된 상품의 unq 검색
	int selectLastGoodsUnq(NikeVO vo) throws Exception;

	// GoodsInfo 정보 가져오기 (decode 처리한 화면 출력용 )
	NikeVO selectGoodsInfo(int unq) throws Exception;
	
	// GoodsInfo 정보 가져오기 (decode 없는 순수 DB 데이터)
	NikeVO selectGoodsInfo2(int unq) throws Exception;
}

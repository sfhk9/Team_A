package egov.service;

public interface AdminService {

	// 상품 정보 등록
	String insertGoodsInfo(NikeVO vo) throws Exception;
	
	// 가장 최근 등록된 상품의 unq 검색
	int selectLastGoodsUnq(NikeVO vo) throws Exception;
}

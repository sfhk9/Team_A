package egov.service;

import java.util.List;

public interface NikeService {

	//상품 리스트 서비스
	List<?> selectGoodsList(NikeVO vo) throws Exception;
	
	// 회원 가입
	String insertJoin(NikeVO vo) throws Exception;
	
	// 상품 상세 보기
	NikeVO selectGoodsDetail(NikeVO vo) throws Exception;
	
	// 조회수 증가 서비스
	void updateGoodsInfoHits(NikeVO vo) throws Exception;
	
	// detail Tab부분
	NikeVO selectTab1(NikeVO vo) throws Exception;
	

}

package egov.service;

public interface AdminService {

	// 상품 정보 등록
	String insertGoodsInfo(NikeVO vo) throws Exception;
	
	// 가장 최근 등록된 상품의 unq 검색
	int selectLastGoodsUnq(NikeVO vo) throws Exception;

	// 조회수 증가
	int updateGoodsInfoHits(int unq) throws Exception;
	
	// GoodsInfo 정보 가져오기 (decode 처리한 화면 출력용 )
	NikeVO selectGoodsInfo(int unq) throws Exception;
	
	// 상품 정보 가져오기 (decode 없는 순수 DB 데이터)
	NikeVO selectGoodsInfo2(int unq) throws Exception;

	// 상품정 보 삭제하기
	int deleteGoodsInfo(int unq) throws Exception;

	// 상품 이미지 목록 가져오기
	String selectImageList(NikeVO vo) throws Exception;

	// 상품 이미지 목록 수정
	int updateImageList(NikeVO vo) throws Exception;
	
	// 상품 정보 수정
	int updateGoodsInfo(NikeVO vo) throws Exception;

}

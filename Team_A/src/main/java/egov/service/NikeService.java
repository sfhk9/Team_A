package egov.service;

import java.util.List;

public interface NikeService {

	//상품 리스트 서비스
	List<?> selectGoodsList(NikeVO vo) throws Exception;

}

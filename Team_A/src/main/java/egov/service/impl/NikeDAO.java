package egov.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egov.service.NikeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("nikeDAO")
public class NikeDAO extends EgovAbstractDAO {

	
	public List<?> selectGoodsList(NikeVO vo) {
		return list("nikeDAO.selectGoodsList",vo);
	}

	public String insertJoin(NikeVO vo) {
		return (String) insert("nikeDAO.insertJoin",vo);
	}

	public NikeVO selectGoodsDetail(NikeVO vo) {
		return (NikeVO) select("nikeDAO.selectGoodsDetail",vo);
	}

}

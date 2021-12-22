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

<<<<<<< HEAD
	public int selectIdCheck(String userid) {
		return (int) select("nikeDAO.selectIdCheck",userid);
	}

	public int selectMemberCertify(NikeVO vo) {
		return (int) select("nikeDAO.selectMemberCertify",vo);
=======
	public void updateGoodsInfoHits(NikeVO vo) {
		update("nikeDAO.updateGoodsInfoHits",vo);
>>>>>>> branch 'master' of https://github.com/sfhk9/Team_A.git
	}

}

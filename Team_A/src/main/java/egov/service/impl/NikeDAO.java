package egov.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egov.service.NikeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("nikeDAO")
public class NikeDAO extends EgovAbstractDAO {

	public List<?> selectHitGoodsList() {
		return list("nikeDAO.selectHitGoodsList");
	}
	
	public List<?> selectGoodsList(NikeVO vo) {
		return list("nikeDAO.selectGoodsList",vo);
	}

	public String insertJoin(NikeVO vo) {
		return (String) insert("nikeDAO.insertJoin",vo);
	}

	public NikeVO selectGoodsDetail(NikeVO vo) {
		return (NikeVO) select("nikeDAO.selectGoodsDetail",vo);
	}


	public int selectIdCheck(String userid) {
		return (int) select("nikeDAO.selectIdCheck",userid);
	}

	public int selectMemberCertify(NikeVO vo) {
		return (int) select("nikeDAO.selectMemberCertify",vo);
		
	}
	public void updateGoodsInfoHits(NikeVO vo) {
		update("nikeDAO.updateGoodsInfoHits",vo);

	}

	public int updateMember(NikeVO vo) {
		return update("nikeDAO.updateMember",vo);
	}

	public NikeVO selectMemberDetail(NikeVO vo) {
		return (NikeVO) select("nikeDAO.selectMemberDetail",vo);

	}
	public NikeVO selectTab1(NikeVO vo) {
		return (NikeVO) select("nikeDAO.selectTab1",vo);

	}

	public List<?> selectCartList(NikeVO vo) {
		return list("nikeDAO.selectCartList",vo);
	}
	
	public int selectCartListCnt(NikeVO vo) {
		return (int) select("nikeDAO.selectCartListCnt",vo);
	}
	
	public int updateCartList(NikeVO vo) {
		return (int) update("nikeDAO.updateCartList",vo);
	}

	public int deleteCartList(NikeVO vo) {
		return (int) delete("nikeDAO.deleteCartList",vo);
	}

	public int deleteAllCartList(NikeVO vo) {
		return (int) delete("nikeDAO.deleteAllCartList",vo);
	}

	public List<?> selectCheckOut(NikeVO vo) {
		return list("nikeDAO.selectCheckout",vo);
	}

}

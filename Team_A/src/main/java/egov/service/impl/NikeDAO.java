package egov.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egov.service.NikeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("nikeDAO")
public class NikeDAO extends EgovAbstractDAO {

	public List<?> selectNewGoodsList() {
		return list("nikeDAO.selectNewGoodsList");
	}
	public List<?> selectHitGoodsList() {
		return list("nikeDAO.selectHitGoodsList");
	}
	public List<?> selectSalGoodsList() {
		return list("nikeDAO.selectSalGoodsList");
	}
	
	public List<?> selectGoodsList(NikeVO vo) {
		return list("nikeDAO.selectGoodsList",vo);
	}
	
	public int selectGoodsTotal(NikeVO vo) {
		return (int) select("nikeDAO.selectGoodsTotal",vo); 
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

	
	public List<?> selectCartList(NikeVO vo) {
		return list("nikeDAO.selectCartList",vo);
	}
	
	public int selectCartListCnt(NikeVO vo) {
		return (int) select("nikeDAO.selectCartListCnt",vo);
	}
	
	public int updateCartList(NikeVO vo) {
		return (int) update("nikeDAO.updateCartList",vo);
	}

	public List<?> selectCommList(NikeVO vo) {
		return list("nikeDAO.selectCommList",vo);
	}

	public int selectReviewCnt(NikeVO vo) {
		return (int) select("nikeDAO.selectReviewCnt",vo);
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

	public String insertOrderList(NikeVO vo) {
		return (String) insert("nikeDAO.insertOrderList",vo);
	}

	public String insertReview(NikeVO vo) {
		return (String) insert("nikeDAO.insertReview,vo");
	}

	public int selectReviewTotal(NikeVO vo) {
		return (int) select("nikeDAO.selectReviewTotal",vo);
	}

	public String insertCart(NikeVO vo) {
		return (String) insert("nikeDAO.insertCart",vo);
	}
		
	public int selectAdminCertify(NikeVO vo) {
		return (int) select("nikeDAO.selectAdminCertify",vo);
	}

	public int selectAdminTotal(NikeVO vo) {
		return (int) select("nikeDAO.selectAdminTotal",vo);
	}

	public List<?> selectAdminList(NikeVO vo) {		
		return list("nikeDAO.selectAdminList",vo);
	}

	public int selectAdminPass(NikeVO vo) {
		return (int) select("nikeDAO.selectAdminPass",vo);
	}

	public int deleteAdminList(NikeVO vo) {
		return delete("nikeDAO.deleteAdminList",vo);

	}

}

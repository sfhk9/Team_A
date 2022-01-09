package egov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.NikeService;
import egov.service.NikeVO;

@Service("nikeService")
public class NikeImpl implements NikeService {

	@Resource(name="nikeDAO")
	NikeDAO nikeDAO;

	@Override
	public List<?> selectHitGoodsList() {
		return nikeDAO.selectHitGoodsList();
	}
	
	@Override
	public List<?> selectGoodsList(NikeVO vo) throws Exception {
		return nikeDAO.selectGoodsList(vo);
	}
	
	@Override
	public int selectGoodsTotal(NikeVO vo) throws Exception {
		return nikeDAO.selectGoodsTotal(vo);
	}

	@Override
	public String insertJoin(NikeVO vo) throws Exception {
		return nikeDAO.insertJoin(vo);
	}

	@Override
	public NikeVO selectGoodsDetail(NikeVO vo) throws Exception {
		return nikeDAO.selectGoodsDetail(vo);
	}

	@Override
	public void updateGoodsInfoHits(NikeVO vo) throws Exception {
		nikeDAO.updateGoodsInfoHits(vo);

	}


	@Override
	public int selectIdCheck(String userid) throws Exception {
		return nikeDAO.selectIdCheck(userid);
	}

	@Override
	public int selectMemberCertify(NikeVO vo) throws Exception {
		return nikeDAO.selectMemberCertify(vo);
	}

	@Override
	public int updateMember(NikeVO vo) throws Exception {
		return nikeDAO.updateMember(vo);
	}

	@Override
	public NikeVO selectMemberDetail(NikeVO vo) throws Exception {
		return nikeDAO.selectMemberDetail(vo);
	}

	@Override
	public List<?> selectCommList(NikeVO vo) throws Exception {
		return nikeDAO.selectCommList(vo);
	}

	@Override
	public int selectReviewCnt(NikeVO vo) throws Exception {
		return nikeDAO.selectReviewCnt(vo);
	}
	public List<?> selectCartList(NikeVO vo) throws Exception {
		return nikeDAO.selectCartList(vo);
	}
	
	@Override
	public int selectCartListCnt(NikeVO vo) throws Exception {
		return nikeDAO.selectCartListCnt(vo);
	}
	
	@Override
	public int updateCartList(NikeVO vo) throws Exception{
		return nikeDAO.updateCartList(vo);
	}

	@Override
	public int deleteCartList(NikeVO vo) throws Exception{
		return nikeDAO.deleteCartList(vo);
	}

	@Override
	public int deleteAllCartList(NikeVO vo) throws Exception {
		return nikeDAO.deleteAllCartList(vo);
	}

	@Override
	public List<?> selectCheckout(NikeVO vo) throws Exception {
		return nikeDAO.selectCheckOut(vo);
	}

	@Override
	public String insertOrderList(NikeVO vo) throws Exception {
		return nikeDAO.insertOrderList(vo);
	}

	@Override
	public String insertReview(NikeVO vo) throws Exception {
		return nikeDAO.insertReview(vo);
	}

	@Override
	public int selectReviewTotal(NikeVO vo) throws Exception {
		return nikeDAO.selectReviewTotal(vo);
	}

	@Override
	public String insertCart(NikeVO vo) throws Exception {
		return nikeDAO.insertCart(vo);
	}





}

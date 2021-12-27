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
	public NikeVO selectTab1(NikeVO vo) throws Exception {
		return nikeDAO.selectTab1(vo);
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



}

package egov.service.impl;

import org.springframework.stereotype.Repository;

import egov.service.NikeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends EgovAbstractDAO{

	public String insertGoodsInfo(NikeVO vo) {
		return (String) insert("adminDAO.insertGoodsInfo",vo);
	}

	public int selectLastGoodsUnq(NikeVO vo) {
		return (int) select("adminDAO.selectLastGoodsUnq",vo);
	}
	
	public int updateGoodsInfoHits(int unq) {
		return (int) update("adminDAO.updateGoodsInfoHits",unq);
	}
	
	public NikeVO selectGoodsInfo(int unq) {
		return (NikeVO) select("adminDAO.selectGoodsInfo",unq);
	}

	public NikeVO selectGoodsInfo2(int unq) {
		return (NikeVO) select("adminDAO.selectGoodsInfo2",unq);
	}

	public int deleteGoodsInfo(int unq) {
		return (int) delete("adminDAO.deleteGoodsInfo",unq);
	}

	public String selectImageList(NikeVO vo) {
		return (String) select("adminDAO.selectImageList",vo);
	}

	public int updateImageList(NikeVO vo) {
		return (int) update("adminDAO.updateImageList",vo);
	}

	public int updateGOodsInfo(NikeVO vo) {
		return (int) update("adminDAO.updateGoodsInfo",vo);
	}


}

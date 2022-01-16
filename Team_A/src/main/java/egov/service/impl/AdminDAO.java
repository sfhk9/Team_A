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
		return (int) select("adminDAO.selectLastGoodsUnq");
	}

}

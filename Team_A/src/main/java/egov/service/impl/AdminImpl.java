package egov.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.AdminService;
import egov.service.NikeVO;

@Service("adminService")
public class AdminImpl implements AdminService {

	@Resource(name="adminDAO")
	private AdminDAO  adminDAO;

	@Override
	public String insertGoodsInfo(NikeVO vo) throws Exception {
		return adminDAO.insertGoodsInfo(vo);
	}

	@Override
	public int selectLastGoodsUnq(NikeVO vo) throws Exception {
		return adminDAO.selectLastGoodsUnq(vo);
	}

	@Override
	public int updateGoodsInfoHits(int unq) throws Exception {
		return adminDAO.updateGoodsInfoHits(unq);
	}
	
	@Override
	public NikeVO selectGoodsInfo(int unq) throws Exception {
		return adminDAO.selectGoodsInfo(unq);
	}

	@Override
	public NikeVO selectGoodsInfo2(int unq) throws Exception {
		return adminDAO.selectGoodsInfo2(unq);
	}

	@Override
	public int deleteGoodsInfo(int unq) throws Exception {
		return adminDAO.deleteGoodsInfo(unq);
	}

	@Override
	public String selectImageList(NikeVO vo) throws Exception {
		return adminDAO.selectImageList(vo);
	}

	@Override
	public int updateImageList(NikeVO vo) throws Exception {
		return adminDAO.updateImageList(vo);
	}

	@Override
	public int updateGoodsInfo(NikeVO vo) throws Exception {
		return adminDAO.updateGOodsInfo(vo);
	}

}

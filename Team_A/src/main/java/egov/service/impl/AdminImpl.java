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
	
	
}

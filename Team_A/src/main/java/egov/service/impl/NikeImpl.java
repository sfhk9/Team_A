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
	public List<?> selectGoodsList(NikeVO vo) throws Exception {
		return nikeDAO.selectGoodsList(vo);
	}
}

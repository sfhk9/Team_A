package egov.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.NikeService;

@Service("nikeService")
public class NikeImpl implements NikeService {

	@Resource(name="nikeDAO")
	NikeDAO nikeDAO;
}

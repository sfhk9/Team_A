package egov.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import egov.service.FileService;
import egov.service.NikeService;

@Controller
public class NikeController {

	@Resource(name = "nikeService")
	NikeService nikeService;
}

package egov.service.impl;

import org.springframework.stereotype.Repository;

import egov.service.FileVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("fileDAO")
public class FileDAO extends EgovAbstractDAO {

	public String insertFileboard(FileVO vo) {
		return (String) insert("fileDAO.insertFileboard",vo);
	}

}

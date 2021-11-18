package egov.service;

import java.util.List;

public interface FileService {

	String insertFileboard( FileVO vo ) throws Exception;
	List<?> selectFileboardList(FileVO vo) throws Exception;
	int selectFileboardTotal(FileVO vo) throws Exception;
	FileVO selectFileboardDetail(FileVO vo) throws Exception;
	
}

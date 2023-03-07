package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.PdsDto;

public interface PdsDao {
	List<PdsDto> pdslist();
	
	int uploadPds(PdsDto dto);
	
	PdsDto getPds(int seq);
	
	int updatePds(PdsDto pds);
	
	int deletePds(int seq);
}

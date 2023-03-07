package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.PdsDto;

public interface PdsService {
	List<PdsDto> pdslist();
	
	boolean uploadPds(PdsDto dto);
	
	PdsDto getPds(int seq);
	
	boolean updatePds(PdsDto pds);
	
	boolean deletePds(int seq);
}

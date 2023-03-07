package mul.cam.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.PdsDao;
import mul.cam.a.dto.PdsDto;

@Repository
public class PdsDaoImpl implements PdsDao{
	@Autowired
	SqlSessionTemplate session; // SqlSession 대신 사용가능
	
	String ns = "Pds.";

	@Override
	public List<PdsDto> pdslist() {
		return session.selectList(ns + "pdslist");
	}

	@Override
	public int uploadPds(PdsDto dto) {
		return session.insert(ns + "uploadPds", dto);
	}

	@Override
	public PdsDto getPds(int seq) {
		return session.selectOne(ns + "getPds", seq);
	}

	@Override
	public int updatePds(PdsDto pds) {
		return session.update(ns + "updatePds", pds);
	}

	@Override
	public int deletePds(int seq) {
		return session.delete(ns + "deletePds", seq);
	}
}

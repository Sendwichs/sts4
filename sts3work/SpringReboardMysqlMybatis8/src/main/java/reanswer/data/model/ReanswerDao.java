package reanswer.data.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReanswerDao implements ReanswerDaoInter {

	@Autowired
	private SqlSession session;

	@Override
	public void insertReanswer(ReanswerDto dto) {
		// TODO Auto-generated method stub
		session.insert("insertOfReanswer", dto);
	}

	@Override
	public List<ReanswerDto> getAnswerList(int num) {
		// TODO Auto-generated method stub
		return session.selectList("getNumDataOfReanswer", num);
	}

	@Override
	public int getCheckPass(int idx, int pass) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("idx", idx); // num
		map.put("pass", pass); // int

		return session.selectOne("checkEqualPassOfReanswer", map);
	}

	@Override
	public void deleteAnswer(int idx) {
		// TODO Auto-generated method stub
		session.delete("deleteOfReanswer", idx);
	}

}

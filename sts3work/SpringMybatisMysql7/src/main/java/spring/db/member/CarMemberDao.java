package spring.db.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao {

	@Autowired
	private SqlSession session;

	public int getTotalCountCarMember() {

		return session.selectOne("getTotalCountofCarMember");

	}

	// 전체 데이터
	public List<CarMemberDto> getAllDatasCarMember() {

		return session.selectList("getAllDatasofCarMember");

	}

	// insert
	public void insertCarMember(CarMemberDto dto) {

		session.insert("insertCarMember", dto);

	}

	// 수정폼
	public CarMemberDto getData(String num) {
		return session.selectOne("getOneDataOfCarMember", num);
	}

	// 수정
	public void updateCarMember(CarMemberDto dto) {
		session.update("updateOfCarMember", dto);
	}

}

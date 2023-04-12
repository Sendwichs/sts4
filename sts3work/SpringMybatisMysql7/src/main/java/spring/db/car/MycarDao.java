package spring.db.car;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.Session;

@Repository // DAO를 빈에 등록하는거
public class MycarDao {

	@Autowired
	private SqlSession session;

	// 총갯수
	public int getTotalCount() {

		return session.selectOne("getTotalCountofMycar");// mycar.~해줘도 됨

	}

	// 전체 데이터
	public List<MycarDto> getAllDatas() {
		return session.selectList("getAllDatasofMycar");
	}

	// insert
	public void insertMyCar(MycarDto dto) {
		session.insert("insertofMycar", dto);// id,파라메타

	}

	// 수정폼
	public MycarDto getData(String num) {
		return session.selectOne("getOneDataOfMyCar", num);
	}

	// 수정
	public void updateMyCar(MycarDto dto) {
		session.update("updateOfMyCar", dto);
	}

	// 삭제
	public void deleteMyCar(String num) {
		session.delete("deleteOfMyCar", num);
	}

}

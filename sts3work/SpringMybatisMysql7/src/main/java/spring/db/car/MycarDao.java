package spring.db.car;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.Session;

@Repository // DAO�� �� ����ϴ°�
public class MycarDao {

	@Autowired
	private SqlSession session;

	// �Ѱ���
	public int getTotalCount() {

		return session.selectOne("getTotalCountofMycar");// mycar.~���൵ ��

	}

	// ��ü ������
	public List<MycarDto> getAllDatas() {
		return session.selectList("getAllDatasofMycar");
	}

	// insert
	public void insertMyCar(MycarDto dto) {
		session.insert("insertofMycar", dto);// id,�Ķ��Ÿ

	}

	// ������
	public MycarDto getData(String num) {
		return session.selectOne("getOneDataOfMyCar", num);
	}

	// ����
	public void updateMyCar(MycarDto dto) {
		session.update("updateOfMyCar", dto);
	}

	// ����
	public void deleteMyCar(String num) {
		session.delete("deleteOfMyCar", num);
	}

}

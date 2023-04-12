package spring.anno.ex4;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic") // logicController �̸����� ��� // @Component("name")�� �־ ��
public class LogicController {

	//@Autowired
	@Resource(name="myDao") // ��Ȯ�� ���� ��ġ��
	DaoInter daoInter;

	public LogicController(MyDao dao) {

		this.daoInter = dao;
	}

	// insert
	public void insert(String str) {
		daoInter.insertData(str);
	}

	// delete
	public void delete(String num) {
		daoInter.deleteData(num);
	}
}

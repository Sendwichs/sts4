package spring.anno.ex4;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic") // logicController 이름으로 등록 // @Component("name")을 주어도 됨
public class LogicController {

	//@Autowired
	@Resource(name="myDao") // 정확한 빈의 위치로
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

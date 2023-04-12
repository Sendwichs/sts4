package spring.anno.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex5Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 어노테이션 만으로 출력
		ApplicationContext context = new ClassPathXmlApplicationContext("annoContext.xml");
		
		MySqlController cont =(MySqlController) context.getBean("mysqlcont");
		
		cont.insert("한경");
		cont.delete("4");
		cont.select("환라");
	}

}

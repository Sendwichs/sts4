package spring.anno.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogicMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app = new ClassPathXmlApplicationContext("annoContext.xml");

		LogicController lc = (LogicController) app.getBean("logic");

		lc.insert("Happy Friday");
		lc.delete("4");
	}

}

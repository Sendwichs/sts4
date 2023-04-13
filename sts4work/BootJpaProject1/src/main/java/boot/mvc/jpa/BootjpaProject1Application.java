package boot.mvc.jpa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({ "mycar.data","quiz.jshop.data" })
@EntityScan({"mycar.data","quiz.jshop.data"}) // dto 인식 //""해도 되고 안해도됨
@EnableJpaRepositories({"mycar.data","quiz.jshop.data"}) // dao인식
public class BootjpaProject1Application {

	public static void main(String[] args) {
		SpringApplication.run(BootjpaProject1Application.class, args);
	}

}

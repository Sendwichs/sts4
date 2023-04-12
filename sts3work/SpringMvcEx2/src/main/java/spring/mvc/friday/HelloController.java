package spring.mvc.friday;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	// @RequestMapping(value = "/", method = RequestMethod.GET)
	@GetMapping("/")
	public String home(Model model) {

		// Model : request�� �����͸� �����ϱ� ���� �������̽�
		// �������� �ڵ��ߴ� request.setAttribute�� ����

		model.addAttribute("msg", "HelloController�κ��� �������");
		model.addAttribute("today", new Date());

		return "home"; // WEB-INF/day0331/result1.jsp

	}

	@GetMapping("/apple/list.do") // list�ڿ� .do .nhn ������ ������ �� ȣ���(���� �ּҿ� Ȯ���ڸ� ������ �� �� Ȯ���ڸ� ȣ���)
	public String hello1(Model model) {

		// Model : request�� �����͸� �����ϱ� ���� �������̽�
		// �������� �ڵ��ߴ� request.setAttribute�� ����

		model.addAttribute("name", "���Ѱ�");
		model.addAttribute("addr", "����� ������");

		return "result1"; // WEB-INF/day0331/result1.jsp

	}

	@GetMapping("/banana/insert")
	public ModelAndView one() {
		// ModelAndView�� request�� �����ϱ� ���� Model�� �������ϱ� ���� View�� ��ģ ��
		ModelAndView mview = new ModelAndView();

		// request�� ����
		mview.addObject("Java", 88);
		mview.addObject("Spring",100);
		
		// ������ �ϱ� ���� View
		mview.setViewName("result2");
		return mview;
	}
	@GetMapping("/orange/delete")
	public String two(Model model, HttpSession session) {
		
		// request�� ����
		model.addAttribute("name", "�ǿ���");
		
		// session ����
		session.setAttribute("myid", "admin");
		return "result3";
	}
	@GetMapping("/shop/detail")
	public String three() {
		
		return "result4";
	}
	@GetMapping("/board/add/data")
	public String four() {
		
		return "result5";
	}
}

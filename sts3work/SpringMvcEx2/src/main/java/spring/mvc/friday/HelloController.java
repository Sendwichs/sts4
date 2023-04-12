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

		// Model : request에 데이터를 저장하기 위한 인터페이스
		// 서블릿에서 코딩했던 request.setAttribute와 같음

		model.addAttribute("msg", "HelloController로부터 포워드됨");
		model.addAttribute("today", new Date());

		return "home"; // WEB-INF/day0331/result1.jsp

	}

	@GetMapping("/apple/list.do") // list뒤에 .do .nhn 무엇을 붙히던 다 호출됨(메핑 주소에 확장자를 붙히면 딱 그 확장자만 호출됨)
	public String hello1(Model model) {

		// Model : request에 데이터를 저장하기 위한 인터페이스
		// 서블릿에서 코딩했던 request.setAttribute와 같음

		model.addAttribute("name", "성한경");
		model.addAttribute("addr", "서울시 강남구");

		return "result1"; // WEB-INF/day0331/result1.jsp

	}

	@GetMapping("/banana/insert")
	public ModelAndView one() {
		// ModelAndView는 request에 저장하기 위한 Model과 포워드하기 위한 View를 합친 것
		ModelAndView mview = new ModelAndView();

		// request에 저장
		mview.addObject("Java", 88);
		mview.addObject("Spring",100);
		
		// 포워드 하기 위한 View
		mview.setViewName("result2");
		return mview;
	}
	@GetMapping("/orange/delete")
	public String two(Model model, HttpSession session) {
		
		// request에 저장
		model.addAttribute("name", "권예지");
		
		// session 저장
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

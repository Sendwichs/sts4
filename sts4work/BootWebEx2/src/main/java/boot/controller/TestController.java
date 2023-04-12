package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@GetMapping("/")
	public ModelAndView list() {
		ModelAndView mview = new ModelAndView();

		// 저장
		mview.addObject("name", "성한경");
		mview.addObject("addr", "이의동");
		mview.addObject("hp", "010-1111-2222");

		// 포워드
		mview.setViewName("redirect:sist/home");

		return mview;
	}
	
	
}

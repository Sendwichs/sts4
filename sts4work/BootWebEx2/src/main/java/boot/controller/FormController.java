package boot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.model.PersonDto;

@Controller
public class FormController {

	@GetMapping("/sist/form1")
	public String form1() {
		return "form/form1";// WEB-INF/board/form/form1/jsp
	}

	@PostMapping("/sist/read1")
	public ModelAndView pform1(@RequestParam String name, @RequestParam int java, @RequestParam int spring) {
		ModelAndView mview = new ModelAndView();

		mview.addObject("name", name);
		mview.addObject("java", java);
		mview.addObject("spring", spring);
		mview.addObject("tot", spring + java);
		mview.addObject("avg", (spring + java) / 2);

		mview.setViewName("result/result1");

		return mview;
	}

	@GetMapping("/sist/form2")
	public String form2() {
		return "form/form2";// WEB-INF/board/form/form1/jsp
	}

	@PostMapping("/sist/read2")
	public String formRead2(@ModelAttribute("dto") PersonDto dto) {
		return "result/result2";
	}

	@GetMapping("/sist/form3")
	public String form3() {
		return "form/form3";// WEB-INF/board/form/form1/jsp
	}
	
	@PostMapping("/sist/read3")
	// map으로 읽을 경우 폼의 name이 key값으로 입력값이 value값으로 저장
	public ModelAndView formRead(@RequestParam Map<String, String> map) {
		ModelAndView mview = new ModelAndView();
		
		mview.addObject("name", map.get("name"));
		mview.addObject("blood", map.get("blood"));
		mview.addObject("hp", map.get("hp"));
		
		mview.setViewName("result/result3");
		return mview;
	}
//	public ModelAndView form1() {
//		ModelAndView mview = new ModelAndView();
//		
//		mview.addObject("form1","폼1");
//		
//		mview.setViewName("form1");
//		
//		return mview;
//	}

//	@GetMapping("/sist/form2")
//	public ModelAndView form2() {
//		ModelAndView mview = new ModelAndView();
//		
//		mview.addObject("form2","폼2");
//		
//		mview.setViewName("form2");
//		
//		return mview;
//	}
//	
//	@GetMapping("/sist/form3")
//	public ModelAndView form3() {
//		ModelAndView mview = new ModelAndView();
//		
//		mview.addObject("form3","폼3");
//		
//		mview.setViewName("form3");
//		
//		return mview;
//	}

}

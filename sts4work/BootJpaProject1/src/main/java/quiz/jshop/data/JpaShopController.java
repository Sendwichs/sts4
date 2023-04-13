package quiz.jshop.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import mycar.data.MycarDto;

@Controller
public class JpaShopController {

	@Autowired
	JpaShopDao dao;

	@GetMapping("/")
	public String start() {
		return "redirect:shoplist";
	}

	@GetMapping("/shop/shoplist")
	public ModelAndView list(@ModelAttribute JpaShop dto) {
		ModelAndView mview = new ModelAndView();

		mview.addObject("dto", dto);

		mview.setViewName("shoplist");

		return mview;
	}

}

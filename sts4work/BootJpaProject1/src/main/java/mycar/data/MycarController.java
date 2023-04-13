package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MycarController {

	@Autowired
	MycarDao dao;

	@GetMapping("/")
	public String start() {
		return "redirect:car/carlist";
	}

	@GetMapping("/car/carform")
	public String form() {
		return "caraddform";
	}

	// insert
	@PostMapping("/car/insert")
	public String insert(@ModelAttribute MycarDto dto) {

		dao.insertCar(dto);

		return "redirect:carlist";
	}

	@GetMapping("/car/carlist")
	public ModelAndView list() {
		ModelAndView mview = new ModelAndView();

		List<MycarDto> list = dao.getAllDatas();

		mview.addObject("list", list);
		mview.addObject("tcount", list.size());

		mview.setViewName("carlist");

		return mview;
	}

	@GetMapping("/car/delete")
	public String delete(Long num) {

		dao.deleteCar(num);

		return "redirect:carlist";
	}

	@GetMapping("/car/updateform")
	public ModelAndView updateform(Long num) {
		ModelAndView mview = new ModelAndView();

		MycarDto dto = dao.getData(num);

		mview.addObject("dto", dto);

		mview.setViewName("updateform");
		return mview;
	}

	@PostMapping("/car/update")
	public String update(@ModelAttribute MycarDto dto) {
		dao.updateCar(dto);

		return "redirect:carlist";
	}

	@GetMapping("/car/sangsae")
	public ModelAndView sangsaePage(Long num) {
		ModelAndView mview = new ModelAndView();

		MycarDto dto = dao.getData(num);
		mview.addObject("dto", dto);

		mview.setViewName("sangsae");

		return mview;
	}

}

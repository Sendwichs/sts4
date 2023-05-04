package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.data.dto.TestDto;
import boot.data.service.TestService;

@Controller
public class TestController {

	@Autowired
	TestService service;

	@GetMapping("/testing/list")
	public String list(Model model) {
		List<TestDto> list = service.getList();

		model.addAttribute("list", list);

		return "/testing/test";
	}

	@GetMapping("/testing/price")
	@ResponseBody
	public TestDto price(@RequestParam String num) {
		return service.getPrice(num);
	}

}

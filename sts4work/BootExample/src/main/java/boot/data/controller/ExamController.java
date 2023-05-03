package boot.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import boot.data.service.ExamService;

@Controller
public class ExamController {
	
	@Autowired
	ExamService service;
	
	@GetMapping("/")
	public String exam(Model model) {
		
		
		return "exam";
	}

}

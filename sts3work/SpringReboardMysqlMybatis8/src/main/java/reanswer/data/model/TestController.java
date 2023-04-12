package reanswer.data.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import reboard.data.model.ReboardDao;
import reboard.data.model.ReboardDto;

@Controller
public class TestController {
	@Autowired
	ReboardDao dao;

	@GetMapping("/sist/list")
	@ResponseBody
	public List<ReboardDto> list() {

		return dao.getList(0, 5);
	}

	@GetMapping("/sist/data")
	@ResponseBody
	public ReboardDto getData(@RequestParam int num) {

		return dao.getData(num);

	}

	// ajax 출력위해서 단순포워드 매핑.. list.jsp
	@GetMapping("/rest/list")
	public String ajaxlist() {
		return "list";
	}
}

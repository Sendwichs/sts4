package boot.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	@GetMapping("/member/form")
	public String memberform() {
		return "/member/memberform";
	}

	@GetMapping("/member/list")
	public String list(Model model) {

		// 전체 조회
		List<MemberDto> list = service.getAllMembers();

		model.addAttribute("list", list);
		model.addAttribute("count", list.size());

		return "/member/memberlist";
	}
	
	// 중복체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idcheck(@RequestParam String id) {
		Map<String, Integer> map = new HashMap<>();
		
		// id
		int n = service.getSearchId(id);
		
		map.put("count", n); // 0 or 1 {"count:0"} {"count:1"}
		return map;
	}
	
	
	
	
}

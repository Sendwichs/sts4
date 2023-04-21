package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	@GetMapping("/sub/member/form")
	public String memberform() {
		return "/sub/member/memberform";
	}

	@GetMapping("/sub/member/list")
	public String list(Model model) {

		// 전체 조회
		List<MemberDto> list = service.getAllMembers();

		model.addAttribute("list", list);
		model.addAttribute("count", list.size());

		return "/sub/member/memberlist";
	}

	// 중복체크
	@GetMapping("/sub/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idcheck(@RequestParam String id) {
		Map<String, Integer> map = new HashMap<>();

		// id
		int n = service.getSearchId(id);

		map.put("count", n); // 0 or 1 {"count:0"} {"count:1"}
		return map;
	}

	@PostMapping("/sub/member/insert")
	public String insert(@ModelAttribute MemberDto dto, @RequestParam MultipartFile myphoto, HttpSession session) {

		String path = session.getServletContext().getRealPath("/photo");
		// System.out.println(path);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "p_" + sdf.format(new Date()) + "_" + myphoto.getOriginalFilename();

		dto.setPhoto(fileName);

		try {
			myphoto.transferTo(new File(path + "\\" + fileName));

			// db insert
			service.insertMember(dto);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// return "/member/gaipsuccess";
		return "redirect:list";

	}

	// 나의 정보로 이동
	@GetMapping("/sub/member/myinfo")
	public String myinfo(Model model) {
		List<MemberDto> list = service.getAllMembers();

		model.addAttribute("list", list);

		return "/sub/member/myinfo";
	}
}

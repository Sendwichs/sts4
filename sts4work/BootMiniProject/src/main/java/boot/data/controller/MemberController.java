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

import org.apache.ibatis.javassist.expr.NewArray;
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

	@PostMapping("/member/insert")
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
		return "/layout/main";

	}

	// 나의 정보로 이동
	@GetMapping("/member/myinfo")
	public String myinfo(Model model) {
		List<MemberDto> list = service.getAllMembers();

		model.addAttribute("list", list);

		return "/member/myinfo";
	}

	@GetMapping("/member/delete")
	@ResponseBody // ajax 하려면 필요함
	public void delete(@RequestParam String num) {
		service.deleteMember(num);
	}

	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void updatePhoto(String num, MultipartFile photo, HttpSession session) {
		// 업로드 될 경로 구하기
		String path = session.getServletContext().getRealPath("/photo");

		// 파일명 구하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "p_" + sdf.format(new Date()) + photo.getOriginalFilename();

		try {
			photo.transferTo(new File(path + "\\" + fileName));

			service.updatePhoto(num, fileName); // db 사진 수정
			session.setAttribute("loginphoto", fileName); // 세션의 사진 변경
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@GetMapping("/member/updateform")
	@ResponseBody
	public MemberDto getData(String num) {
		return service.getDataByNum(num);
	}

	@PostMapping("/member/update")
	@ResponseBody
	public void update(MemberDto dto, HttpSession session) {
		service.updateMemeber(dto);

		// 세션에 저장된 이름 변경
		session.setAttribute("loginname", dto.getName());
	}
}

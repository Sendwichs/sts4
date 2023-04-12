package spring.db.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarMemberController {

	@Autowired
	CarMemberDao dao;

	@GetMapping("/lg/memberlist")
	public String list(Model model) {

		// ��ü ����
		int totalCount = dao.getTotalCountCarMember();

		// ��� ��������
		List<CarMemberDto> list = dao.getAllDatasCarMember();

		// �𵨷� ����� request�� ����
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);

		return "carmember/memberlist";

	}

	// �Է������� ����
	@GetMapping("/lg/writeform")
	public String carmemberform() {

		return "carmember/writeform";
	}

	// insert
	@PostMapping("/lg/write")
	public String insert(@ModelAttribute CarMemberDto dto) {
		dao.insertCarMember(dto);
		return "redirect:memberlist";
	}

	@GetMapping("/lg/updateform")
	public String updateform(@RequestParam String num, Model model) {
		CarMemberDto dto = dao.getData(num);

		model.addAttribute("dto", dto);

		return "carmember/updateform";
	}

	@PostMapping("/lg/update")
	public String update(@ModelAttribute CarMemberDto dto) {
		dao.updateCarMember(dto);
		return "redirect:memberlist";
	}
}

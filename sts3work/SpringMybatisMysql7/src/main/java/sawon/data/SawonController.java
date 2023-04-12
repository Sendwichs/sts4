package sawon.data;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SawonController {

	@Autowired
	SawonDaoInter dao;

	@GetMapping("/sawon/form")
	public String sawonform() {
		return "sawon/addform";
	}

	@GetMapping("/sawon/list")
	public ModelAndView list(@RequestParam(defaultValue = "name") String title,
			@RequestParam(required = false) String search) {

		ModelAndView mview = new ModelAndView();

		// 전체 개수
		int totalCount = dao.getToatalCount();

		System.out.println(title + "," + search);

		Map<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("search", search);

		// 전체회원리스트
		List<SawonDto> list = dao.getAllDatas(map);

		// 모델에 저장
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);

		// 포워드
		mview.setViewName("sawon/sawonlist");
		return mview;
	}

	@PostMapping("/sawon/insert")
	public String insertSawon(@ModelAttribute SawonDto dto, @RequestParam MultipartFile upload, HttpSession session) {

		String path = session.getServletContext().getRealPath("/WEB-INF/image");
		System.out.println(path);

		// dto에 담을 변수
		String photoname;

		// 사진 선택을 안했을 경우 no, 했을 경우
		if (upload.getOriginalFilename().equals("")) {
			photoname = "no";

		} else {
			String fName = upload.getOriginalFilename();
			photoname = fName;

			// 업로드
			try {
				upload.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// dto의 photo에 photoname 넣어주기
		dto.setPhoto(photoname);
		// insert
		dao.insertSawon(dto);

		return "redirect:list";
	}

	@GetMapping("/sawon/updateform")
	public String uform(@RequestParam String num, Model model) {

		SawonDto dto = dao.getData(num);

		model.addAttribute("dto", dto);

		return "sawon/updateform";
	}

	@PostMapping("/sawon/update")
	public String updateSawon(@ModelAttribute SawonDto dto, @RequestParam MultipartFile upload, HttpSession session) {

		String path = session.getServletContext().getRealPath("/WEB-INF/image");
		System.out.println(path);

		// dto에 담을 변수
		String photoname;

		// 사진 선택을 안했을 경우 no, 했을 경우
		if (upload.getOriginalFilename().equals("")) {
			photoname = null;

		} else {
			photoname = upload.getOriginalFilename();
			// photoname = fName;

			// 업로드
			try {
				upload.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// dto의 photo에 photoname 넣어주기
		dto.setPhoto(photoname);

		// update
		dao.updateSawon(dto);

		return "redirect:list";
	}

	@GetMapping("/sawon/delete")
	public String deleteSawon(@RequestParam String num, HttpSession session) {

		String photo = dao.getData(num).getPhoto();
		if (!photo.equals("no")) {
			String path = session.getServletContext().getRealPath("/WEB-INF/image");

			File file = new File(path + "\\" + photo);
			file.delete();
		}

		dao.deleteSawon(num);

		return "redirect:list";
	}
}

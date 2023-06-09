package spring.mvc.reboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import reboard.data.model.ReboardDao;
import reboard.data.model.ReboardDto;

@Controller
public class BoardUpdateController {

	@Autowired
	ReboardDao dao;

	@GetMapping("/board/updatepassform")
	public ModelAndView upassform(@RequestParam String num, @RequestParam String currentPage) {
		ModelAndView mview = new ModelAndView();

		mview.addObject("num", num);
		mview.addObject("currentPage", currentPage);

		mview.setViewName("updatepassform");
		return mview;
	}

	@PostMapping("/board/updatepass")
	public ModelAndView upass(@RequestParam int num, @RequestParam int pass, @RequestParam int currentPage) {
		ModelAndView mview = new ModelAndView();

		// 비번이 맞으면 수정폼, 틀리면 passfail
		int check = dao.getCheckPass(num, pass);

		if (check == 1) {
			// dto얻는다(수정폼으로 가야하므로)
			ReboardDto dto = dao.getData(num);
			mview.addObject("dto", dto);
			mview.addObject("currentPage", currentPage);
			mview.setViewName("updateform"); // 포워드
		} else {
			mview.setViewName("passfail");
		}

		return mview;
	}

	@PostMapping("/board/update")
	public String update(@ModelAttribute ReboardDto dto, @RequestParam ArrayList<MultipartFile> upload,
			HttpSession session, @RequestParam int currentPage) { // requestparam 빼도 됨(헷갈리지 않기 위해)

		// 업로드 할 실제 경로
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");

		// 파일명에 사용할 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		System.out.println(path);

		String photo = "";

		// 사진 선택 안했을 경우 no, 했을 경우는 ,로 나열됨

		if (upload.get(0).getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			for (MultipartFile f : upload) {
				String fName = "p_" + sdf.format(new Date()) + f.getOriginalFilename();
				photo += fName + ",";

				// 업로드
				try {
					f.transferTo(new File(path + "\\" + fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

			// photo에서 마지막 컴마 제거
			photo = photo.substring(0, photo.length() - 1);
		}

		// dto에 photo넣어주기
		dto.setPhoto(photo);

		// update
		dao.updateBoard(dto);

		// 내용보기로 가도록 수정

		int num = dao.getMaxNum();

		return "redirect:content?num=" + num + "&currentPage=" + currentPage;
	}
}

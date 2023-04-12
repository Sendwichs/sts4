package spring.mvc.reboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

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
public class BoardWriteController {

	@Autowired
	ReboardDao dao;

	@GetMapping("/board/writeform")
	public ModelAndView form(@RequestParam Map<String, String> map) {
		ModelAndView mview = new ModelAndView();

		// 아래 5개의 값은 답글일 경우에만 넘어온다(새 글일 때는 안넘어옴)
		String currentPage = map.get("currentPage");
		String num = map.get("num");
		String regroup = map.get("regroup");
		String restep = map.get("restep");
		String relevel = map.get("relevel");

		System.out.println(currentPage + "," + num);

		// 새글일 경우는 null, 답글인 경우는 숫자로 나옴

		// 입력폼에 hidden으로 넣어줘야함... 답글일 때 대비
		mview.addObject("currentPage", currentPage == null ? "1" : currentPage);
		mview.addObject("num", num == null ? "0" : num); // 0이어야 dao에서 새 글로 인식
		mview.addObject("regroup", regroup == null ? "0" : regroup);
		mview.addObject("restep", restep == null ? "0" : restep);
		mview.addObject("relevel", relevel == null ? "0" : relevel);

		mview.setViewName("writeform");
		return mview;
	}

	@PostMapping("/board/insert")
	public String insert(@ModelAttribute ReboardDto dto, @RequestParam ArrayList<MultipartFile> upload,
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

		// insert
		dao.insertReboard(dto);

		// 내용보기로 가도록 수정

		int num = dao.getMaxNum();

		return "redirect:content?num=" + num + "&currentPage=" + currentPage;
	}

}

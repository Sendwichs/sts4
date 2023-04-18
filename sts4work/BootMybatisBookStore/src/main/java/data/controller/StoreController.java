package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.StoreDto;
import data.mapper.StoreMapperInter;

@Controller
public class StoreController {

	@Autowired
	StoreMapperInter mapper;

	@GetMapping("/")
	public String start() {
		return "redirect:store/list";
	}

	@GetMapping("/store/list")
	public ModelAndView list() {
		ModelAndView mview = new ModelAndView();

		// db에서 총갯수 얻기
		int totalCount = mapper.getTotalCount();
		List<StoreDto> list = mapper.getAllDatas();

		mview.addObject("list", list);
		mview.addObject("totalCount", totalCount);

		mview.setViewName("storelist");

		return mview;
	}

	@GetMapping("/store/form")
	public String addform() {
		return "addform";
	}

	@PostMapping("/store/insert")
	public String insert(@ModelAttribute StoreDto dto, @RequestParam MultipartFile photo, HttpSession session) {

		// 업로드 경로
		String path = session.getServletContext().getRealPath("/upload");

		if (photo.getOriginalFilename().equals("")) {
			dto.setBookphoto("no");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMDDHHMMSS");
			String bookphoto = "b_" + sdf.format(new Date()) + photo.getOriginalFilename();

			dto.setBookphoto(bookphoto);

			try {
				photo.transferTo(new File(path + "\\" + bookphoto));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		mapper.insertStore(dto);

		return "redirect:list";
	}

	@GetMapping("/store/delete")
	public String delete(@RequestParam int num, HttpSession session) {
		String path = session.getServletContext().getRealPath("/upload");

		String uploadfile = mapper.getData(num).getBookphoto();
		
		File file = new File(path+"\\"+uploadfile);
		
		file.delete();
		
		mapper.deleteStore(num);

		return "redirect:list";
	}
}

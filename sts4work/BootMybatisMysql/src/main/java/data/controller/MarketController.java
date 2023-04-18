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

import data.dto.MarketDto;
import data.mapper.MarketMapperInter;

@Controller
public class MarketController {

	@Autowired
	MarketMapperInter mapper;

	@GetMapping("/store/list")
	public String start() {
		return "redirect:market/list";
	}

	@GetMapping("/market/list")
	public ModelAndView list() {
		ModelAndView mview = new ModelAndView();

		// db에서 총갯수 얻기
		int totalCount = mapper.getTotalCount();

		List<MarketDto> list = mapper.getAllDatas();

		mview.addObject("list", list);
		mview.addObject("totalCount", totalCount);

		mview.setViewName("marketlist");

		return mview;
	}

	@GetMapping("/market/form")
	public String form() {
		return "addform";
	}

	@PostMapping("/market/insert")
	public String insert(@ModelAttribute MarketDto dto, @RequestParam MultipartFile photo, HttpSession session) {

		// 업로드 경로 구하기
		String path = session.getServletContext().getRealPath("/upload");

		if (photo.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname = "p_" + sdf.format(new Date()) + photo.getOriginalFilename();

			dto.setPhotoname(photoname);
			// 실제 업로드는 따로 해줘야됨
			try {
				photo.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// db저장
		mapper.insertMarket(dto);

		return "redirect:list";
	}

	@GetMapping("/market/delete")
	public String delete(@RequestParam String num, HttpSession session) {
		// 실제경로
		String path = session.getServletContext().getRealPath("/upload");
		// 업로드된 파일명
		String uploadfile = mapper.getData(num).getPhotoname();
		// 파일 객체
		File file = new File(path + "\\" + uploadfile);
		// 파일 삭제
		file.delete();

		mapper.deleteMarket(num);

		return "redirect:list";
	}

	@GetMapping("/market/updateform")
	public ModelAndView uform(@RequestParam String num) {
		ModelAndView mview = new ModelAndView();

		MarketDto dto = mapper.getData(num);

		mview.addObject("dto", dto);
		mview.setViewName("updateform");

		return mview;
	}

	@PostMapping("/market/update")
	public String update(@ModelAttribute MarketDto dto, @RequestParam MultipartFile photo, HttpSession session) {

		// 업로드 경로 구하기
		String path = session.getServletContext().getRealPath("/upload");

		if (photo.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname = "p_" + sdf.format(new Date()) + photo.getOriginalFilename();

			dto.setPhotoname(photoname);

			// 실제 업로드는 따로 해줘야됨
			try {
				photo.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// db저장
		mapper.updateMarket(dto);

		return "redirect:list";
	}

}

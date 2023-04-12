package reanswer.data.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AnswerController {

	@Autowired
	ReanswerDaoInter adao;

	@PostMapping("/board/ainsert")
	public String answerInsert(@ModelAttribute ReanswerDto dto,
			@RequestParam int currentPage) { /* @RequestParam 생략 가능, 여러 개를 넣을 때는 @ModelAttribute */
		// db에 추가
		adao.insertReanswer(dto);

		return "redirect:content?num=" + dto.getNum() + "&currentPage=" + currentPage;
	}

}

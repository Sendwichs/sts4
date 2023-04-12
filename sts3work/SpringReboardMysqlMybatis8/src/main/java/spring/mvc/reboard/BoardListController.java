package spring.mvc.reboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reanswer.data.model.ReanswerDao;
import reanswer.data.model.ReanswerDto;
import reboard.data.model.ReboardDao;
import reboard.data.model.ReboardDto;

@Controller
public class BoardListController {

	@Autowired
	ReboardDao dao;

	@Autowired
	ReanswerDao adao;

	@GetMapping("/")
	public String start() {
		return "redirect:board/list";
	}

	@GetMapping("/board/list") // list�� ������ model�� �ϴ� �� ����
	public ModelAndView list(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		ModelAndView mview = new ModelAndView();

		// �ѱ��� ����
		int totalCount = dao.getTotalCount();

		int totalPage;
		int startPage;
		int endPage;
		int start;
		int perPage = 3;
		int perBlock = 5;

		// �� ������ ����
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
		// ������ ����������.. ������������ 3(s:1, e:5) 6(s:6, e:10)
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;
		// ����������8 (6~10 ... endpage�� 8�� �������־����.)
		if (endPage > totalPage)
			endPage = totalPage;
		// ������������ �ҷ��� ���۹�ȣ
		start = (currentPage - 1) * perPage;

		// ������������ �ʿ��� �Խñ� ��������
		List<ReboardDto> list = dao.getList(start, perPage);

		// list�� �� �ۿ� ���� ��� ���� �߰��ϱ�
		for (ReboardDto d : list) {
			d.setAcount(adao.getAnswerList(d.getNum()).size());
		}

		// ���������� ����� ���۹�ȣ
		int no = totalCount - (currentPage - 1) * perPage;

		// ��¿� �ʿ��� �������� ���� model�� ����
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("totalPage", totalPage);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("start", start);
		mview.addObject("perPage", perPage);
		mview.addObject("perBlock", perBlock);
		mview.addObject("currentPage", currentPage);
		mview.addObject("no", no);

		mview.setViewName("boardlist");

		return mview;
	}
}

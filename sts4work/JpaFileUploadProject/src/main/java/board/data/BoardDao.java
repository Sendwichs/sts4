package board.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

	@Autowired
	BoardDaoInter daoInter;

	// insert
	public void insertBoard(BoardDto dto) {
		daoInter.save(dto);
	}

	// list
	public List<BoardDto> getAllDatas() {
		// 최신 글이 위로 올라오기(desc)
		List<BoardDto> list = daoInter.findAll(Sort.by(Sort.Direction.DESC, "num"));

		return list;
	}

	// detail
	public BoardDto getData(Long num) {
		return daoInter.getReferenceById(num);
	}

	// update
	public void updateBoard(BoardDto dto) {
		daoInter.save(dto);
	}

	// delete
	public void deleteBoard(Long num) {
		daoInter.deleteById(num);
	}
}

package boot.data.service;

import java.util.List;

import boot.data.dto.ExamDto;

public interface ExamServiceInter {
	
	public void insertAnswer(ExamDto dto);
	public List<ExamDto> getAllAnswers(String num);
	public ExamDto getAnswer(String idx);
	public void updateAnswer(ExamDto dto);
	public void deleteAnswer(String idx);
}

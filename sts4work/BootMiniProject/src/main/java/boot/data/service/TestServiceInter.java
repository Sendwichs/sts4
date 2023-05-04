package boot.data.service;

import java.util.List;

import boot.data.dto.TestDto;

public interface TestServiceInter {
	public List<TestDto> getList();

	public TestDto getPrice(String num);
}

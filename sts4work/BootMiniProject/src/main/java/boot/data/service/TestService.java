package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.TestDto;
import boot.data.mapper.TestMapperInter;

@Service
public class TestService implements TestServiceInter {

	@Autowired
	TestMapperInter mapper;

	@Override
	public List<TestDto> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public TestDto getPrice(String num) {
		// TODO Auto-generated method stub
		return mapper.getPrice(num);
	}

}

package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.TestDto;

@Mapper
public interface TestMapperInter {

	public List<TestDto> getList();

	public TestDto getPrice(String num);

}

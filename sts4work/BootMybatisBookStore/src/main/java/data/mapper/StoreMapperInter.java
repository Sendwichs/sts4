package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.StoreDto;

@Mapper
public interface StoreMapperInter {

	public int getTotalCount();

	public List<StoreDto> getAllDatas();

	public void insertStore(StoreDto dto);

	public StoreDto getData(int num);

	public void deleteStore(int num);

}

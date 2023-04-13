package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public class MycarDao {

	@Autowired
	MycarDaoInter carInter;

	// insert
	public void insertCar(MycarDto dto) {
		carInter.save(dto); // id유무에 따라서 자동으로 insert of update
	}

	// 전체출력
	public List<MycarDto> getAllDatas() {
		return carInter.findAll();
	}

	// delete
	public void deleteCar(Long num) {
		carInter.deleteById(num);
	}

	// num에 대한 dto반환
	public MycarDto getData(Long num) {
		return carInter.getReferenceById(num);
	}

	// 수정
	public void updateCar(MycarDto dto) {
		
		carInter.save(dto);
	}
	
	public void sangsae(MycarDto dto) {
		
	}
	
}

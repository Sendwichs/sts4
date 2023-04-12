package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController // json전용이므로 일반 메소드는 X
public class JsonTest2Controller {

	@GetMapping("/list2")
	public List<PhotoDto> list2() {
		List<PhotoDto> list = new ArrayList<PhotoDto>();

		list.add(new PhotoDto("1", "1.jpg"));
		list.add(new PhotoDto("2", "2.jpeg"));
		list.add(new PhotoDto("3", "3.jpeg"));
		list.add(new PhotoDto("4", "4.jpeg"));
		list.add(new PhotoDto("5", "5.jpg"));

		return list;
	}

	@GetMapping("/list3")
	public Map<String, Object> list3(@RequestParam String name) {
		List<PhotoDto> list = new ArrayList<PhotoDto>();

		list.add(new PhotoDto("1", "1.jpg"));
		list.add(new PhotoDto("2", "2.jpeg"));
		list.add(new PhotoDto("3", "3.jpeg"));
		list.add(new PhotoDto("4", "4.jpeg"));
		list.add(new PhotoDto("5", "5.jpg"));

		Map<String, Object> map = new HashMap<String, Object>();

		for (PhotoDto dto : list) {
			if (name.equals(dto.getName())) {
				map.put("name", dto.getName());
				map.put("photo", dto.getPhoto());
			}
		}

		return map;
	}
}

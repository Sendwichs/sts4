package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberSeviceInter {

	@Autowired
	MemberMapperInter mapper;

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return mapper.getAllMembers();
	}

	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapper.insertMember(dto);

	}

	@Override
	public int getSearchId(String id) {
		// TODO Auto-generated method stub
		return mapper.getSearchId(id);
	}

	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return mapper.getName(id);
	}

	@Override
	public int loginIdPwCheck(String id, String pw) {

		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);

		return mapper.loginIdPwCheck(map);
	}

	@Override
	public MemberDto getDataById(String id) {
		// TODO Auto-generated method stub
		return mapper.getDataById(id);
	}

}

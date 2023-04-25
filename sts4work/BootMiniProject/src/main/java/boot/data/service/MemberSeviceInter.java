package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberSeviceInter {
	public List<MemberDto> getAllMembers();

	public void insertMember(MemberDto dto);

	public int getSearchId(String id);

	public String getName(String id);

	public int loginIdPwCheck(String id, String pw);

	public MemberDto getDataById(String id);

	public void deleteMember(String num);

	public void updatePhoto(String num, String photo);

	public void updateMemeber(MemberDto dto);
	
	public MemberDto getDataByNum(String num);
}

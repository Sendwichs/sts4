package boot.data.service;

import java.util.List;

import boot.data.dto.MemberDto;

public interface MemberSeviceInter {
	public List<MemberDto> getAllMembers();

	public void insertMember(MemberDto dto);

	public int getSearchId(String id);
}
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function delfunc(num){
	var yes=confirm("정말 강퇴처리하시겠습니까?");
	
	if (yes) {
		location.href='member/memberdelete.jsp?num='+num;
	}
}
</script>
</head>
<%
// 전체 멤버 정보 가져오기
MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllMembers();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
int no=1;
%>

<body>
	<table class="table table-bordered" style="width: 1000px">
		<caption>
			<b>전체회원목록</b>
		</caption>
		<tr bgcolor="#fff0f5">
			<th width="100" style="text-align: center;">번호</th>
			<th width="120" style="text-align: center;">회원명</th>
			<th width="160" style="text-align: center;">아이디</th>
			<th width="160" style="text-align: center;">핸드폰</th>
			<th width="450" style="text-align: center;">주소</th>
			<th width="260" style="text-align: center;">이메일</th>
			<th width="260" style="text-align: center;">가입일</th>
			<th width="160" style="text-align: center;">편집</th>
		</tr>
		<%
		for (MemberDto dto : list) {
		%>

		<tr align="center">
			<td><%=no++%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getHp()%></td>
			<td><%=dto.getAddr()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=sdf.format(dto.getGaipday())%></td>
			<td>
				<button type="button" class="btn btn-danger btn-xs" onclick="delfunc(<%=dto.getNum()%>)">삭제</button>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap"
	rel="stylesheet">
	<style type="text/css">
	body{
	font-size: 20pt;
	}
	</style>
</head>
<%
MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllMembers();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

// 세션
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");
%>
<body>
	<table class="table table-bordered" style="width: 500px">
		<%
		for (MemberDto dto : list) {
		%>

		<%
		// 로그인 중이면서 로그인한 아이디와 같은 사람만 보기
		if (loginok != null && dto.getId().equals(myid)) {
		%>
		<tr>
			<td><%=dto.getName()%><br> <%=dto.getId()%><br> <%=dto.getHp()%><br>
				<%=dto.getAddr()%><br> <%=dto.getEmail()%><br> <%=sdf.format(dto.getGaipday())%><br>
				<button type="button" class="btn btn-danger btn-xs"
					onclick="delfunc(<%=dto.getNum()%>)">수정</button>

				<button type="button" class="btn btn-danger btn-xs"
					onclick="delfunc(<%=dto.getNum()%>)">삭제</button></td>
		</tr>
		<%
		}
		%>


		<%
		}
		%>
	</table>

</body>
</html>
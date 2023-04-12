<%@page import="team.model.TeamDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="team.model.TeamDao"%>
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
</head>
<%
TeamDao dao = new TeamDao();
ArrayList<TeamDao> list = dao.getAllTeamDatas();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<button type="button" class="btn btn-info"
		onclick="location.href='insertForm.jsp'">팀원추가</button>
	<br>
	<table class="table table-bordered" style="width: 800px">
		<caption>
			<b>팀원정보목록</b>
		</caption>
		<tr bgcolor="olive">
			<th width="60">번호</th>
			<th width="60">이름</th>
			<th width="60">운전면허</th>
			<th width="60">핸드폰</th>
			<th width="60">작성일</th>
			<th width="60">편집</th>
		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			TeamDto dto = list.get(i);
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><%=dto.getMyname()%></td>
			<td><%=dto.getDriver()%></td>
			<td><%=dto.getHp()%></td>
			<td><%=sdf.format(dto.getWriteday())%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
<%@page import="sinsang.model.SinsangDto"%>
<%@page import="sinsang.model.SinsangDao"%>
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
<body>
	<%
	String num = request.getParameter("num");
	SinsangDao dao = new SinsangDao();
	SinsangDto dto = dao.getData(num);
	%>
	<!-- 홍길동 개인정보
	이름:홍길동 -->
	<div style="margin: 30px 30px">
		<table class="table table-bordered" style="width: 500px;">
			<caption>
				<h2 class="alert alert-info" style="width: 500px"><%=dto.getName()%>님의
					개인정보
				</h2>
			</caption>
			<tr>
				<th style="background-color: lightgray; text-align: center;">이름</th>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<th style="background-color: lightgray; text-align: center;">혈액형</th>
				<td><%=dto.getBlood()%></td>
			</tr>
			<tr>
				<th style="background-color: lightgray; text-align: center;">핸드폰번호</th>
				<td><%=dto.getHp()%></td>
			</tr>
			<tr>
				<th style="background-color: lightgray; text-align: center;">생년월일</th>
				<td><%=dto.getBirth()%></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
			<input type="button" class="btn btn-info" value="뒤로가기" onclick="history.back()">
			<input type="button" class="btn btn-info" value="수정" onclick="location.href='updateform.jsp?num=<%=dto.getNum()%>'">
			<input type="button" class="btn btn-info" value="삭제" onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'">
			</td>
			</tr>

		</table>
	</div>
</body>
</html>
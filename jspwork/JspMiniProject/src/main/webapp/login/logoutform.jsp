<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="margin-left: 100px; margin-top: 50px;">
		<img alt="" src="image/30.jpg" align="left" hspace="20">
		<%
		// 세션으로부터 아이디 얻는다
		String myid = (String) session.getAttribute("myid");

		// db에서 아이디에 해당하는 이름 얻기
		MemberDao dao = new MemberDao();
		String name = dao.getName(myid);

		
		%>

		<br>
		<br>
		<b><%=name%>님 </b>
		<br>
		<br>
		<button type="button" class="btn btn-danger" style="width: 120px;" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>


	</div>
</body>
</html>
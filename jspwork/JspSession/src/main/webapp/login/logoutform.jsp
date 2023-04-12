<%@page import="login.model.LoginDao"%>
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
	// 세션으로부터 아이디를 읽어옴
	String id = (String) session.getAttribute("idok");

	// 아이디에 해당하는 이름을 dao로부터 얻어올 수 있음
	LoginDao db = new LoginDao();
	String name = db.getName(id);
	%>
	
	<br><br>
	<b style="color:blue"><%=name %></b>
	님이 로그인하셨습니다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="로그아웃" onclick="location.href='logoutproc.jsp'">
	<br><br>
	<img alt="" src="../image/1.jpg" style="margin-left: 100px">
</body>
</html>
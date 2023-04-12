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
</head>
<body>
<%
// id 읽어오기
String id = request.getParameter("id");

// dao
MemberDao dao = new MemberDao();

// 아이디에 따른 이름 얻기
String name= dao.getName(id);

%>
<div>
<img alt="" src="image/10.jpg">
<b><%=name %>님의 회원가입을 축하합니다</b>
<br><br>

<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=layout/main.jsp'">Home</button>
</div>
</body>
</html>
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
// 세션저장
session.setAttribute("msg", "happy!!");
session.setMaxInactiveInterval(10);
%>

<h2>10초안에 눌러줘</h2>
<form action="sessionAction.jsp" method="post">
<h2>가고 싶은 여행지는?</h2>
<input type="radio" value="이탈리아 로마 5박 6일" name="travel">이탈리아 로마&nbsp;
<input type="radio" value="캐나다 로키 3박 4일" name="travel">캐나다 로키&nbsp;
<input type="radio" value="미국 시애틀 6박 7일" name="travel">미국 시애틀&nbsp;
<input type="radio" value="호주 시드니 7박 9일" name="travel" checked="checked">호주 시드니&nbsp;

<input type="submit" value="상품신청">
</form>
</body>
</html>
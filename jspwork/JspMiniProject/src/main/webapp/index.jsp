<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">
div.layout {
	border: 0px solid gray;
	position: absolute;
	font-family: 'Gamja Flower', cursive;
}

div.title {
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 25px;
	text-align: center;
}

div.menu {
	width: 100%;
	height: 80px;
	font-size: 20px;
	top: 120px;
	text-align: center;
}

div.info {
	width: 170px;
	height: 200px;
	line-height: 10px;
	font-size: 15pt;
	top: 280px;
	border: 1px solid gray;
	border-radius: 20px;
	left: 50px;
	padding: 20px 10px;
	font-size: 15pt;
	font-family: 'Hi Melody', cursive;
}

div.main {
	width: 1200px;
	height: 800px;
	font-size: 12pt;
	top: 280px;
	left: 300px;
	margin-left: 50px;
}
</style>
</head>
<%
String mainPage = "layout/main.jsp";

//url을 통해서 main값을 읽어서 메인페이지에 출력을 한다
if (request.getParameter("main") != null) {
	mainPage = request.getParameter("main");
}

String root = request.getContextPath();
%>
<body>
	<div class="layout title">
		<jsp:include page="layout/title.jsp" />
	</div>

	<div class="layout menu">
		<jsp:include page="layout/menu.jsp" />
	</div>

	<div class="layout info">
		<jsp:include page="layout/info.jsp" />
	</div>

	<div class="layout main">
		<jsp:include page="<%=mainPage%>" />
	</div>
</body>
</html>
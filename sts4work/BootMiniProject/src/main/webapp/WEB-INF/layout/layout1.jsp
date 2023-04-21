<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
body {
	font-family: 'Noto Sans KR';
}

div.layout div {
	border: 0px solid gray;
}

div.layout div.title {
	position: absolute;
	top: 10px;
	left: 700px;
	height: 100px;
}

div.layout div.menu {
	position: absolute;
	top: 150px;
	left: 300px;
	width: 1500px;
	height: 100px;
}

div.layout div.info {
	position: absolute;
	top: 300px;
	left: 50px;
	width: 270px;
	height: 400px;
}

div.layout div.main {
	position: absolute;
	top: 280px;
	left: 400px;
	width: 1000px;
	height: 800px;
}
</style>
</head>
<body>
		<div class="layout">
			<div class="title">
				<tiles:insertAttribute name="title" />
			</div>
			<div class="menu">
				<tiles:insertAttribute name="menu" />
			</div>
			<div class="info">
				<tiles:insertAttribute name="info" />
			</div>
			<div class="main">
				<tiles:insertAttribute name="main" />
			</div>
		</div>
</body>
</html>
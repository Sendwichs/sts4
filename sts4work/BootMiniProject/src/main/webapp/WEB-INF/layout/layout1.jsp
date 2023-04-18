<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-size: 1.3em;
	font-family: 'Noto Serif KR', serif;
}

div.layout div {
	border: 1px solid gray;
	font-family: 'Noto Serif KR', serif;
}

div.layout div.title {
	position: absolute;
	top: 10px;
	left: 600px;
	height: 100px;
	font-family: 'Noto Serif KR', serif;
}

div.layout div.menu {
	position: absolute;
	top: 150px;
	left: 150px;
	height: 80px;
	font-family: 'Noto Serif KR', serif;
	
}

div.layout div.info {
	position: absolute;
	top: 250px;
	left: 0px;
	width: 40%;
	height: 100%;
	font-family: 'Noto Serif KR', serif;
}

div.layout div.main {
	position: absolute;
	top: 250px;
	left: 250px;
	height: 800px;
	font-family: 'Noto Serif KR', serif;
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
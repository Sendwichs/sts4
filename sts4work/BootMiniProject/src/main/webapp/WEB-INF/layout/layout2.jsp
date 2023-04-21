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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-size: 1.3em;
	font-family: 'Nanum Pen Script', cursive;
}

div.layout div {
	font-family: 'Nanum Pen Script', cursive;
}

div.layout div.title {
	position: absolute;
	top: 10px;
	left: 200px;
	height: 130px;
	font-family: 'Nanum Pen Script', cursive;
}

div.layout div.menu {
	position: absolute;
	top: 150px;
	left: 200px;
	font-family: 'Nanum Pen Script', cursive;
}

div.layout div.main {
	position: relative;
	top: 250px;
	left: 250px;
	height: 800px;
	font-family: 'Nanum Pen Script', cursive;
}
</style>
</head>
<body>

	<div class="layout">
		<div class="title">
			<tiles:insertAttribute name="title2" />
		</div>
		<div class="menu">
			<tiles:insertAttribute name="menu2" />
		</div>
		<div class="info">
			<tiles:insertAttribute name="info2" />
		</div>
		<div class="main">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<img alt="" src="${root }/image/겨울왕국1.jpeg" style="max-width: 150px; max-height: 300px; position: relative; left: 300px;">
	<br>
	<br>
	<img alt="" src="${root }/image/겨울왕국2.jpeg" style="max-width: 150px; max-height: 300px; position: relative; left: 300px;">
	<br>
	<br>
	<img alt="" src="${root }/image/곤지암.jpg" style="max-width: 150px; max-height: 300px; position: relative; left: 300px;">
	<br>
	<br>
</body>
</html>
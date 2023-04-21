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
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />


	<c:if test="${sessionScope.loginok==null }">
		<img alt="" src="${root }/image/6번 칸.png" width="130" height="130" class="img-circle">
	</c:if>

	<c:if test="${sessionScope.loginok!=null }">
		<img alt="" src="${root }/photo/${sessionScope.loginphoto}" width="130" height="130" class="img-circle">
	</c:if>
	<br>
	<br>
	<span class="glyphicon glyphicon-envelope">email</span>
	&nbsp;sist@gmail.com
	<br>
	<br>
	<span class="glyphicon glyphicon-cog"></span>
	&nbsp;쌍용교육센터
	<br>
	<br>
	<a href="">
		<img alt="" src="../image/insta.PNG" style="width: 30px;">
		&nbsp;쌍용교육센터
	</a>
	<br>
	<br>
	<img alt="" src="../image/animation_smart.gif" style="width: 200px;">
</body>
</html>
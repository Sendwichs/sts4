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
body {
	font-size: 1.5em;
	font-family: Hi Melody;
}

ul.menu {
	list-style: none;
}

ul.menu li {
	width: 100px;
	float: left;
	height: 60px;
	line-height: 60px;
	text-align: center;
	font-size: 20px;
	background-color: lightblue;
	cursor: pointer;
}

ul.menu li a {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<ul class="menu">
		<li>
			<a href="${root }/">Home</a>
		</li>
		<li>
			<a href="${root }/ipgo/list">입고목록</a>
		</li>
		<li>
			<a href="${root }/board/list">게시판</a>
		</li>
		<li>
			<a href="${root }/smart/list">스마트게시판</a>
		
		</li>
		<li>
			<a href="${root }/reboard/list">답변형게시판</a>
		
		</li>
			<c:if test="${sessionScope.loginok!=null and sessionScope.myid=='admin' }">
		<li>
				<a href="${root }/member/list">회원목록</a>
		</li>
			</c:if>
		<li>
			<a href="${root }/login/main">로그인</a>
		</li>
		<li>
			<a href="${root }/member/form">회원가입</a>
		</li>
		<li>
			<a href="${root }/member/myinfo">나의정보</a>
		</li>
		<li>
			<a href="${root }/ipgo/form">상품등록</a>
		</li>
		<li>
			<a href="${root }/sangpum/list">상품목록</a>
		</li>
		<li>
			<a href="${root }/load/map">오시는길</a>
		</li>
	</ul>
</body>
</html>
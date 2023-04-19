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

	<button type="button" class="btn btn-info" onclick="location.href='list'">전체회원목록</button>
	<h3 align="center">★ 총 ${count }명 ★</h3>
	<table class="table table-bordered" style="width: 1200px">
		<tr">
			<th style="text-align: center;">번호</th>
			<th style="text-align: center;">이름</th>
			<th style="text-align: center;">아이디</th>
			<th style="text-align: center;">비밀번호</th>
			<th style="text-align: center;">전화번호</th>
			<th style="text-align: center;">주소</th>
			<th style="text-align: center;">이메일</th>
			<th style="text-align: center;">가입날짜</th>
		</tr>
		<c:forEach items="${list }" var="dto" varStatus="i">
			<tr align="center">
				<td>${i.count}</td>
				<td>
					<img alt="" src="../photo/${dto.photo }" style="width: 25px; height: 25px">
					${dto.name }
				</td>
				<td>${dto.id }</td>
				<td>${dto.pw }</td>
				<td>${dto.hp }</td>
				<td>${dto.addr }</td>
				<td>${dto.email }</td>
				<td>${dto.gaipday }</td>
				<td>
					<input type="checkbox" class="del" num=${dto.num }>
				</td>
			</tr>

		</c:forEach>
		<tr>
			<td colspan="9" align="center">
				<button type="button" class="btn btn-success" id="update" onclick="location.href='updateform?num=">수정</button>
				<button type="button" class="btn btn-danger" id="delete" onclick="location.href='delete?num=">삭제</button>
			</td>
		</tr>

	</table>
</body>
</html>
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

	<button type="submit" style="width: 150px;" class="btn btn-info" onclick="location.href='writeform'">멤버 정보 입력</button>

	<hr>

	<table class="table table-bordered" style="width: 700px;">
		<tr bgcolor="#f0fff">
			<th width="60" style="text-align: center">번호</th>
			<th width="60" style="text-align: center">이름</th>
			<th width="60" style="text-align: center">주소</th>
			<th width="60" style="text-align: center">전화번호</th>
			<th width="120" style="text-align: center">구입일</th>
			<th width="100" style="text-align: center">수정|삭제</th>
		</tr>

		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td style="text-align: center">${i.count }</td>
				<td style="text-align: center">${dto.name }</td>
				<td style="text-align: center">${dto.hp }</td>
				<td style="text-align: center">${dto.addr }</td>
				<td style="text-align: center">${dto.gaipday }</td>
				<td style="text-align: center">
					<button type="button" class="btn btn-info btn-xs" onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-info btn-xs" onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>

			</tr>


		</c:forEach>
	</table>



	<c:if test="${totalCount==0 }">
		<h3 class="alert alert-info">저장된 멤버의 정보가 없습니다</h3>
	</c:if>

	<c:if test="${totalCount>0 }">
		<h3 class="alert alert-info">총 ${totalCount }명이 있습니다.</h3>
	</c:if>



</body>
</html>
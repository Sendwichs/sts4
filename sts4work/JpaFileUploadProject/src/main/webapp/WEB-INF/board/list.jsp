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
.box {
	width: 100px;
	height: 100px;
	border: 1px solid gray;
	border-radius: 100px;
}
</style>
</head>
<body>
	<div style="margin: 50px 50px;">
		<button type="button" class="btn btn-info" onclick="location.href='writeform'">글쓰기</button>
		<br>
		<h2 class="alert alert-info">총 ${count }개</h2>
	</div>

	<table style="width: 800px;" class="table table-bordered">

		<tr>
			<th style="text-align: center;">작성자</th>
			<th style="text-align: center;">제목</th>
			<th style="text-align: center;">내용</th>
			<th style="text-align: center; width: 100px">사진</th>
			<th style="text-align: center;">작성날짜</th>
		</tr>
		<c:forEach var="dto" varStatus="i" items="${list }">
			<tr>
				<td style="vertical-align: middle; text-align: center;">${dto.writer}</td>
				<td style="vertical-align: middle; text-align: center;">${dto.subject}</td>
				<td style="vertical-align: middle; text-align: center;"><a href="detailPage?num=${dto.num }">${dto.content}</a></td>
				<c:if test="${dto.photo=='no'}">
					<td style="vertical-align: middle; text-align: center;"><img class="box" alt="" src="../save/no.png" style="max-width: 100px; max-height: 100px;"></td>
				</c:if>
				<c:if test="${dto.photo!='no' }">
					<td style="vertical-align: middle; text-align: center;"><img class="box" alt="" src="../save/${dto.photo }" style="max-width: 100px; max-height: 100px;"></td>
				</c:if>
				<td style="vertical-align: middle; text-align: center;">${dto.writeday}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
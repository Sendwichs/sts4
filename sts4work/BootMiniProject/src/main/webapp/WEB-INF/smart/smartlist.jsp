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
	<div style="width: 1100px;" align="center">
		<h2>총 ${totalCount }개의 게시판</h2>
		<button type="button" onclick="location.href='form'">상품 추가</button>
	</div>
	<div style="width: 1000px" align="center">
		<table class="table table-bordered" style="width: 800px; margin-left: 120px">
			<tr bgcolor="#ffc0cb" style="text-align: center;">
				<th style="text-align: center;" width="60">번호</th>
				<th style="text-align: center;" width="160">상품명</th>
				<th style="text-align: center;" width="460">색상</th>
				<th style="text-align: center;" width="80">가격</th>
				<th style="text-align: center;" width="160">입고일</th>
			</tr>
			<c:if test="${totalCount==0 }">
				<tr>
					<td colspan="5" align="center">
						<b>등록된 게시물이 없습니다</b>
					</td>
				</tr>
			</c:if>
			<c:if test="${totalCount>0 }">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td align="center">${no}</td>
						<c:set var="no" value="${no-1 }" />
						<td align="center">
							<a href="detail?num=${dto.num }&currentPage=${currentPage}">${dto.sangname }</a>
						</td>
						<td>${dto.color}
						<td>${dto.price }
						<td align="center">$ {dto.ipgoday }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>

</body>
</html>
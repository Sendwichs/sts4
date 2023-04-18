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
	<c:if test="${totalCount==0 }">
		<div class="alert alert-info">
			<b>저장된 상품정보가 없음</b>
		</div>
	</c:if>
	<c:if test="${totalCount>0 }">
		<div class="alert alert-info">
			<b>총 ${totalCount }권의 책 목록</b>
		</div>
	</c:if>
	<c:forEach var="a" items="${list }" varStatus="i">
		<table class="table table-bordered" style="width: 800px">
			<tr>
				<td align="center" style="vertical-align: middle;">${i.count }</td>
				<td>
					<c:if test="${a.bookphoto!=null }">
						<img alt="" src="../upload/${a.bookphoto }" style="max-width: 150px;" align="left">
					</c:if>
					<c:if test="${a.bookphoto==null }">
						<img alt="" src="../upload/no.png" style="max-width: 150px;" align="left">
					</c:if>
					<h4>이름 : ${a.bookname }</h4>
					<h4>작성자 : ${a.bookwriter }</h4>
					<h4>제작사 : ${a.bookcompany }</h4>
					<h4>
						가격 :
						<fmt:formatNumber value="${a.bookprice }" type="currency" />
					</h4>
					<h4>
						입고날짜 :
						<fmt:formatDate value="${a.ipgoday }" pattern="yyyy-MM-dd" />
					</h4>

					<button type="button" class="btn btn-success" onclick="location.href='updateform?num=${a.num}'">수정</button>
					<button type="button" class="btn btn-danger" onclick="location.href='delete?num=${a.num}'">삭제</button>
				</td>
			</tr>


		</table>

	</c:forEach>

</body>
</html>
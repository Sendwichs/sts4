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
	<c:if test="${sessionScope.loginok!=null }">
		<button type="button" class="btn btn-info" style="width: 100px; margin-left: 900px;" onclick="location.href='form'">글쓰기</button>
	</c:if>
	<br>
	<br>

	<table class="table table-bordered" style="width: 1000px;">
		<tr bgcolor="#ffc0cb" style="text-align: center;">
			<th style="text-align: center;" width="60">번호</th>
			<th style="text-align: center;" width="160">작성자</th>
			<th style="text-align: center;" width="460">제목</th>
			<th style="text-align: center;" width="80">조회</th>
			<th style="text-align: center;" width="160">등록일</th>
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
					<td align="center">${dto.name }</td>
					<td>
						<a href="content?num=${dto.num }&currentPage=${currentPage}">${dto.subject }</a>
						<c:if test="${dto.uploadfile!='no' }">
						<span class="glyphicon glyphicon-paperclip"></span>
						</c:if>
					</td>
					<td align="center">${dto.readcount }</td>
					<td align="center">
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd" />
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<!-- 페이징 -->
	<c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align: center;">
			<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${startPage>1 }">
					<li>
						<a href="list?currentPage=${startPage-1 }">이전</a>
					</li>
				</c:if>

				<c:forEach var="pp" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage==pp }">
						<li class="active">
							<a href="list?currentPage=${pp }">${pp }</a>
						</li>
					</c:if>

					<c:if test="${currentPage!=pp }">
						<li>
							<a href="list?currentPage=${pp }">${pp }</a>
						</li>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${endPage<totalPage }">
					<li>
						<a href="list?currentPage=${endPage+1}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:if>
</body>
</html>
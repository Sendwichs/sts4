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
	<table class="table table-bordered" style="position: absolute; width: 800px; left: 150px">
		<tr>
			<td>
				<h3>
					<b>${dto.subject }</b>
					<span style="color: gray; float: right; font-size: 15pt">
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" />
					</span>
				</h3>

				<span>작성자 : ${dto.name }(${dto.myid })</span>

				<c:if test="${dto.uploadfile!='no' }">
					<span style="float: right;">
						<a href="download?clip=${dto.uploadfile }">
							<span class="glyphicon glyphicon-download-alt"></span>

							<b>${dto.uploadfile }</b>
						</a>
					</span>
				</c:if>
			</td>
		</tr>

		<tr>
			<td align="center">
				<c:if test="${bupload==true }">
					<h3>업로드 파일 : 이미지</h3>
					<img alt="" src="../photo/${dto.uploadfile }" style="max-width: 300px">
				</c:if>

				<br>
				<br>
				<pre style="background-color: #fff; border: 0px;">
				${dto.content }
				</pre>
				<br>

				<b style="float: right;">조회 : ${dto.readcount }</b>
			</td>
		</tr>

		<!-- 버튼 -->
		<tr>
			<td align="left">
				<!-- 글쓰기는 로그인 중일때만 -->
				<c:if test="${sessionScope.loginok!=null }">
					<button type="button" class="btn btn-default" onclick="location.href='form'">글쓰기</button>
				</c:if>
				<button type="button" class="btn btn-default" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				<!-- 로그인 중이면서 자기글만 수정, 삭제 버튼 보이기 -->
				<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
					<button type="button" class="btn btn-default" onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-default" onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>
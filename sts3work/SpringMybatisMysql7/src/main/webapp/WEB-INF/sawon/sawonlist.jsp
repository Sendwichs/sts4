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
	<span class="alert alert-info">
		<b>총 ${totalCount }명의 사원명단입니다</b>
	</span>


	<br>
	<br>
	<button type="button" class="btn btn-info" onclick="location.href='form'">글쓰기</button>
	<div style="width: 800px; text-align: center;">
		<form action="list" class="form-inline">
			<select name="title" class="form-control" style="width: 130px;">
				<option value="name" ${title=='name'?"selected":"" }>이름</option>
				<option value="buseo" ${title=='buseo'?"selected":"" }>부서</option>
				<option value="driver" ${title=='driver'?"selected":"" }>운전면허</option>
			</select>
			<input type="text" name="search" class="form-control" placeholder="검색 단어" style="width: 100px" value="${search }">
			<button type="submit" class="btn btn-success">검색</button>

		</form>
	</div>
	<br>
	<br>
	<table>
		<tr style="height: 30px">
			<th align="center" bgcolor="pink" width="100px">No.</th>
			<th align="center" bgcolor="pink" width="100px">사원명</th>
			<th align="center" bgcolor="pink" width="100px">부서명</th>
			<th align="center" bgcolor="pink" width="100px">사진</th>
			<th align="center" bgcolor="pink" width="100px">운전면허</th>
			<th align="center" bgcolor="pink" width="100px">입사년도</th>
			<th align="center" bgcolor="pink" width="150px">비고</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.name }</td>
				<td>${dto.buseo}</td>
				<td>
					<c:if test="${dto.photo!='no' }">
						<img alt="" src="../photo/${dto.photo }" style="width: 50px; height: 50px" class="img-circle">
					</c:if>
					<c:if test="${dto.photo=='no' }">
						<img alt="" src="../photo/no.PNG" style="width: 50px; height: 50px" class="img-circle">
					</c:if>
				</td>
				<td>${dto.driver }</td>
				<td style="width: 150px">
					<fmt:formatDate value="${dto.ipsaday }" pattern="yyyy년 MM월 dd일" />
				</td>
				<td>
					<button class="btn btn-info btn-xs" onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button class="btn btn-info btn-xs" onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>
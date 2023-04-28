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
	<c:if test="${sessionScope.loginok==null }">
		<script type="text/javascript">
			alert("먼저 로그인 후 시도하세요!")
			history.back();
		</script>
	</c:if>
	<form action="insert" method="post" enctype="multipart/form-data">
		<!-- hidden -->
		<input type="hidden" name="num" value="${num }">
		<input type="hidden" name="regroup" value="${regroup }">
		<input type="hidden" name="restep" value="${restep }">
		<input type="hidden" name="relevel" value="${relevel }">
		<input type="hidden" name="currentPage" value="${currentPage }">

		<!-- 로그인 시 지정된 세션값 -->
		<input type="hidden" name="id" value="${sessionScope.myid }">
		<input type="hidden" name="name" value="${sessionScope.loginname }">

		<table class="table table-bordered" style="margin: 100px 100px; width: 500px">
			<caption>
				<b>
					<c:if test="${num==0 }">
				새글쓰기
				</c:if>
					<c:if test="${num!=0 }">
				답글쓰기
				</c:if>
				</b>
			</caption>
			<tr>
				<th width="120" bgcolor="#ddd">제목</th>
				<td>
					<input type="text" name="subject" class="form-control" required="required" autofocus="autofocus">
				</td>
			</tr>

			<tr>
				<th width="120" bgcolor="#ddd">사진</th>
				<td>
					<input type="file" name="upload" class="form-control">
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<textarea style="width: 490px; height: 150px;" class="form-control" required="required" name="content"></textarea>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>

	</form>
</body>
</html>
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

	<form action="update" method="post">
		<table class="tablr table-bordered" style="width: 350px;">
			<caption>
				<b>멤버 수정</b>
			</caption>

			<tr>
				<th bgcolor="pink" width="100">이름</th>
				<td>
					<input type="text" name="name" size="10" required="required" ${dto.name }>
				</td>
			</tr>

			<tr>
				<th bgcolor="pink" width="100">전화번호</th>
				<td>
					<input type="text" name="hp" size="10" required="required" ${dto.hp }>
				</td>
			</tr>

			<tr>
				<th bgcolor="pink" width="100">주소</th>
				<td>
					<input type="text" name="addr" size="10" required="required" ${dto.addr }>
				</td>
			</tr>

			<tr>
				<th bgcolor="pink" width="100">가입날짜</th>
				<td>
					<input type="date" name="gaipday" size="10" required="required" ${dto.gaipday }>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-default">DB수정</button>
					<button type="button" class="btn btn-default" onclick="location.href='memberlist'">목록</button>
				</td>
			</tr>

		</table>

	</form>

</body>
</html>
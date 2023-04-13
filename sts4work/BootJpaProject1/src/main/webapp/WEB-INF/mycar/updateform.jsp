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
		<input type="hidden" name="num" value="${dto.num }">
		<table class="table table-bordered" style="width: 300px">

			<tr>
				<th width="100">자동차명</th>
				<td><input type="text" name="carname" class="form-control" value=${dto.carname }></td>
			</tr>
			<tr>
				<th width="100">단가</th>
				<td><input type="text" name="carprice" class="form-control" value=${dto.carprice }></td>
			</tr>
			<tr>
				<th width="100">색상</th>
				<td><input type="color" name="carcolor" class="form-control" value="${dto.carcolor }"></td>
			</tr>
			<tr>
				<th width="100">구입일</th>
				<td><input type="date" name="carguip" class="form-control" value="${dto.carguip }"></td>
			</tr>


			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">서버에 전송</button>
					<button type="button" class="btn btn-info" onclick="location.href='carlist'">목록</button>

				</td>
			</tr>
		</table>
	</form>
</body>
</html>
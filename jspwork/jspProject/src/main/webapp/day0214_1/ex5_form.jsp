<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>여러 데이터 전송하기</h2>
	<form action="ex5_action.jsp" method="get">
		<!-- 설정 안하면 get이 디폴트 -->
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th bgcolor="#ffa" width="100">이름</th>
				<td><input type="text" name="name" size="5" placeholder="이름"
					required="required"></td>
			</tr>

			<tr>
				<th bgcolor="#ffa" width="100">비밀번호</th>
				<td><input type="password" name="pass" size="5"
					placeholder="비밀번호" required="required"></td>
			</tr>

			<tr>
				<th bgcolor="#ffa" width="100">운전면허</th>
				<td><input type="checkbox" name="license">운전면허여부</td>
			</tr>
			
			<tr>
			<td colspan="2" align="center">
			<input type="submit" value="서버전송">
			<input type="reset" value=초기화>
			</td>
			</tr>
		</table>
	</form>
</body>
</html>
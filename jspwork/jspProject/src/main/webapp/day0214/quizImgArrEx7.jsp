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
<style type="text/css">
img.mainimg {
	width: 120px;
	height: 160px;
	border: 1px solid gray;
}

img.mainimg:hover{
	width: 240px;
	height: 320px;
}

table.maintb {
	width: 650px;
}
</style>
</head>

<body>
	<!-- 배열 선언없이 일련번호인 이미지 20개를 4행 5열로 출력. 이미지나 테이블 크기 모두 자유 만화이미지, 미니언즈, 연예인사진 모두 가능 -->
	<table class="maintb">
		<%
		int n = 0;
		for (int i = 1; i <= 4; i++) {
		%>
		<tr>
			<%
			for (int col = 1; col <= 5; col++) {
				n++;
			%>
			<td><img src="../image/<%=n%>.jpg" class="mainimg"></td>
			<%
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
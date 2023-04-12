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
	<%
	//배열 선언
	String[] colors = { "green", "red", "yellow", "gray", "magenta" };

	// 제목 선언
	String title = "배열 출력";
	%>
	<table class="table table bordered" style="width: 200px">
		<caption>
			<b><%=title%></b>
		</caption>
		<tr bgcolor="gray">
			<th>번호</th>
			<th>색상</th>
		</tr>
		<%
		for (int i = 0; i < colors.length; i++) {
		%>
		<tr>
			<td><%=i + 1%></td>
			<td>
			<b style="color: <%=colors[i]%>"><%=colors[i]%></b>
			</td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>
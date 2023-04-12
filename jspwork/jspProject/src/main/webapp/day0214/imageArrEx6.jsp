<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Hi+Melody&family=Noto+Serif+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="../js/rgb.js"></script>
<style type="text/css">
table {border; 4px solid gray;width 450px;
	
}

tr, th, td {
	border: 2px solid pink;
	font-size: 10pt;
}
</style>
</head>
<body>
	<%
	String[] str = { "1.jpg", "3.jpg", "5.jpg", "11.jpg", "13.jpg", "15.jpg", "17.jpg", "18.jpg", "20.jpg" };
	int n = 0;
	%>

	<table>
		<%
		for (int i = 0; i < 3; i++) {
		%>
		<tr>
			<%
			for (int j = 0; j < 3; j++) {
			%>
			<td><img alt="" src="../image/<%=str[n]%>" width="150"
				height="150"></td>
			<%
			n++;
			}
			%>
		</tr>
		<%
		}
		%>
	</table>




</body>
</html>
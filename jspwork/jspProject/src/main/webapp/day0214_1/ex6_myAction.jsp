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
	String c1 = request.getParameter("city");
	String[] c2 = request.getParameterValues("city2");
	%>

	<h2>
		희망지역 :
		<%=c1%></h2>
	<h2>
		희망지역 2순위 :
		<%
	if (c2 == null) {
	%>
		<font color="red">지역선택안함</font>
		<%
		} else {
		for (int i = 0; i < c2.length; i++) {
		%>
		[<%=c2[i]%>]&nbsp;
		<%
		}
		%>
		<b>총 <%=c2.length%>개 지역 선택함
		</b>
		<%
		}
		%>


	</h2>
</body>
</html>
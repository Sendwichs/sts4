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
	String pass = request.getParameter("pass");
	String num = request.getParameter("num");
	
	// 비밀번호 a1234면 삭제
	if(pass.equals("a1234"))
		response.sendRedirect("ssdelete.jsp?num="+num);
	else
	{%>
		<script type="text/javascript">
		alert("비밀번호가 맞지 않음");
		history.back();
		</script>
	<%}
	%>
</body>
</html>
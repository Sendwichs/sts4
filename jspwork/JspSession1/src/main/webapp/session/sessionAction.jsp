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
	request.setCharacterEncoding("utf-8");
	
	// 세션이 있는지 확인 후 없으면 상품 꽝
	String msg=(String)session.getAttribute("msg");
	String travel=request.getParameter("travel");
	
	if(msg==null || !msg.equals("happy!!!")){%>
		<h3 style="color:red;">시간 초과로 꽝</h3>
		<%
	}else{
		%>
		<h3 style="color:blue;">축하<%=travel %>상품 당첨</h3>
		<%
	}
	%>
</body>
</html>
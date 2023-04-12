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
	div.box{
	float: left;
	width: 50px;
	height: 50px;
	border-radius: 100px;
	margin-left: 10px
	}
	</style>
</head>
<body>
	<%
	String sang = request.getParameter("sang");
	String[] scolor = request.getParameterValues("scolor");
	String ssize = request.getParameter("ssize");
	String schuga = request.getParameter("schuga");
	%>

	<h2>
		상품명 :<%=sang %>
	</h2>
	<h3>상품색상 : <br>
	<%
	if(scolor==null){%>
		<b>선택한 색상 없음</b>
	<%}else{
		for(String s:scolor){%>
			<div style="background-color : <%=s%>" class="box"></div>
		<%}
	}
	%>
	</h3><br><br>
	<h3>사이즈 : <%=ssize %></h3>
	<h3>추가상품 : <%=schuga %></h3>
</body>
</html>
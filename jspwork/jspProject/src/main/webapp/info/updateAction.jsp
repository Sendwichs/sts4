<%@page import="info.model.InfoDao"%>
<%@page import="info.model.InfoDto"%>
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
	// 한글엔코딩
	request.setCharaterEncoding("utf-8");

	// 데이터읽기
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");

	InfoDto dto = new InfoDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);

	InfoDao dao = new InfoDao();
	dao.updateInfo(dto);
	
	// 수정한 후 다시 목록
	response.sendRedirect("infoLst.jsp");	
	%>
</body>
</html>
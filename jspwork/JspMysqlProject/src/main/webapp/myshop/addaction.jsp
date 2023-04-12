<%@page import="Myshop.model.MyshopDao"%>
<%@page import="Myshop.model.MyshopDto"%>
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
	// 데이터 읽기
	String sangpum = request.getParameter("sangpum");
	String photo = request.getParameter("photo");
	int price = Integer.parseInt(request.getParameter("price"));
	String ipgoday = request.getParameter("ipgoday");

	MyshopDto dto = new MyshopDto();
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);

	// dao
	MyshopDao dao = new MyshopDao();
	
	dao.insertShop(dto);
	
	// 목록
	response.sendRedirect("shoplist.jsp");
	%>
</body>
</html>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.CartDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">
div.cart{
float: left;
text-align: center;
margin-left: 100px
}
</style>
</head>
<body>
	<%
	String myid = (String) session.getAttribute("myid");
	MemberDao dao = new MemberDao();
	ShopDao sdao = new ShopDao();
	String name = dao.getName(myid);
	String idx = sdao.

	
	
	%>
	<div class="cart"><%=name%>님의 장바구니
		<table class="table table-bordered tablecart">
			<tr>
				<td width="150">상품번호</td>
				<td width="200">상품명</td>
				<td width="100">구매자번호</td>
				<td width="100">개수</td>
				<td width="200">담은 날</td>
			</tr>
		</table>
	</div>
</body>
</html>
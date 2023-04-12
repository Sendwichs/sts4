<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
div.cart {
	float: right;
	cursor: pointer;
}

span.carticon {
	font-size: 30px;
}

div.count {
	float: right;
	color: white;
	height: 30px;
	width: 30px;
	border-radius: 100px;
	line-height: 30px;
	text-align: center;
	background-color: blue;
	font-weight: bold;
	margin-top: 15px;
	position: relative;
	left: -10px;
	top: -5px
}
</style>
<script type="text/javascript">
	$(function() {
		$("div.cart").click(function() {
			location.href = "index.jsp?main=shop/mycart.jsp";
		})
	})
</script>
</head>
<%
String root = request.getContextPath();
%>
<body>
	<a href="<%=root%>" style="color: black;"> <img alt="" src=""> JSP&Jquery 프로젝트
	</a>

	<div style="float: right; padding-right: 100px;">
		<%
		// 로그인 세션 얻기
		String loginok = (String) session.getAttribute("loginok");

		// 아이디 얻기
		String myid = (String) session.getAttribute("myid");
		MemberDao dao = new MemberDao();
		String name = dao.getName(myid);

		if (loginok == null) {
		%>
		<button type="button" class="btn btn-success" style="width: 100px;" onclick="location.href='index.jsp?main=login/loginmain.jsp'">Login</button>
		<%
		} else {
		%>
		<b style="font-size: 12pt;"><%=name%>님 로그인중...</b>
		<button type="button" class="btn btn-danger" style="width: 100px;" onclick="location.href='index.jsp?main=login/logoutaction.jsp'">Logout</button>
		<%
		}
		%>

		<!-- 카트 -->
		<div class="cart">
			<%
			//shopdao 선언
			ShopDao sdao = new ShopDao();
			// 카트 개수
			int cartSize = sdao.getCartList(myid).size();
			%>
			<span class="carticon glyphicon glyphicon-shopping-cart"></span>
			<div class="count"><%=cartSize%></div>
		</div>
	</div>
</body>
</html>
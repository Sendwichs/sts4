<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Myshop.model.MyshopDto"%>
<%@page import="Myshop.model.MyshopDao"%>
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
	// num 읽기
	String num = request.getParameter("num");

	// dao 선언
	MyshopDao dao = new MyshopDao();

	// num에 해당하는 dto얻기
	MyshopDto dto = dao.getSangpum(num);

	NumberFormat nf = NumberFormat.getCurrencyInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>

	<div style="margin: 30px 30px;">
		<table class="table table-bordered" style="width: 600px;">
			<caption>
				<b>상품상세보기</b>
			</caption>
			<tr>
				<td rowspan="5"><img alt=""
					src="../쇼핑몰사진/<%=dto.getPhoto()%>.jpg"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><%=dto.getSangpum()%></td>
			</tr>

			<tr>
				<th>가격</th>
				<td><%=nf.format(dto.getPrice())%></td>
			</tr>
			<tr>
				<th>입고일</th>
				<td><%= sdf.format(dto.getWriteday())%></td>
				
			</tr>
			<tr>
			<td colspan="3" align="center">
			<button type="button" class="btn btn-warning" onclick="history.back()">이전으로</button>
			<button type="button" class="btn btn-warning" onclick="location.href='addform.jsp'" >상품등록</button>
			<button type="button" class="btn btn-warning" onclick="location.href='shoplist.jsp'" >상품목록</button>
			<button type="button" class="btn btn-warning" onclick="location.href='updateform.jsp'" >수정</button>
			<button type="button" class="btn btn-warning" onclick="location.href=''" >삭제</button>
			</td>
			</tr>
			
			
			

		</table>

	</div>
</body>
</html>
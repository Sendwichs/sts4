<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
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
	MyshopDao dao = new MyshopDao();
	List<MyshopDto> list = dao.getAllSangpums();
	%>

	<div style="margin: 30px 30px;">
		<h3 class="alert alert-info" style="width: 800px">MyShop 목록</h3>
		<button type="button" class="btn btn-info btn-sm"
			onclick="location.href='addform.jsp'">상품추가</button>
		<br>
		<table class="table table-bordered" style="width: 800px">
			<tr class="table-info" style="text-align: center">
				<th width="60">번호</th>
				<th width="300">상품명</th>
				<th width="120">가격</th>
				<th width="160">입고일</th>
				<th width="160">등록일</th>

			</tr>
			<%
			if (list.size() == 0) {
			%>
			<tr>
				<td colspan="5" align="center">
					<h3>
						<b>등록된 상품 없음</b>
					</h3>
				</td>
			</tr>
			<%
			} else {
			NumberFormat nf = NumberFormat.getCurrencyInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM dd HH시");

			for (int i = 0; i < list.size(); i++) {

				MyshopDto dto = list.get(i);
			%>
			<tr>
				<td align="center"><%=i + 1%></td>
				<td>
				<img alt="" src="../쇼핑몰사진/<%=dto.getPhoto()%>.jpg"
					width="40" height="40" class="img-thumbnail"> 
					<a href="detailpage.jsp?num=<%=dto.getNum()%>" style="text-decoration: none; color: green; font-weight: bold">상세보기</a>
					<b><%=dto.getSangpum()%></b>
				</td>

				<td align="center"><%=nf.format(dto.getPrice())%></td>
				<td><%=dto.getIpgoday()%></td>
				<td><%=sdf.format(dto.getWriteday())%></td>
			</tr>
			<%
			}
			}
			%>

		</table>
	</div>
</body>
</html>
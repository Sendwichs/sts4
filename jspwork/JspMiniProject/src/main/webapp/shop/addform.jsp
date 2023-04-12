<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
</head>
<body>
	<div style="margin: 30px 30px;">
		<form action="shop/addaction.jsp" enctype="multipart/form-data" method="post">
			<table class="table table-bordered" style="width: 600px;">
				<caption>
					<b>상품등록</b>
				</caption>
				<tr>
					<td style="width: 150px; background-color: #66ccdd">
						<b>카테고리</b>
					</td>
					<td>
						<select style="width: 200px;" name="category" class="form-control" required="required">
							<option value="피규어">피규어</option>
							<option value="선물세트">선물세트</option>
							<option value="의상">의상</option>
							<option value="악세서리" selected="selected">악세서리</option>
							<option value="게임기기">게임기기</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; background-color: #66ccdd">
						<b>상품명</b>
					</td>

					<td>
						<input type="text" name="sangpum" class="form-control" style="width: 200px;" placeholder="상품명 입력" required="required">
					</td>
				</tr>

				<tr>
					<td style="width: 150px; background-color: #66ccdd">
						<b>상품이미지</b>
					</td>
					<td>
						<input type="file" name="photo" style="width: 300px;" class="form-control">
					</td>
				</tr>
				<tr>
					<td style="width: 150px; background-color: #66ccdd">
						<b>상품가격</b>
					</td>
					<td>
						<input type="text" name="price" style="width: 120px;" class="form-control" placeholder="가격입력" required="required">
					</td>
				</tr>
				<tr>
					<td style="width: 150px; background-color: #66ccdd">
						<b>입고일</b>
					</td>
					<td>
						<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						String day = sdf.format(new Date());
						%>
						<input type="date" name="ipgoday" required="required" value="<%=day%>">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info">상품저장</button>
						<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
					</td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>
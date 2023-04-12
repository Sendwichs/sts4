<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
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
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">
img.large {
	width: 450px;
	height: 550px;
}
</style>
</head>
<%
String shopnum = request.getParameter("shopnum");

// 로그인 상태
String loginok = (String) session.getAttribute("loginok");

// 로그인한 아이디
String myid = (String) session.getAttribute("myid");

// 아이디에 해당하는 멤버의 시퀀스 번호
MemberDao mdao = new MemberDao();
String num = mdao.getNum(myid);

// 해당 상품에 대한 데이터
ShopDao sdao = new ShopDao();
ShopDto dto = sdao.getShopData(shopnum);
%>
<body>
	<form id="frm">
		<!-- hidden : num, shopnum(장바구니 db) -->
		<input type="hidden" name="shopnum" value="<%=shopnum%>">
		<input type="hidden" name="num" value="<%=num%>">

		<table style="width: 800px;">
			<tr>
				<td style="width: 500px">
					<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="large img-thumbnail">
				</td>

				<td style="width: 300px" valign="top">
					<h3>
						카테고리 :
						<%=dto.getCategory()%></h3>
					<h3>
						상품명 :
						<%=dto.getSangpum()%></h3>
					<%
					NumberFormat nf = NumberFormat.getCurrencyInstance();
					%>
					<h3>
						가격 :
						<%=nf.format(dto.getPrice())%></h3>

					<!-- 개수 선택 -->
					<h3>
						개수 :
						<input type="number" min="1" max="10" value="1" step="1" name="cnt">
					</h3>

					<div style="margin-top: 100px; margin-left: 60px;">
						<button type="button" class="btn btn-success" style="width: 100px;" id="btncart">장바구니</button>
						<button type="button" class="btn btn-info" style="width: 100px;" onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
					</div>

				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		$("#btncart").click(function() {
			// form 태그 모든 값 가져오기(name)
			var formdata = $("#frm").serialize();
			// alert(formdata);

			$.ajax({
				type : "post",
				dataType : "html",
				data : formdata,
				url: "shop/detailproc.jsp",
				success:function(){
					// alert("ㅅㄱ")
					
					var a=confirm("장바구니에 저장됨\n장바구니로 이동하려면 [확인]을 누르시오");
					
					if (a) {
						location.href="index.jsp?main=shop/mycart.jsp";
					}
				}
				
			})
		})
	</script>
</body>
</html>
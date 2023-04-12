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
<%
// 세션값 얻기
String saveok = (String) session.getAttribute("saveok");

String myid = "";

if (saveok != null) {
	myid = (String) session.getAttribute("myid");
}
%>
<body>
	<div style="margin-left: 130px;">
		<form action="login/loginaction.jsp" method="post">
			<table class="table table-bordered" style="width: 300px;">
				<caption>
					<b>세션로그인</b>
				</caption>
				<tr>
					<td colspan="2" align="center"><input type="checkbox"
						name="cbsave" <%=saveok == null ? "" : "checked"%>>아이디저장</td>
				</tr>

				<tr>
					<th width="100">아이디</th>
					<td><input type="text" name="id" class="form-control"
						required="required" style="width: 120px" value="<%=myid%>"></td>
				</tr>
				<tr>
					<th width="100">비밀번호</th>
					<td><input type="password" name="pass" class="form-control"
						required="required" style="width: 120px"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-default">로그인</button>
					</td>
				</tr>

			</table>

		</form>
	</div>
</body>
</html>
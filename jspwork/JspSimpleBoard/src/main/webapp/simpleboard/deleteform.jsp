<%@page import="model.simpleboard.SimpleDto"%>
<%@page import="model.simpleboard.SimpleDao"%>
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
<script type="text/javascript">
	function funcdel(num) {
		var yes = confirm("삭제하시겠습니까?");

		if (yes) {
			location.href = "deleteaction.jsp?num=" + num;
		}
	}
</script>
</head>
<%
String num = request.getParameter("num");
%>
<body>
	<form action="deleteaction.jsp" method="post">
		<table class="table table-boarder" style="width: 300px">
			<caption>
				<b>삭제 비밀번호 입력</b>
			</caption>
			<tr>
				<th>비밀번호 입력 <br> <br> <input type="password"
					class="form-control" name="pass" required="required"
					placeholder="숫자 4자리"> <!-- hidden --> <input type="hidden"
					name="num" value=<%=num%>><br> <br>
					<button type="submit" class="btn btn-danger" onclick="funcdel('<%=num%>')">삭제</button>
					<button type="button" class="btn btn-info" onclick="history.back()">이전으로</button>

				</th>
			</tr>
		</table>
	</form>
</body>
</html>
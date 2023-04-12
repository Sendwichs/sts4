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
	<form action="uploadAction.jsp" method="post"
		enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th width="100">이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th width="100">제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th width="100">파일</th>
				<td><input type="file" name="uploadFile"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit" value="업로드">
				</td>
			</tr>

			
		</table>
	</form>
</body>
</html>
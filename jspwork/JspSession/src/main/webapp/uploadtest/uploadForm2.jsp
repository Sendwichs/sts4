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
	<form action="uploadAction2.jsp" method="post"
		enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 400px;">
			<caption>
				<b>여러개 이미지 업로드</b>
			</caption>
			<tr>
				<th width="100" bgcolor="lightyellow">작성자</th>
				<td><input type="text" name="writer" class="form-control"
					style="width: 120px"></td>
			</tr>
			<tr>
				<th width="100" bgcolor="lightyellow">이미지</th>
				<td><input type="file" name="photo1" class="form-control"><br>
					<input type="file" name="photo2" class="form-control"><br>
					<input type="file" name="photo3" class="form-control"><br>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info">서버에 업로드하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
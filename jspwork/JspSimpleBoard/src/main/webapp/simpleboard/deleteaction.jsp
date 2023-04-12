<%@page import="java.io.File"%>
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
</head>
<body>
	<%
	// num, pass
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");

	// db 선언
	SimpleDao db = new SimpleDao();

	// 메서드 isEqualPass로부터 반환값 b받기
	boolean b = db.isEqualPass(num, pass);

	// b가 참이면 삭제 후 목록.. 거짓이면 스크립트 경고창
	if (b) {
		// 게시글 지우기 전에 업로드 이미지 지우기
		String imgName = db.getData(num).getImgname();

		// 업로드 경로 구하기
		String uploadPath = getServletContext().getRealPath("/upload");

		// 파일 생성
		File file = new File(uploadPath + "\\" + imgName);

		// 파일 삭제
		if (file.exists())
			file.delete();

		// db 삭제
		db.deleteBoard(num);

		response.sendRedirect("boardlist.jsp");
	} else {
	%>
	<script type="text/javascript">
		alert("비밀번호가 맞지 않음")
		history.back();
	</script>
	<%
	}
	%>
</body>
</html>
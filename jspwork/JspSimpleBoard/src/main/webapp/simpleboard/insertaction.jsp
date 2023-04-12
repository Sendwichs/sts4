<%@page import="model.simpleboard.SimpleDto"%>
<%@page import="model.simpleboard.SimpleDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	// 한글 엔코딩
	request.setCharacterEncoding("utf-8");

	// 업로드할 경로
	String realFolder = getServletContext().getRealPath("/upload");
	System.out.println(realFolder);

	// 업로드 사이즈
	int uploadsize = 1024 * 1024; //1mb

	try {
		// 생성자 파라미터(request,업로드폴더,업로드사이즈,한글타입,같은 이름일 경우 1,2,3 붙히기)
		MultipartRequest multi = new MultipartRequest(request, realFolder, uploadsize, "utf-8",
		new DefaultFileRenamePolicy());

		// 입력값 읽기
		String writer = multi.getParameter("writer");
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String pass=multi.getParameter("pass");
		
		// 실제 업로드 이미지 읽어오기
		String imgname=multi.getFilesystemName("photo");
		
		// dto에 담기
		SimpleDto dto = new SimpleDto();
		
		dto.setWriter(writer);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPass(pass);
		dto.setImgname(imgname);
		
		// dao
		SimpleDao dao = new SimpleDao();
		dao.insertBoard(dto);
		
		// 목록
		response.sendRedirect("boardlist.jsp");
		
	} catch (Exception e) {

	}
	%>
</body>
</html>
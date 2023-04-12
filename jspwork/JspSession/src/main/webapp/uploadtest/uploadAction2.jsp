<%@page import="java.io.ObjectInputStream.GetField"%>
<%@page import="java.util.Enumeration"%>
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
	MultipartRequest multi = null;

	// 톰캣에 업로드되는 실제 프로젝트 경로 구하기
	ServletContext context = getServletContext();

	// 프로젝트에 업로드의 실제 경로 구하기
	String realFolder=context.getRealPath("/save");
	System.out.println(realFolder);
	
	int uploadsize=1024*1024*3; // 3mb
	try{
	multi=new MultipartRequest(request,realFolder,uploadsize,"utf-8",new DefaultFileRenamePolicy());
	
	// 입력한 값들 읽어오기
	String writer=multi.getParameter("writer");
	%>
	<h2>작성자:<%=writer %></h2>
	
	<%
	// 파일 타입이 여러 개인 경우
	Enumeration forNames=multi.getFileNames(); // file 타입만 얻어오는 것
	
	while(forNames.hasMoreElements()){
		// 파일 태그의 name 얻기
		String fileName=(String)forNames.nextElement();
		System.out.println("fileType의 name : "+fileName);
		
		// 실제 업로드된 파일명 얻기
		String uploadFileName=multi.getFilesystemName(fileName);
		
		// 파일 선택안하면 null
		if(uploadFileName!=null){%>
		<figure>
			<img alt="" src="../save/<%=uploadFileName%>" style="max-width: 200px; border: 1px solid gray">
			<br>
			<figcaption><b><%=uploadFileName %></b></figcaption>
			</figure>
		<%}
		
	}
	%>
	<%}catch(Exception e){
		
	}
	%>
</body>
</html>
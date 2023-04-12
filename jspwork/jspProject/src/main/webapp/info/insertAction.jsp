<%@page import="info.model.InfoDto"%>
<%@page import="info.model.InfoDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
      href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Hi+Melody&family=Noto+Serif+KR:wght@300&display=swap"
      rel="stylesheet"
    />
<link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>
</head>
<body>
   <%
   String name=request.getParameter("name");
   String addr=request.getParameter("addr");
   
   //입력데이터를 dto로 묶어서(통채로 넘겨야해서)  insert 메서드에 전달해줘야 한다
   //Dto 묶기 
   InfoDto dto=new InfoDto();
   
   dto.setName(name);
   dto.setAddr(addr);
   
   //insert메서드로 전달
   InfoDao dao=new InfoDao();
   dao.insertInfo(dto);
   
   //출력 jsp로 이동_url 주소창이 바뀜
   response.sendRedirect("infoList.jsp");
   %>
</body>
</html>
<%@page import="info.model.InfoDao"%>
<%@page import="info.model.InfoDto"%>
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
String num=request.getParameter("num");
   
%>
<body>
<form action="updateAction.jsp" method="post">
      <table class="table table-bordered" style="width: 350px;">
         <tr>
            <th>이름</th>
               <td>
               <input type="text" name="name" size="7" placeholder="이름" required="required" class="form-control"
               value="<%=dto.getName()%>">
               </td>
         </tr>
         
         <tr>
            <th>주소</th>
               <td>
               <input type="text" name="addr" size="20" placeholder="주소" required="required" class="form-control"
               value="<%=dto.getAddr()%>">
               </td>
         </tr>
         
         <tr>
            <td colspan="2" align="center">
            <input type="text" name="num">
               <input type="submit" value="전송" class="btrn btn-info">
               <input type="button" value="목록" onclick="location.href='infoList.jsp'" class="btn btn-danger">
               <!--  목록버튼 onclick="location.href='infoList.jsp'" 누르면 목록으로 이동 -->
            </td>
         </tr>
      </table>

</body>
</html>
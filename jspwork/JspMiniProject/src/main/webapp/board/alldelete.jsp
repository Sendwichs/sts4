<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// nums 읽는다
String nums = request.getParameter("nums");

// ,로 분리해서 []
String[] num = nums.split(",");
// 배열의 개수만큼 delete한 후
SmartDao dao = new SmartDao();

for(String n:num){
	dao.deleteSmart(n);
}
// 목록
response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
%>
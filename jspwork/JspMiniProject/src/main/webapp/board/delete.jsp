<%@page import="data.dao.SmartDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// db삭제 뿐만 아니라 업로드된 파일 삭제
String num = request.getParameter("num");
String currentPage = request.getParameter("currentPage");

// dao
SmartDao dao = new SmartDao();

dao.deleteSmart(num);

// 보던 페이지로 이동
response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage=" + currentPage);
%>
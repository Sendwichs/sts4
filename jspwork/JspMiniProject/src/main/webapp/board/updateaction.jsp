<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 한글 엔코딩
request.setCharacterEncoding("utf-8");
// 데이터 읽어서
SmartDto dto = new SmartDto();

// 현재페이지
String currentPage = request.getParameter("currentPage");

String num = request.getParameter("num");
String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

dto.setNum(num);
dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);

// dao
SmartDao dao = new SmartDao();
dao.updateSmart(dto);

response.sendRedirect("../index.jsp?main=board/detailview.jsp?num=" + num + "&currentPage" + currentPage);
%>
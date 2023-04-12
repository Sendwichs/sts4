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

String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);

// dao
SmartDao dao = new SmartDao();
dao.smartinsert(dto);

// 방금 추가된 num값 얻기
int num = dao.getMaxNum();

response.sendRedirect("../index.jsp?main=board/boardlist.jsp?num=" + num);
%>
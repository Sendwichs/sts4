
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
AjaxBoardDao dao = new AjaxBoardDao();

// 엔코딩(post 방식이면)
request.setCharacterEncoding("utf-8");

// 데이터 읽기(writer, content, avata)
String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String avata = request.getParameter("avata");

// dto로 묶어주기
AjaxBoardDto dto = new AjaxBoardDto();

dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);
dto.setAvata(avata);

// insert 호출
dao.insertMemo(dto);


%>
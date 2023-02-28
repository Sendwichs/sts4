<%@page import="memo.model.MemoDto"%>
<%@page import="memo.model.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemoDao dao = new MemoDao();

// 엔코딩
request.setCharacterEncoding("utf-8");

// 데이터 읽기(num, writer, content, avata)
String num= request.getParameter("unum");
String writer = request.getParameter("uwriter");
String content = request.getParameter("ucontent");
String avata = request.getParameter("uavata");

// dto로 묶어주기
MemoDto dto = new MemoDto();

dto.setNum(num);
dto.setWriter(writer);
dto.setContent(content);
dto.setAvata(avata);

// update 호출
dao.updateMemo(dto);

%>
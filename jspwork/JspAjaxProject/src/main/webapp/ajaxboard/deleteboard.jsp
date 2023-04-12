<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@page import="memo.model.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// dao
AjaxBoardDao dao= new AjaxBoardDao();

// num 읽기
String num=request.getParameter("num");

// delete 메서드 호출
dao.deleteboard(num);
%>
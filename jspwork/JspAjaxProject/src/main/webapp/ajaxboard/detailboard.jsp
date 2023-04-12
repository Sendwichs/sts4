<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// num
String num=request.getParameter("num");

// dao
AjaxBoardDao dao = new AjaxBoardDao();

// dto
AjaxBoardDto dto = dao.getData(num);

JSONObject ob = new JSONObject();
SimpleDateFormat sdf = new SimpleDateFormat();

ob.put("num", dto.getNum());
ob.put("writer", dto.getWriter());
ob.put("subject", dto.getSubject());
ob.put("content", dto.getContent());
ob.put("avata", dto.getAvata());
ob.put("writeday", sdf.format(dto.getWriteday()));

%>
<%=ob.toString()%>
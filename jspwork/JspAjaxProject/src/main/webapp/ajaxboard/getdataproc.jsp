<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// dao
AjaxBoardDao dao = new AjaxBoardDao();
// num
String num = request.getParameter("num");

// getData 호출 dto받기
AjaxBoardDto dto = dao.getData(num);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

JSONObject ob = new JSONObject();

ob.put("num", dto.getNum());
ob.put("writer", dto.getWriter());
ob.put("subject", dto.getSubject());
ob.put("content", dto.getContent());
ob.put("avata", dto.getAvata());
ob.put("writeday", sdf.format(dto.getWriteday()));
%>
<%=ob.toString()%>
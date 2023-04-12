<%@page import="java.sql.Timestamp"%>
<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.CartDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//한글 엔코딩
request.setCharacterEncoding("utf-8");

CartDto dto = new CartDto();
ShopDao dao = new ShopDao();

String shopnum = request.getParameter("shopnum");
String num = request.getParameter("num");
int cnt = Integer.parseInt(request.getParameter("cnt"));

dto.setShopnum(shopnum);
dto.setNum(num);
dto.setCnt(cnt);

dao.insertCart(dto);
%>
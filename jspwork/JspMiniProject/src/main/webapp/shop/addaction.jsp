<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// db에 저장할 id 가져오기
//String myid = (String) session.getAttribute("myid");
request.setCharacterEncoding("utf-8");

// 이미지가 업로드되는 실제 경로
String realPath = getServletContext().getRealPath("/shopsave");
System.out.println(realPath);

int uploadSize = 1024 * 1024 * 2; // 2MB
MultipartRequest multi = null;

try {
	multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());

	// multi 변수로 모든 폼 데이터 읽어오기
	String category = multi.getParameter("category");
	String sangpum = multi.getParameter("sangpum");
	String photo = multi.getFilesystemName("photo");
	int price = Integer.parseInt(multi.getParameter("price"));
	String ipgoday = multi.getParameter("ipgoday");

	// dto에 저장
	ShopDto dto = new ShopDto();
	dto.setCategory(category);
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);

	// dao
	ShopDao dao = new ShopDao();
	dao.insertShopDao(dto);

	response.sendRedirect("../index.jsp?main=shop/addform.jsp");
} catch (Exception e) {
	System.out.println("업로드 오류 : " + e.getMessage());
}
%>
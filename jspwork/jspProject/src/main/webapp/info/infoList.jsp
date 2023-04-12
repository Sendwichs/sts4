<%@page import="java.util.Vector"%>
<%@page import="info.model.InfoDao"%>
<%@page import="info.model.InfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%
InfoDao dao = new InfoDao();
Vector<InfoDto> list = dao.getInfoAllDatas();
%>
<body>
	<b style="font-size: 10pt;"> <a href="insertForm.jsp"><button
				type="button" class="btn btn-info">데이터추가</button></a>
	</b>

	<table class="table table-bordered" style="width: 600px;">
		<caption>
			<b>Info 리스트</b>
		</caption>
		<tr>
			<th width="60">번호</th>
			<th width="100">이름</th>
			<th width="160">주소</th>
			<th width="160">날짜</th>
			<th width="100">편집</th>
		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			InfoDto dto = list.get(i);
		%>
		<tr>
		<td><%=i+1 %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getAddr() %></td>
		<td align="center"><%=dto.getSdate() %></td>
		<td><button type="button" class="btn btn-success btn-xs" onclick="location.href''">수정</button>
		<button type="button" class="btn btn-danger btn-xs" onclick="location.href='delete.jsp?num=<%=dto.getNum()%>'">삭제</button>
		</td>
		
		</tr>
		<%
		}
		%>

	</table>
</body>
</html>
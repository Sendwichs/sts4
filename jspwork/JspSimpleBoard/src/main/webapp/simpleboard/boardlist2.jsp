<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.simpleboard.SimpleDto"%>
<%@page import="java.util.List"%>
<%@page import="model.simpleboard.SimpleDao"%>
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
<style type="text/css">
a:link {
	text-decoration: none;
	color: black;
	font-weight: bold;
	font-size: 10px;
	margin-left: 20px
}
</style>
</head>
<%
SimpleDao db = new SimpleDao();
List<SimpleDto> list = db.getAllBoardDatas();
%>
<body>
	<div class="alert alert-danger" style="width: 800px;">
		<b>총 <%=list.size()%>개의 글이 있습니다
		</b>
	</div>
	<br>
	<table class="table table-hover" style="width: 800px">
		<caption>
			<b>이미지형 목록보기</b>
			<button type="button" class="btn btn-info"
				onclick="location.href='insertform.jsp'" style="margin-left: 600px">글쓰기</button>
		</caption>

		<tr>
			<%
			for (int i = 0; i < list.size(); i++) {

				int no = list.size() - i;
				SimpleDto dto = list.get(i);
			%>
			<td><a href="content.jsp?num=<%=dto.getNum() %>"> <img alt="" src="../upload/<%=dto.getImgname()%>"
					style="width: 200px; height: 200px; border: 1px solid gray; margin: 5px;">
					<br>
				<br> <%=dto.getSubject()%></a> <br> <span
				style="color: gray; font-size: 9pt"> 조회 : <%=dto.getReadcount()%>&nbsp;&nbsp;&nbsp;
					<%=dto.getWriteday()%>
					<br>
					<%=dto.getWriter() %>
			</span></td>

			<%
			if ((i + 1) % 4 == 0) {
			%>
		</tr>
		<tr>
			<%
			}
			%>
			<%
			}
			%>
		</tr>




	</table>
</body>
</html>
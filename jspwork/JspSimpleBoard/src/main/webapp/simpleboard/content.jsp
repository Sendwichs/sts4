<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.simpleboard.SimpleDto"%>
<%@page import="model.simpleboard.SimpleDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<%
String num = request.getParameter("num");
SimpleDao dao = new SimpleDao();
//조회수 증가
dao.updateReadCount(num);
//데이타
SimpleDto dto = dao.getData(num);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<table class="table table-condensed" style="width: 650px;">
		<tr>
			<td style="width: 500px;">
				<h2><%=dto.getSubject()%></h2> <span style="font-size: 9pt;"><b><%=dto.getWriter()%></b></span><br>
				<span style="color: gray; font-size: 9pt;"><%=sdf.format(dto.getWriteday())%></span>&nbsp;&nbsp;&nbsp;
				조회: <%=dto.getReadcount()%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><%=dto.getContent().replace("\n", "<br>")%> <br>
				<br> <br> <br> <a
				href="../upload/<%=dto.getImgname()%>"> <img alt=""
					src="../upload/<%=dto.getImgname()%>" style="max-width: 300px;"></a>
			</td>
		</tr>
	</table>
	<div style="margin-left: 400px;">
		<button type="button" class="btn btn-default"
			onclick="location.href='insertform.jsp'">글쓰기</button>
		<button type="button" class="btn btn-default"
			onclick="location.href='boardlist.jsp'">목록</button>
		<button type="button" class="btn btn-default"
			onclick="location.href='updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
		<button type="button" class="btn btn-default"
			onclick="location.href='deleteform.jsp?num=<%=dto.getNum()%>'">삭제</button>

	</div>
</body>
</html>

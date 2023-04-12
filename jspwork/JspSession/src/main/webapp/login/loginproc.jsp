<%@page import="login.model.LoginDao"%>
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
<body>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String save = request.getParameter("savechk");

	// 아이디와 비번이 맞는지 확인
	LoginDao db = new LoginDao();
	boolean flag = db.isLogin(id, pass);

	// 맞으면 세션에 저장 후 loginmain으로 이동 안맞으면 경고창
	if (flag) {
		// 로그인 중인지를 알 수 있는 세션 저장
		session.setAttribute("loginok", "yes");

		// 아이디와 체크값 저장
		session.setAttribute("idok", id);

		// 체크하면 값으로 on이 체크안하면 null값 지정
		session.setAttribute("saveok", save);

		// 세션 유지 시간
		session.setMaxInactiveInterval(60 * 60 * 8); // 8시간 동안 세션유지

		// 로그인 메인으로 이동
		response.sendRedirect("loginmain.jsp");
	} else 
	{%>
		<script type="text/javascript">
		alert("아이디와 비밀번호가 일치하지 않음");
		history.back();
		</script>
	<%}
	%>
</body>
</html>
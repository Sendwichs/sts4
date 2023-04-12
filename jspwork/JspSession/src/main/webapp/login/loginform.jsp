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
div.loginform {
	width: 500px;
	margin: 0 auto;
	margin-top: 100px;
}
</style>
</head>
<body>
	<%
	// 세션으로부터 아이디와 체크값을 얻기
	String myid = (String) session.getAttribute("idok");
	String saveid = (String) session.getAttribute("saveok");

	boolean save = true;

	if (saveid == null || saveid.equals("no")) {
		myid = ""; // 아이디 저장을 체크하지 않을 때는 아이디가 남아있지 않는다
		save = false; // 체크하지 않았을 경우 false, 그 이외에는 초기값이 true이므로 true가 됨
	}
	%>


	<div class="loginform">
		<h3>회원로그인</h3>
		<form action="loginproc.jsp" method="post">
			<input type="text" name="id" style="width: 200px;"
				class="form-control input-lg" placeholder="로그인할 아이디"
				required="required" value="<%=myid%>"> <input type="text"
				name="pass" style="width: 200px;" class="form-control input-lg"
				placeholder="로그인할 비밀번호" required="required"> <br>
			<button type="submit" class="btn btn-success btn-lg"
				style="width: 200px; height: 50px;">로그인</button>
			<br> <input type="checkbox" name="savechk" <%=save?"checked":"" %>>아이디저장
		</form>
	</div>
</body>
</html>
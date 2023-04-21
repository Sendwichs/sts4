<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">
div.container {
	float: right;
	font-size: 20pt;
	position: relative;
	left: 1000px;
	top: 80px
}

button {
	width: 80px;
	font-size: 15pt
}

#btnlogin {
	margin-left: 600px
}
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<a href="${root }/">
		<img alt="" src="${root }/image/title.PNG">
		<br>
		<b>SpringBoot+MyBatis+Tiles</b>
	</a>


	<div class="container">
		<c:if test="${sessionScope.loginok==null }">
			<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" id="btnlogin">로그인</button>
		</c:if>

		<c:if test="${sessionScope.loginok!=null }">
			<button type="button" class="btn btn-danger btn-sm" id="btnlogout">로그아웃</button>
		</c:if>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">

					<!--  header-->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원로그인</h4>
					</div>



					<!-- body -->
					<div class="modal-body">

						<span class="glyphicon glyphicon-user">LoginId</span>
						<br>
						<input type="text" class="form-control" id="loginid">
						<span class="glyphicon glyphicon-lock">Loginpw</span>
						<br>
						<input type="text" class="form-control" id="loginpw">
					</div>




					<!-- footer -->

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="btnloginok">로그인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>

			</div>
		</div>

	</div>


	<!--로그인에 대한 ajax 스크립트 처리  -->
	<script type="text/javascript">
		//팝업창에 있는 로그인버튼
		$("#btnloginok").click(function() {

			//아이디 비번 읽기
			var id = $("#loginid").val();
			var pw = $("#loginpw").val();
			var root = '${root}';
			console.log("root" + root);

			$.ajax({

				type : "get",
				dataType : "json",
				url : root + "/member/login",
				data : {
					"id" : id,
					"pw" : pw
				},
				success : function(res) {

					if (res.result == 'fail') {
						alert("아이디나 비번이 맞지않습니다");
					} else {
						location.reload();
					}
				}
			});
		});

		//로그아웃
		$("#btnlogout").click(function() {

			var root = '${root}';
			$.ajax({

				type : "get",
				url : root + "/sub/member/logout",
				dataType : "text",
				success : function(res) {
					location.reload();
				}
			});

		});
	</script>
</body>
</html>
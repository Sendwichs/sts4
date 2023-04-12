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
</head>
<body>
	<h3 class="alert alert-info">Ex3 예제</h3>
	<br>
	<input type="text" id="search" class="form-control">
	<h2 id="fname"></h2>
	<img alt="" id="photo" src="" style="max-width: 300px; max-height: 200px">

	<script type="text/javascript">
		$("#search").keyup(function(e) {
			if (e.keyCode == 13) {
				// 입력값
				var name = $(this).val();
				// alert(name);

				$.ajax({
					type : "get",
					dataType : "json",
					url : "list3",
					data : {
						"name" : name
					},
					success : function(res) {
						$("#fname").text(res.name);
						$("#photo").attr("src", "upload/" + res.photo);
						alert("검색 성공!");
						$("#search").val(''); // 입력값 지우기
					}
				})
			}
		})
	</script>
</body>
</html>
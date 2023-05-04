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
th {
	background-color: lightblue;
}
table{
position: relative;
left: 200px;
font-size: 15pt
}
</style>
<script type="text/javascript">
	$(function() {
		// 전체 선택하면 체크박스 해제
		$("#allcheck").click(function() {
			// 체크값 얻기
			var chk = $(this).is(":checked");
			//alert(chk);

			// 전체 체크값을 아래의 체크에 일괄전달
			$(".del").prop("checked", chk);
		})
		$("#btnmemberdel").click(function() {
			// 체크한 상품 개수 구하기
			var cnt = $(".del:checked").length;
			//alert(cnt);

			if (cnt == 0) {
				alert("삭제할 번호 선택!")
				return;
			}

			$(".del:checked").each(function(i, elt) {
				var num = $(this).attr("num");
				alert(num);

				$.ajax({
					type : "get",
					url : "delete",
					dataType : "html",
					data : {
						"num" : num
					},
					success : function() {
						alert("삭제 완료");
						location.reload();
					}
				})
			})
		})
	})
</script>
</head>
<body>
	<h3 align="center">★ 총 ${count }명 ★</h3>
	<table class="table table-bordered" style="width: 1100px;">
		<tr>
			<th style="text-align: center;">번호</th>
			<th style="text-align: center;">이름</th>
			<th style="text-align: center;">아이디</th>
			<th style="text-align: center;">전화번호</th>
			<th style="text-align: center;">주소</th>
			<th style="text-align: center;">이메일</th>
			<th style="text-align: center;">
				<input type="checkbox" id="allcheck">
			</th>
		</tr>
		<c:forEach items="${list }" var="dto" varStatus="i">
			<tr align="center">
				<td>${i.count}</td>
				<td>
					<img alt="" src="../photo/${dto.photo }" style="width: 25px; height: 25px">
					${dto.name }
				</td>
				<td>${dto.id }</td>
				<td>${dto.hp }</td>
				<td>${dto.addr }</td>
				<td>${dto.email }</td>
				<td>
					<input type="checkbox" class="del" num=${dto.num }>
				</td>
			</tr>

		</c:forEach>
		<tr>
			<td colspan="7">
				<button type="button" class="btn btn-danger" style="margin-left: 650px;" id="btnmemberdel">DELETE</button>
			</td>
		</tr>

	</table>
</body>
</html>
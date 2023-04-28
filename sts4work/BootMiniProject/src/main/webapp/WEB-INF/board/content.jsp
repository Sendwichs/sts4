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
.day {
	color: gray;
	margin-left: 50px;
	margin-right: 30px;
	font-size: 0.9em;
}

.amod, .adel {
	cursor: pointer;
	font-size: 0.7em;
	color: green;
}
</style>
<script type="text/javascript">
	$(function() {
		// num값은 전역변수로 선언
		num = $("#num").val();
		loginok = "${sessionScope.loginok}";
		myid = "${sessionScope.myid}"

		//alert(loginok + "," + myid + "," + num)
		list();
		// insert
		$("#btnansweradd").click(function() {
			var content = $("#content").val();

			if (content.trim().length == 0) {
				alert("댓글 입력하세요")
				return;
			}

			$.ajax({
				type : "post",
				dataType : "text",
				url : "ainsert",
				data : {
					"num" : num,
					"content" : content
				},
				success : function() {
					alert("성공!!")

					// 입력값 지우기
					location.reload();
				}

			})
		})
		// 수정창 띄우기(모달)
		$(document).on("click", "span.amod", function() {

			idx = $(this).attr("idx");

			$.ajax({
				type : "get",
				dataType : "json",
				url : "adata",
				data : {
					"idx" : idx
				},
				success : function(res) {
					$("#ucontent").val(res.content);
				}
			})

			$("#myUModal").modal();
		})
		// 수정
		$(document).on("click", "#btnupdate", function() {
			var content = $("#ucontent").val();
			//alert(idx + "," + content)
			$.ajax({
				type : "post",
				dataType : "text",
				url : "aupdate",
				data : {
					"idx" : idx,
					"content" : content
				},
				success : function() {

					list();
				}
			})
		})

	})

	// 사용자 함수 list
	function list() {

		$
				.ajax({
					type : "get",
					dataType : "json",
					url : "alist",
					data : {
						"num" : num
					},
					success : function(res) {

						$("span.acount").text(res.length);

						var s = "";

						$
								.each(
										res,
										function(i, dto) {
											s += "<b>" + dto.name + "</b>:"
													+ dto.content;
											s += "<span class='day'>"
													+ dto.writeday + "</span>";
											if (loginok == 'yes'
													&& myid == dto.myid) {
												s += "<span class='glyphicon glyphicon-pencil amod' idx='"+dto.idx+"'></span>";
												s += "&nbsp;";
												s += "<span class='glyphicon glyphicon-trash adel' idx='"+dto.idx+"'></span>";
											}
											s += "<br>"
										})
						$("div.alist").html(s);
					}
				})

		// 삭제
		$(document).on("click", "span.adel", function() {
			var idx = $(this).attr("idx");
			//alert(idx)

			var a = confirm("해당 댓글 삭제??")

			if (a == true) {
				$.ajax({
					type : "get",
					dataType : "text",
					url : "adelete",
					data : {
						"idx" : idx
					},
					success : function() {
						list();
					}
				})
			}
		})
	}
</script>
</head>
<body>
	<table class="table table-bordered" style="position: absolute; width: 800px; left: 150px">
		<tr>
			<td>
				<h3>
					<b>${dto.subject }</b>
					<span style="color: gray; float: right; font-size: 15pt">
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" />
					</span>
				</h3>
				<span>작성자 : ${dto.name }(${dto.myid })</span>
				<c:if test="${dto.uploadfile!='no' }">
					<span style="float: right;">
						<a href="download?clip=${dto.uploadfile }">
							<span class="glyphicon glyphicon-download-alt"></span>

							<b>${dto.uploadfile }</b>
						</a>
					</span>
				</c:if>
			</td>
		</tr>

		<tr>
			<td align="center">
				<c:if test="${bupload==true }">
					<h3>업로드 파일 : 이미지</h3>
					<img alt="" src="../photo/${dto.uploadfile }" style="max-width: 300px">
				</c:if>
				<br>
				<br>
				<pre style="background-color: #fff; border: 0px;">
				${dto.content }
				</pre>
				<br>
				<b style="float: right;">조회 : ${dto.readcount }</b>
				&nbsp;&nbsp;&nbsp;
				<b>
					댓글 :
					<span class="acount"></span>
				</b>
			</td>
		</tr>
		<tr>
			<td>
				<!-- 리스트 출력 -->
				<div class="alist" style="height: 500px"></div>
				<c:if test="${sessionScope.loginok!=null }">
					<div class="aform">
						<div class="form-inline">
							<input type="hidden" id="num" value="${dto.num }">
							<input type="text" class="form-control" placeholder="댓글을 입력하세요" id="content">
							<button type="button" class="btn btn-info" style="width: 60px;" id="btnansweradd">등록</button>
						</div>
					</div>
				</c:if>
			</td>
		</tr>

		<!-- 버튼 -->
		<tr>
			<td align="left">
				<!-- 글쓰기는 로그인 중일때만 -->
				<c:if test="${sessionScope.loginok!=null }">
					<button type="button" class="btn btn-default" onclick="location.href='form'">글쓰기</button>
				</c:if>
				<button type="button" class="btn btn-default" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				<!-- 로그인 중이면서 자기글만 수정, 삭제 버튼 보이기 -->
				<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
					<button type="button" class="btn btn-default" onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-default" onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>

	<!-- Modal -->
	<div class="modal fade" id="myUModal" role="dialog" style="height: 300px">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글 수정</h4>
				</div>

				<div class="modal-body">
					<input type="text" id="ucontent" class="form-control">
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdate">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>
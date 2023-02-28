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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
<img alt="" src="../image/01.png">
<br>
<button type="button" class="btn btn-info" id="btn1">data1.xml읽기</button>
<button type="button" class="btn btn-danger" id="btn2">data1.json읽기</button>
<br>
<div id="result">결과</div>
<script type="text/javascript">
$("#btn1").click(function () {
		
	$("#result").empty();
	
	//xml읽기
	$.ajax({
		type: "get",
		url:"data1.xml",
		dataType:"xml",
		success:function(res){
			
			var s="City: "+$(res).find("name").attr("city")+"<br>";
			s+="Name: "+$(res).find("name").text()+"<br>";
			s+="Age: "+$(res).find("age").text();
			
			$("#result").append(s);
		},
		
		statusCode: {
			404:function(){
				alert("xml파일을 찾을수없어요");
			},
			
			500:function(){
				
				alert("서버오류...코드를 다시한번 보세요");
			}
		}
	});
	
	
	});
//json읽기
	$("#btn2").click(function() {
		
		$("#result").empty();
		 		
		//json읽기
		$.ajax({
			
			type: "get",
			url:"data1.json",
			dataType:"json",
			success:function(res){
				
				var s="";
				s+="이름: " +res.name+"<br>";
				s+="주소: "+res.addr+"<br>";
				s+="점수: "+res.score+"<br>";
				
				$("#result").append(s);
			},
		
		statusCode: {
			404:function(){
				alert("json파일을 찾을수없어요");
			},
			
			500:function(){
				
				alert("서버오류...코드를 다시한번 보세요");
			}
		}
			
		});
		
	});
	
</script>
</body>
</html>
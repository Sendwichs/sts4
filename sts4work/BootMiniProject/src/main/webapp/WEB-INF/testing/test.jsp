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
<script src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.2.1"></script>
<script src="Chart.bundle.js"></script>
<script src="Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="Chart.js"></script>
<script src="Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
</head>
<body>
	<div style="width: 1000px; height: 500px;">
		<!--차트가 그려질 부분-->
		<canvas id="myChart"></canvas>
	</div>
	<script>
		function addZero(i) {
			var rtn = i + 100;
			return rtn.toString().replace("1", "/");
		}
		var monthList = [];
		var monthData = [];
		var today = new Date();
		for (var i = 30; i >= 0; i--) {
			var dt = new Date(today.getFullYear(), today.getMonth(), today.getDate() - i);
			var year = dt.getFullYear();
			var mon = addZero(dt.getMonth() + 1);
			var day = addZero(dt.getDate());
			var format = year + mon + day;
			monthList.push(format);
			monthData.push(Math.floor(Math.random() * 100));
		}

		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : monthList,
				datasets : [ {
					data : monthData,
					borderColor : 'rgba(255, 99, 132, 1)',
					borderWidth : 1
				} ]
			},

			options : {
				scales : {
					x : {
						ticks : {
							maxRotation : 0,
						},
						//display : false,
						grid : {
							display : false
						}
					},
					y : {
						position : 'right',// `axis` is determined by the position as `'y'`

						grid : {
							display : false
						}
					}

				},
				responsive : true,
				plugins : {
					legend : {
						display : false
					}

				}
			}
		});
	</script>
	<table class="table table-bordered">

		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>가격</th>
			<th>입고일</th>
		</tr>

		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.num }</td>
				<td>${dto.name }</td>
				<td>${dto.price }</td>
				<td>
					<fmt:formatDate value="${dto.ipgoday }" pattern="yyyy/MM/dd" />
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
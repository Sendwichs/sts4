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
<script type="module"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">

</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<div style="width: 1500px; height: 300px;">
		<!--차트가 그려질 부분-->
		<canvas id="myChart" style="width:300px"></canvas>
	</div>
	<script>
		function addZero(i) {
			var rtn = i + 100;
			return rtn.toString().replace("1","");
		}

		var monthList = [];
		var monthData = [ 50, 60, 70, 45, 50, 66, 60, 70, 45, 50, 66, 60, 70,
				45, 50, 66, 60, 70, 45, 50, 66, 66, 60, 70, 45, 50, 66, 66, 60, 70, 45, 50, 66 ];
		var today = new Date();
		for (var i = 30; i >= 0; i--) {
		  var dt = new Date(today.getFullYear(), today.getMonth(), today.getDate() - i);
		  var year = dt.getFullYear();
		  var mon = addZero(dt.getMonth() + 1);
		  var day = addZero(dt.getDate());
		  var format = year + mon + day;
		  monthList.push(format);
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
						 ticks: {
						        maxRotation: 0,
						      },
						display:false,
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
	<img alt="" src="${root }/image/겨울왕국1.jpeg" style="max-width: 150px; max-height: 300px; position: relative; left: 300px;">
	<br>
	<br>
	<img alt="" src="${root }/image/겨울왕국2.jpeg" style="max-width: 150px; max-height: 300px; position: relative; left: 300px;">
	<br>
	<br>
	<img alt="" src="${root }/image/곤지암.jpg" style="max-width: 150px; max-height: 300px; position: relative; left: 300px;">
	<br>
	<br>

</body>
</html>
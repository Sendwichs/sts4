<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>된건가??</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<h2>Jsp는 Html5구조에 자바코드를 사용할수 있는 언어</h2>
<h2>Servlet은 확장자가 java이며 자바 클래스 구조에 <br>html,css,jsp</h2>
<%!
	// 선언문 : 이곳에서 선언한 변수나 메소드를 클래스의 멤버 변수나 메소드로 등록된다
	// 위치가 어디에 있던 관계가 없음
%>

<h4>java코드 쓰려면 scriptlet 영역을 표시 후 코딩</h4>
<%
// 스크립트릿
// 여기서 선언하는 변수는 지역변수로 등록
// 여기서 선언하게 되면 선언한 곳보다는 아래서 사용해야한다
int age=20;
String name="성한경";
%>
<h4>문자열이나 변수 출력은 표현식을 이용해서 출력을 한다</h4>
<b>이름 : </b><%=name %><br>
<b>나이 : </b><%=age %>세<br>

</body>
</html>
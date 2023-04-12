<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
      href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Hi+Melody&family=Noto+Serif+KR:wght@300&display=swap"
      rel="stylesheet"
    />
<link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>
</head>
<body>
   <form action="insertAction.jsp" method="post">
      <table class="table table-bordered" style="width: 350px;">
         <tr>
            <th>이름</th>
               <td>
               <input type="text" name="name" size="7" placeholder="이름" required="required" class="control">
               </td>
         </tr>
         
         <tr>
            <th>주소</th>
               <td>
               <input type="text" name="addr" size="20" placeholder="주소" required="required" class="control">
               </td>
         </tr>
         
         <tr>
            <td colspan="2" align="center">
               <input type="submit" value="전송" class="btrn btn-info">
               <input type="button" value="목록" onclick="location.href='infoList.jsp'" class="form-control">
               <!--  목록버튼 onclick="location.href='infoList.jsp'" 누르면 목록으로 이동 -->
            </td>
         </tr>
      </table>
   
   </form>
</body>
</html>
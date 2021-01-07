<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
userid : <%= request.getAttribute("userid") %> <br>
username : <%= request.getAttribute("username") %> <br>

아이디 : ${userid} 이름 : ${username} 
</body>
</html>
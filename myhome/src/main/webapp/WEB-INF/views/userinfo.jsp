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
password : <%= request.getAttribute("password") %> <br>

���̵� : ${userid} <br>
�̸� : ${username} 
</body>
</html>
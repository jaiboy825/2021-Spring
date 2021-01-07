<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
List<String> list = (List<String>)request.getAttribute("list");
for(int i = 0; i < list.size(); i++)
{
	out.println(list.get(i) + "<br>");
}
%>
</body>
</html>
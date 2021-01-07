<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*"%>
<%@page import="com.mycompany.myhome.board.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
    List<BoardDto> list = (List<BoardDto>) request.getAttribute("boardList");
	System.out.print(list);
%>

    <table>
        <%for(int i = 0; i < list.size(); i++) {%>
        <tr>
            <td><%=list.get(i).getId() %></td>
            <td><%=list.get(i).getTitle() %></td>
            <td><%=list.get(i).getWriter() %></td>
            <td><%=list.get(i).getWdate() %></td>
            <td><%=list.get(i).getContents() %></td>
        </tr>
        <%} %>
    </table>
</body>
</html>
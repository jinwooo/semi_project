<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//"danim.do?command=main"
	//pageContext.forward("danim.do?command=main");
%>
<jsp:forward page="danim.do?command=main"></jsp:forward>

</body>
</html>
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

<div style="height: 100px;">
	<jsp:include page="./form/header.jsp"></jsp:include>
</div>

<div align="center">

<h1>ERROR 500 입니다.</h1><br/><br/>
<span>무언가 문제가 생긴 것 같습니다..</span><br/>
<span>1. 혹시 로그인을 하지 않고 다른 페이지로 이동하려고 하셨나요?</span>
</div>
</body>
</html>
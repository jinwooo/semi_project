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
</div><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div align="center">
		<h1>다시는 안까먹을게요 ㅠㅠ</h1><br/><br/><br/>
		<span>당신의 아이디는 : ${dto.id }</span><br/>
		<a href="findInfo.jsp">비밀번호 찾기</a><span>   </span>
		<a href="danim.do?command=main">home</a>
	</div>

</body>
</html>
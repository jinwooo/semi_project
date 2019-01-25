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
		<pre>이메일로 임시 비밀번호를 발급해드렸습니다.
		확인 후, 로그인을 하시고 개인 정보 변경을 통해 비밀번호 변경을 하시길 바랍니다.</pre><br /> 
		<a href="danim.do?command=main">home</a>
	</div>
</body>
</html>
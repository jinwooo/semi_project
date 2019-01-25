<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="mail.SMTPAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="util.SHA256"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!--앞으로 사용할 bootstrap에 관계된 css 파일을 연결(다운로드 받은 것)  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
 <script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
</script>
<style type="text/css">
@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
	font-family: 'BMHANNAAir'; 
	}
	#start{
	position : absolute;
	top: 581px;
	left:900px;
	width:150px;
	height:50px;
	font-size:23px;
	font-stlye :  normal;
	font-weight : bold;
}
.btn-primary{
	background-color:rgb(200,160,220);
	border:none;
 	color : white;
	text-align : center;
	font-size:12px;
	border-radius : 4px;
}
	



</style>
</head>
<body>
	<div style="height: 100px;">
		<jsp:include page="./form/header.jsp"></jsp:include>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div align="center">
		<h1 id="hh">님아 회원가입 성공함 ㅎ</h1>
		<pre id="pp">확인을 누르시면 입력하신 이메일로 이메일 인증 메일이 보내집니다. 
인증이 완료되기 전까진 서비스 이용에 제한이 될 수 있습니다.</pre>

		<input type="button" value="확인" spellcheck="false" class="btn-primary"
			id="start" onclick="location.href='danim.do?command=main';">
	</div>
</body>
</html>
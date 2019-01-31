<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
	font-family: 'BMHANNAAir'; 
	}
#write,#back{
    
	postion: absolute;
	width:120px;
	height:50px;
	font-size:40px;
	font-style: normal;
	font-weight: bold;
}
.btn-primary{
	background-color:rgb(200,160,220);
	border:none;
 	color : white;
	text-align : center;
	font-size:30px;
	border-radius : 4px;
}
	

.btn-primary,#write,#back{
	background-color:rgb(200,160,220);
	border:none;
 	color : white;
	text-align : center;
	font-size:20px;
	border-radius : 4px;
}
.btn-primary,#write:hover,
.btn-primary,#write:active{
	background-color : rgb(229, 204, 255);
}

.btn-primary,#back:hover,
.btn-primary,#back:active{
	background-color : rgb(229, 204, 255);
}

</style>
</head>
<body>
<div style="height: 100px;">
	<jsp:include page="./form/header.jsp"></jsp:include>
</div><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div align="center">
		<h1>다시는 안까먹을게요 ㅠㅠ</h1><br/><br/><br/>
		<pre>이메일로 임시 비밀번호를 발급해드렸습니다.
		확인 후, 로그인을 하시고 개인 정보 변경을 통해 비밀번호 변경을 하시길 바랍니다.</pre><br /> 

	<div style="display: inline-block" >	
		<input type="button" id="back" value="Main" class="btn-primary" onclick="location.href='danim.do?command=main'" >
	</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

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
		<span>당신의 아이디는 : ${dto.id }</span><br/>
			<div style="display: inline-block;  margin-right: 30px;" >
		<input type="button"  id="write" value="비밀번호 찾기" class="btn-primary"  onclick="location.href='findInfo.jsp'"  >
	</div>
	<div style="display: inline-block" >	
		<input type="button" id="back" value="Main" class="btn-primary" onclick="location.href='danim.do?command=main'" >
	</div>

	</div>

</body>
</html>
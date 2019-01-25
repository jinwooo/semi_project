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
 
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<%
String id = "";


id = (String)session.getAttribute("sessionId");            // request에서 id 파라미터를 가져온다



if(id==null||id.equals("")){                            // id가 Null 이거나 없을 경우
%>

	<script type="text/javascript">
		$(function(){
			alert("로그인이 필요한 페이지입니다.");
			//location.href="danim.do?command=main";
		});
	</script>

<%	
}else{
	System.out.println(id);
%>

<script type="text/javascript">
	$(function(){
		
		$("#afterLogin").show();
	});
</script>

<%	
}

%>
<style type="text/css">
 all: unset; 
@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }

	header{
		min-width: 1000px;
		/* position : fixed; */
		left :0;
		top:0;
		width:100%;
		height: 100px;
		z-index: 4;
		
	}
	#title{
	position:absolute;
	top : 10px;
	left:100px; 
	font-weight : bold;
	font-size: 36px;
	font-style : italic;
	color : rgb(200,160,220);
	cursor: pointer;

	
	}
	hr{
		position:absolute;
		top:80px;
		border:none;
		background-color : #C0C0C0;
		height :2px;
		margin-top: 1rem;
    margin-bottom: 1rem;
        box-sizing: content-box;
    	width:100%;
    overflow: visible;

	}
	.hr-sect{

	display :flex;
	flex-basis : 100%;
	align-items : center;
	color : rgb(200,160,220);
	font-style : italic;
	font-weight : bold;
	font-size : 30px;
	margin: 8px 0px;
}
.hr-sect::after{
	content:"";
	flex-grow:1;
	background: #C0C0C0;
	height : 2px;
	font-size: 0px;
	line-height: 2px;
	margin: 0px 50px;
}
#myPage{
 	position : absolute;
	top : 22px;
	right : 100px;

}
#logout{
 	position:absolute;
	top : 22px;
	right:180px; 
}
#welcome{
	position:absolute;
	top : 27px;
	right:270px; 
}
input[type=button]{
	font-family: 'BMHANNAAir'; 
}
.btn-success {
    width: 65.9286px;
    height: 34px;
    font-size: 15px;
    color: rgb(255,255,255);
    line-height: 2.5em;
    border-radius: 4px;
    background-color: rgb(190,190,190);
    text-align: center;
    font-weight: bold;
    border: none;
    -webkit-appearance: button;
        overflow: visible;
}
a{
	color : rgb(200,160,220);
	cursor: pointer;
	text-decoration: none;
}

</style>
</head>
<body>

<header>

<div id="outer">

<div data-text-content="true" id="title">
<a style="all: unset; color: rgb(200, 160, 220); cursor: pointer " href="danim.do?command=main">#DANIM</a>
</div>
<div id="afterLogin">
<span id="welcome"><%=id %>님 환영합니다 </span>
<div data-obj-type="element">	
	<input type="button" id="myPage" value="내 정보" class="btn-success">
</div>
<div data-obj-type="element">	
	<input type="button" id="logout" value="로그아웃" class="btn-success" onclick="location.href='danim.do?command=logout'">
</div>
</div>
</div>

<hr>

</header> 
</body>
</html>
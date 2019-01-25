<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
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
 <link href="css/custom.css" rel="stylesheet">
 <script type="text/javascript">

 
 
 </script>


<style type="text/css">
.checks {position: relative;}
.checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0 } .checks input[type="checkbox"] + label { display: inline-block; position: relative; padding-left: 30px; /* 글자와 체크박스 사이의 간격을 변경 */ cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; } .checks input[type="checkbox"] + label:before { /* 가짜 체크박스 */ content: ''; position: absolute; left: 0; top: -4px; /* 이 값을 변경해서 글자와의 정렬 */ width: 21px; /* 체크박스의 너비를 지정 */ height: 21px; /* 체크박스의 높이를 지정 */ line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */ text-align: center; background: #fafafa; border: 1px solid #cacece; border-radius : 3px; box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); } .checks input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before { box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); } .checks input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ content: '\2714'; /* 체크표시 유니코드 사용 */ color: #99a1a7; text-shadow: 1px 1px #fff; background: #e9ecee; border-color: #adb8c0; box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1); }

.form-control {
	width:80%;
}

@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
	font-family: 'BMHANNAAir'; 
	}
	#start{
	position : absolute;
	top: 100px;
	left:450px;
	width:100px;
	height:30px;
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
	
.infoField{
	border: 1px groove #ddd !important;
	padding: 0 1.4em 1.4em 1.4em !important;
	border : 5px solid #6f92d3 !important;
	border-radius: 12px;
}

.infoLegend{
	font-size: 1.2em !important;
    font-weight: bold !important;
    text-align: left !important;
    width:auto;
    padding:0 10px;
    border-bottom:none;
    margin-bottom: 5px;
}

.info-form{
	margin-top: 20px;
	top: 20px;
}

.container{
	margin-top: 80px;
}


#width1{
    -ms-flex: 0 0 33.333333%;
    flex: 0 0 60%;
    max-width: 60%;
}

#inf{
		margin-top: 20px;
	top: 20px;
}


</style>


<title>Insert title here</title>
</head>
<body>

 

 

<nav class="navbar navbar-default">

<div class="naver-header">

<button type="button" class="navbar-toggle collapsed"

data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"

aria-expanded="false">


<span class="icon-bar"></span> 

<span class="icon-bar"></span> 

<span class="icon-bar"></span>


</button>

<a class="navbar-brand" href="main.jsp">#ㄷ</a>

</div>


<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

<ul class="nav navbar-nav">

<li><a href="main.jsp">메인</a>

<li><a href="bbs.jsp">게시판</a>

</ul>

<ul class="nav navbar-nav navbar-right">

<li class="dropdown">

<a href="#" class="dropdown-toggle" 

data-toggle="dropdown" role="button" aria-haspopup="true" 

aria-expanded="false">접속하기<span class="caret"></span></a>


<ul class="dropdown-menu">

<li class="active"><a href="login.jsp">로그인</a></li>

<li><a href="join.jsp">회원가입</a></li>

</ul>

</li>

</ul>

</div>

</nav>



<h2>아이디 / 비밀번호 찾기</h2>
 <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4" id="width1">
        <fieldset class="infoField">
            <legend class="infoLegend">아이디 찾기</legend>
            <form role="form" action="danim.do" method="post" class="Info-form" id="inf">
            <input type="hidden" name="command" value="findId"/>
                    <div class="form-group">
                    <label for="form-password">이메일 주소</label>
                      <input type="text" name="email" placeholder="Email을 입력해주세요." class="form-email form-control" id="form-email">
                    </div>
                    <button type="submit" class="btn masuk" spellcheck="false" style="    font-family: 'BMHANNAAir'; float: right;">확인</button>
            </form>
        </fieldset>
      </div>
 	</div>
 </div>
 
 
 <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4" id="width1">
        <fieldset class="infoField">
            <legend class="infoLegend">비밀번호 찾기</legend>
            <form role="form" action="danim.do" method="post" class="Info-form" id="inf">
            <input type="hidden" name="command" value="findPw"/>
                  <div class="form-group">
                   <label for="7userId">아이디</label>
                      <input type="text" name="id" placeholder="ID를 입력해주세요." class="form-username form-control" id="7userId">
                    </div>
                    <div class="form-group">
                     <label for="form-password">이메일 주소</label>
                      <input type="text" name="email" placeholder="Email을 입력해주세요." class="form-email form-control" id="form-email">
                    </div>
                    <button type="submit" class="btn masuk" spellcheck="false" style="    font-family: 'BMHANNAAir'; float: right;">확인</button>
            </form>
        </fieldset>
      </div>
 	</div>
 </div>


</body>
</html>
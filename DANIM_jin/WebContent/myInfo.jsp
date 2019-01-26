<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
<title>Insert title here</title>

<style>
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: rgb(200,160,220,0.5);
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a, .sidebar-nav li span {
    display: block;
    text-decoration: none;
    color: #000;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgb(200,160,220, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }

</style>
</head>
<%
		String id = (String)session.getAttribute("sessionId");         
%>
<body>
<div style="height: 100px;">
	<jsp:include page="./form/header.jsp"></jsp:include>
</div>

<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
       <span style="font-weight: bold">MENU</span>
      </li>
      <li><a href="myPage.jsp">개인정보 변경</a></li>
      <li><a href="#">내 플래너</a></li>
      <li><a href="danim.do?command=myHistory&id=<%=id%>">내가 올린 글</a></li>
      <li><a href="danim.do?command=payHistory&id=<%=id%>">결제 내역</a></li>

    </ul>
  </div>
</div>
  <!-- /사이드바 -->

        <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>개인정보 변경</h3>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
                <form action="danim.do" role="form" method="post">
                <input type="hidden" name="command" value="changeInfo"/>
                   <div class="form-group">
                        <label for="inputId" style="">아이디</label>
                     <div class="form-inline">
                        <input type="text" class="form-control" id="inputId" name="inId" value="${dto.id }" placeholder="아이디를 입력해 주세요" style="width:80%;" readonly="readonly">
                  	 </div> 
                      </div>
                    <div class="form-group">
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" id="inputName" name="inName" value="${dto.name }"placeholder="이름을 입력해 주세요" required>
                    </div>
                 
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" id="inputPassword" value="${dto.pw }" name="inPw" placeholder="비밀번호를 입력해주세요" required>
                    </div>
                    <div class="form-group">
                        <label for="InputEmail">이메일 주소</label>
                        <input type="email" class="form-control" id="InputEmail" name="inEmail" value="${dto.email }" placeholder="이메일 주소를 입력해주세요" required>
                       </div>
                    <div class="form-group">
                        <label for="inputMobile">휴대폰 번호</label>
                        <input type="tel" class="form-control" id="inputMobile" name="inPhone" value="${dto.phone }" placeholder="휴대폰번호를 입력해주세요" required>
                    </div>
                    <div class="form-group">
                        <label for="inputtelNO">주소</label>
                        <input type="text" class="form-control" id="inputAddr" name="inAddr" value="${dto.addr }" placeholder="주소를 입력해주소" required>
                    </div>


                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary" title="전체입력을 해주세요.">
                            변경<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="button" class="btn btn-warning" onclick="location.href='danim.do?command=main'">
                            취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                   
		</form>
	</div>
</article>



</body>
</html>
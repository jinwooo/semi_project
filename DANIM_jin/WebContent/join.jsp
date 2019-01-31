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
 <script type="text/javascript">
<%
String id="손";
%>
	// 아이디 중복 체크 및 체크박스 동의를 안누르고 그 외 공간 눌러서 체크건드릴 때 대처
	$(function () {
		$("#warning").hide();
		$("#idError").hide();
		$("#idCan").hide();
		$("#join-submit").attr("disabled",true);
		
	$("#ex_chk").click(function () {
			if($("input:checkbox[id='ex_chk']").is(":checked")==false){
				$("#join-submit").attr("disabled",true);
			}
	})	
		
		
		
		
		
 		//중복확인 및 아이디 입력확인
 	$("#idchk").click(function(){
 		var idvalue = $("#inputId").val();
 		
 		if(!idvalue){
 			alert("아이디를 입력해주세요");
 			return false;
 		}
 		
 		$.ajax({
 			url:"danim.do?command=idCheck&inId="+idvalue,
 			
 			success:function(msg){
 				if($.trim(msg)=="사용불가"){
 					$("#idError").show();
 					$("#idCan").hide();
 					$("#join-submit").attr("disabled",true);
 					
 				}else{
 					$("#idCan").show();
 					$("#idError").hide();
 					if($("input:checkbox[id='ex_chk']").is(":checked")){
 						$("#join-submit").attr("disabled",false);
 					}
 				}
 			},
 			error:function(){
 				alert("통신실패");
 			}
 		})
 	   }) 
	})
	
	
	// 비밀번호 확인
 	function pwok(){
 		var pw1 = $("#inputPassword").val();
 		var pw2 = $("#inputPasswordCheck").val();
 		if (pw1 != pw2) {
 			$("#warning").show();
        }else{
        	$("#warning").hide();
        }
 	}
 	
	// 동의안함
	function noThanks() {
		$("#ex_chk").prop("checked",false);
		$("#join-submit").attr("disabled",true);
		
	}
	
	// 동의함
	function Thanks() {
		$("#ex_chk").prop("checked",true);
	
		if($("#idCan").is(":visible")){
			$("#join-submit").attr("disabled",false);
		}
	}
 
	
	 
	 
	 
	
	 
 
 </script>
 <style type="text/css">
.checks {position: relative;}
.checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0 } .checks input[type="checkbox"] + label { display: inline-block; position: relative; padding-left: 30px; /* 글자와 체크박스 사이의 간격을 변경 */ cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; } .checks input[type="checkbox"] + label:before { /* 가짜 체크박스 */ content: ''; position: absolute; left: 0; top: -4px; /* 이 값을 변경해서 글자와의 정렬 */ width: 21px; /* 체크박스의 너비를 지정 */ height: 21px; /* 체크박스의 높이를 지정 */ line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */ text-align: center; background: #fafafa; border: 1px solid #cacece; border-radius : 3px; box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); } .checks input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before { box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); } .checks input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ content: '\2714'; /* 체크표시 유니코드 사용 */ color: #99a1a7; text-shadow: 1px 1px #fff; background: #e9ecee; border-color: #adb8c0; box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1); }

.form-control {
	width:80%;
}

 </style>
<title>Insert title here</title>
</head>
<body>
<div style="height: 100px;">
	<jsp:include page="./form/header_ex.jsp"></jsp:include>
</div>
 

<div>

        <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <br/>
                <h3>회원가입 Form</h3>
                </div>
            </div>
            <br/>
            <div class="col-sm-6 col-md-offset-3">
                <form action="danim.do" role="form" method="post">
                <input type="hidden" name="command" value="join"/>
                    <div class="form-group">
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" id="inputName" name="inName" placeholder="이름을 입력해 주세요" required>
                    </div>
                    <div class="form-group">
                        <label for="inputId">아이디</label>
                     <div class="form-inline">
                        <input type="text" class="form-control" id="inputId" name="inId" placeholder="아이디를 입력해 주세요" style="width:80%;" required>
                        <input class="btn btn-primary" type="button" id="idchk" value="중복 확인" style="float:right;" >
                        <span id="idError" style="color:red">이미 존재하는 아이디 입니다.</span>
                        <span id="idCan" style="color:blue">사용 가능한 아이디 입니다.</span>
                      </div>
                      </div>
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" id="inputPassword" name="inPw" placeholder="비밀번호를 입력해주세요" required>
                    </div>
                    <div class="form-group">
                        <label for="inputPasswordCheck">비밀번호 확인</label>
                        <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인을 위해 한 번 더 입력 해 주세요" onkeyup="pwok()" required>
                        <span id="warning" style="color: red">비밀번호가 다릅니다. 다시 한번 확인해주세요.</span>
                  
                    </div>
                    <div class="form-group">
                        <label for="InputEmail">이메일 주소</label>
                        <input type="email" class="form-control" id="InputEmail" name="inEmail" placeholder="이메일 주소를 입력해주세요" required>
                       </div>
                    <div class="form-group">
                        <label for="inputMobile">휴대폰 번호</label>
                        <input type="tel" class="form-control" id="inputMobile" name="inPhone" placeholder="휴대폰번호를 입력해주세요" required>
                    </div>
                    <div class="form-group">
                        <label for="inputtelNO">주소</label>
                        <input type="text" class="form-control" id="inputAddr" name="inAddr" placeholder="주소를 입력해주소" required>
                    </div>

                    <div class="form-group">
                    <label>약관 동의</label><br/>
                    <div class="checks"> <input type="checkbox" id="ex_chk" data-toggle="modal" data-target="#myModal" />  <label for="ex_chk"> <a href="#">이용약관</a>에 동의합니다.</label> </div>
                    <!-- 약관 동의서 보려면 이거를 건드려보자 -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" > 
                    	<div class="modal-dialog"> 
                    		<div class="modal-content"> 
                    			<div class="modal-header"> 
 <!--                    				<button type="button" class="close" data-dismiss="modal">
                    					<span aria-hidden="true">x</span>
                    					<span class="sr-only">Close</span>
                    				</button> 
  -->                   			<h4 class="modal-title" id="myModalLabel">회원가입 약관</h4> 
                    			</div> 
                    			<div class="modal-body"> 이 개인정보는 이제 제껍니다. </div> 
                    			<div class="modal-footer"> 
                    				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="noThanks();">동의안함</button> 
                    				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="Thanks();">동의</button> 
                    			</div> 
                    		</div> 
                    	</div> 
                    </div>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary" title="전체입력 및 중복체크를 해주세요.">
                            회원가입<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="button" class="btn btn-warning" onclick="location.href='danim.do?command=main'">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                   

                </form>
            </div>

        </article>

</div>

</body>
</html>
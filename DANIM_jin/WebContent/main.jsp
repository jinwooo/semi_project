<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
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
</head>
<%
String id = "";


id = (String)session.getAttribute("sessionId");            // request에서 id 파라미터를 가져온다



if(id==null||id.equals("")){                            // id가 Null 이거나 없을 경우
%>

   <script type="text/javascript">
      $(function(){
         $("#beforeLogin").show();
         $("#afterLogin").hide();
      });
   </script>

<%   
}else{
   System.out.println(id);
%>

<script type="text/javascript">
   $(function(){
      $("#beforeLogin").hide();
      $("#afterLogin").show();
   });
</script>

<%   
}

%>

<script type="text/javascript">

   // 비밀번호 확인

function logchk(){
    var id= $("#formId").val();
   var pw= $("#formPw").val();

    $.ajax({
      url:"danim.do?command=login&id="+id+"&pw="+pw,   
            // data : data를 주겠다
              // data를 받겠다
      success:function(msg){
         if(msg=="ok"){
            alert("성공")
            location.href="danim.do?command=afterLogin&id="+id;
         
         }else if(msg=="no"){
            $("#loginError").show();
         }else if(msg=="remove"){
            $("#removeInfo").show();
         }

      },
      error:function(){
         alert("없는 id인듯");
         $("#loginError").show();
      }
   });                  
 }


   
   $(function(){
      $("#loginError").hide();
      $("#removeInfo").hide();
   });
   
    function confirmChk(){    

<%
      String as = request.getParameter("id");

%> 
      $.ajax({
         url:"danim.do?command=confirmchk&id=<%=as%>",   
               // data : data를 주겠다
                 // data를 받겠다
         success:function(msg){
            if(msg=="Y"){
                  location.href='firstMap.jsp';
            }else if(msg=="N"){
               alert("이메일 인증을 해주세요.")
            }

         },
         error:function(){
            alert("로그인 후 이용해주세요!");
         }
      }); 
      
      }
    
    function confirmChk2(){    

<%
      String bs = request.getParameter("id");
%> 
      $.ajax({
         url:"danim.do?command=confirmchk&id=<%=id%>",   
               // data : data를 주겠다
                 // data를 받겠다
         success:function(msg){
            if(msg=="Y"){
                  location.href='planner.jsp'; 
            
            }else if(msg=="N"){
               alert("이메일 인증")
            }

         },
         error:function(){
            alert("로그인 후 이용해주세요!");
         }
      }); 
      
      }
</script>

<style type="text/css">

@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
   font-family: 'BMHANNAAir'; 
}

html, body{
   width: 100%;
   height: 100%;
}

#mainbody{
   margin: auto;
   width: 1200px;
}

#title{
   font-weight : bold;
   font-size: 36px;
   font-style : italic;
   color : rgb(200,160,220);
   height: 55px;
    top: 27px;
    left: 20px;
    position: relative;
}

#demo{
    margin-left: 50px;
   border: none;
    resize: none;
    position: absolute;
    top: 200px;
    width: 450px;
    font-size: 19px;
    line-height: 2em;
    font-weight: bold;
    font-stlye: normal;
    color: #333333;
}
#mainimg{
   position : absolute;
   top : 140px;
   left : 950px;
}
#welcome{
   position : absolute;
   top : 43px;
   left : 1230px;
}
#login, #myPage{
   position : absolute;
   top : 38px;
   left : 1350px;
   
}
#join, #logout{
   position:absolute;
   top : 38px;
   left : 1430px;
}
.btn-success{
   width : 65.9286px;
   height : 34px;
   font-size : 15px;
   color : rgb(255,255,255);
   line-height:2.5em;
   border-radius :4px;
   background-color:rgb(190,190,190);
   text-align : center;
   font-weight : bold;
   border : none;
}
.btn-success:hover{
 background-color:   #D3D3D3;
}

#start{
   position : absolute;
   top: 600px;
   left: 40%;
   width:150px;
   height:50px;
   font-size:23px;
   font-stlye :  normal;
   font-weight : bold;
}

#start2{
   position : absolute;
   top: 600px;
   right: 40%;
   width:150px;
   height:50px;
   font-size:23px;
   font-stlye :  normal;
   font-weight : bold;
}

#review p input{
   width: 86px;
   height: 36px;
   font-stlye :  normal;
   font-weight : bold;
   cursor: pointer;
    font-size: 12pt;
}

hr{
   border:none;
   background-color : #C0C0C0;
   height :2px;
}
.hr-sect{

   display :flex;
   flex-basis : 100%;
   align-items : center;
   color : rgb(200,160,220);
   font-style : italic;
   font-weight : bold;
   font-size : 30px;
}
.hr-sect::after{
    content: "";
    flex-grow: 1;
    background: #C0C0C0;
    height: 2px;
    font-size: 0px;
    margin: 0 0 0 20px;
}
.btn-primary{
   background-color:rgb(200,160,220);
   border:none;
    color : white;
   text-align : center;
   font-size:12px;
   border-radius : 4px;
}
.btn-primary:hover,
.btn-primary:active{
   background-color : rgb(229, 204, 255);
}

   span{
      width:300px;
   }
   #log{
   
   
     all: unset;
      width: 300px;
   height: 49px;
      background-color: rgb(200, 160, 220);
      border-radius: 7px;
      color: white;
      font-size: 10pt;
      text-align: center;
      cursor: pointer;
      margin-bottom: 5px;
      font-size: 17px;
   
   }
   .inputInform{

      text-align: left;
      margin-bottom: 10px;
      width: 300px;
      height: 40px;
   

   }
   .logInput{
      position:   relative;
      left: 25px;
      width: 300px;
      height: 35px;
   }
   .modal-content{
      left: 90px;
      width: 390px;
      height: 410px;
   }
   .modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
        height:370px;
}

img{
    margin-bottom: 5px;
}

#loginGroup{
 position:   relative;
   width : 330px;
   top: 10px;
   left: 25px;
}

#share{
   margin: auto;
    width: 1000px;
}

#share td{
   padding: 5px 25px;
}


#board{
   margin-right: auto;
    margin-left: auto;
   width:150px;
   height:50px;
   font-size:23px;
   font-stlye :  normal;
   font-weight : bold;
}


th {
   text-align: center;
}

#community {
   margin: 50px auto;
   width: 800px;
}



</style>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<!-- 페이스북 -->
<script>
// This is called with the results from from FB.getLoginStatus().
   function statusChangeCallback(response) {
     console.log('statusChangeCallback');
     console.log(response);
     // The response object is returned with a status field that lets the
     // app know the current login status of the person.
     // Full docs on the response object can be found in the documentation
     // for FB.getLoginStatus().
     if (response.status === 'connected') {
       // Logged into your app and Facebook.
       testAPI();
     } else {
       // The person is not logged into your app or we are unable to tell.
       document.getElementById('status').innerHTML = 'Please log ' +
         'into this app.';
     }
   }

   // This function is called when someone finishes with the Login
   // Button.  See the onlogin handler attached to it in the sample
   // code below.
   function checkLoginState() {
     FB.getLoginStatus(function(response) {
       statusChangeCallback(response);
     });
   }

   window.fbAsyncInit = function() {
     FB.init({
       appId      : '393444431400616',
       cookie     : true,  // enable cookies to allow the server to access 
                           // the session
       xfbml      : true,  // parse social plugins on this page
       version    : 'v2.8' // use graph api version 2.8
     });

     // Now that we've initialized the JavaScript SDK, we call 
     // FB.getLoginStatus().  This function gets the state of the
     // person visiting this page and can return one of three states to
     // the callback you provide.  They can be:
     //
     // 1. Logged into your app ('connected')
     // 2. Logged into Facebook, but not your app ('not_authorized')
     // 3. Not logged into Facebook and can't tell if they are logged into
     //    your app or not.
     //
     // These three cases are handled in the callback function.

     FB.getLoginStatus(function(response) {
       statusChangeCallback(response);
     });

   };

   // Load the SDK asynchronously
   (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2';
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

   // Here we run a very simple test of the Graph API after login is
   // successful.  See statusChangeCallback() for when this call is made.
   function testAPI() {
     console.log('Welcome!  Fetching your information.... ');
     FB.api('/me',{fields: 'email,name'}, function(response) {
        setTimeout(function(){
            FB.logout(); 
          }, 10000);
    
       console.log('Successful login for: ' + response.name);
      
       location.href="danim.do?command=snsLogin&id="+response.id+"&name="+response.name;
       FB.logout();
     });
   }
   


</script>

<!--  카카오톡 -->
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('067cd728aca1925331e19dd03a049443');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
     Kakao.Auth.loginForm({
        success: function(authObj) {
          //alert(JSON.stringify(authObj));

          Kakao.API.request({
   
         url: '/v1/user/me',
         success: function(res) {
   
              
            kout();
              location.href="danim.do?command=snsLogin&id="+res.id+"&name="+res.properties.nickname
              
             }
           })

        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
    
 
  //]]>
    function kout(){
       
       Kakao.Auth.logout(function(data){
                alert(data)
            });
    }
</script>
<body>

<div id="mainbody">

<div data-text-content="true" id="title">
#DANIM
</div>



<div id="beforeLogin">
<div data-obj-type="element">
   <input type="button" id="login" value="로그인" class="btn-success" data-toggle="modal" data-target="#myModal">
</div>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" > 
                       <div class="modal-dialog"> 
                          <div class="modal-content"> 
                             <div class="modal-header"> 
                                <h4 class="modal-title" id="myModalLabel">Login</h4> 
                                <button type="button" class="close" data-dismiss="modal">
                                   <span aria-hidden="true">×</span>
                                   <span class="sr-only">Close</span>
                                </button> 
                             </div> 
                             <div class="modal-body">    
                                <form action="danim.do" method="post">
                                <input type="hidden" name="command" value="login"/>
                                   <div class="inputInform">
                                 <input id="formId"class="logInput" type="text" placeholder="아이디를 입력해주세요" value="" name="id"/>
                              </div>
                              <div class="inputInform">
                                 <input id="formPw"class="logInput" type="password" placeholder="비밀번호를 입력해주세요" value="" name="pw"/>
                              </div>
                              <span id="loginError" style="color:red">아이디 또는 비밀번호가 틀렸습니다.</span>
                              <span id="removeInfo" style="color:red">이미 탈퇴한 회원입니다.</span>
                              <div id="loginGroup">
                                   <input id="log" type="button" value="#DANIM으로 로그인" onclick="logchk();"/>
                                   
                                   <a id="custom-login-btn" href="javascript:loginWithKakao()"><br/><img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/></a><br/>
                           <div class="fb-login-button" scope="public_profile,email" data-width="300" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true" onlogin="checkLoginState();"></div>
                        </div>
                              <br>
                              <div align="center" > 
                                      <a href="findInfo.jsp" style="color:rgb(200, 160, 220)">아이디/비밀번호찾기</a><span>  <span>    &nbsp;|&nbsp;    </span>    </span><a href="join.jsp" style="color:rgb(200, 160, 220)" >회원가입</a>
                                   </div> 
                           </form>
                        </div> 
                          
                          </div> 
                       </div> 
                    </div> 

<div data-obj-type="element">   
   <input type="button" id="join" value="회원가입" class="btn-success" onclick="location.href='join.jsp'">
</div>
</div>
<div id="afterLogin">
<span id="welcome"><%=id %>님 환영합니다 </span>
<div data-obj-type="element">   
   <input type="button" id="myPage" value="내 정보" class="btn-success" onclick="location.href='myPage.jsp'">
   
</div>
<div data-obj-type="element">   
   <input type="button" id="logout" value="로그아웃" class="btn-success" onclick="location.href='danim.do?command=logout'">
</div>
</div>
<br/>

<hr>

<br/>
<br/>
<div data-obj-type="element" id="demo">
   <p>
      " 감성 여행 플래너 & 다이어리 "<br/><br/>
       안전 지대를 벗어나 모험을 해봐<br/>
       그에 대한 보상은 분명 가치있을거야<br/>
       -라푼젤-
   </p>
</div>
<div data-obj-type="image" id="mainimg">
   <img src="image/main.jpg" style="width :530px; height : 350px;">
</div>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<hr/>
<br/>

<div data-obj-type="element" >
   <input type="button" value="여행 만들기" spellcheck="false"  class="btn-primary" id="start" onclick="confirmChk();">
</div>
<div data-obj-type="element" >
   <input type="button" value="다이어리" spellcheck="false"  class="btn-primary" id="start2" onclick="confirmChk2();" >
</div>

<br/><br/><br/><br/><br/><br/><br/><br/>
<%
   int curPageNum=0;
%>

<div id="review">
   <div class="hr-sect">Diary</div>
   <p align="right">
      <input type="button" value="더보기" class="btn-primary" onclick="location.href='danim.do?command=diary&page=1'"/>
   </p>
   
   <div id="share">
      <table>
         <col width="200px">
         <col width="200px">
         <col width="200px">
         <col width="200px">
          <c:choose>
            <c:when test="${empty plist }">
               <tr align="center">
                  <td colspan="4">- - - 작성된 글이 없습니다 - - -</td>
               </tr>
            </c:when>
            <c:otherwise>
               <c:forEach items="${plist }" var="dto">
                  <tr align="center">
                     <td align="center"><img src="sav/${dto.pimage }" width="200px" height="200px" ></td>
		          </tr>
		          <tr style="font-size: 14pt; font-weight: bold;">
            		 <td>${dto.ptitle }</td>
            	  </tr>
            	  <tr>
  			          <td>#갬성 #여행 #DANIM</td>
  			      </tr>
               </c:forEach>
            </c:otherwise>
         </c:choose>
         
      </table>
   </div>
   
   
</div>

<br/>
<br/>
<br/>

<div>
   <div class="hr-sect">Community</div>
   
   <div id="community">
      <table border="1">
         <col width="50px">
         <col width="400px">
         <col width="100px">
         <col width="200px">
         <col width="50px">
   
         <tr>
            <th>No.</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
            <th>♥</th>
         </tr>
         <tr align="center">
            <td>0</td>
            <td align="left">어머님,,감당가능하실,,? 이건,,임의로 넣은 row입니다↘,,,</td>
            <td>쓰앵님</td>
            <td>2019-01-28 15:34:57</td>
            <td>234</td>
         </tr>
   
         <c:choose>
            <c:when test="${empty list }">
               <tr align="center">
                  <td colspan="5">- - - 작성된 글이 없습니다 - - -</td>
               </tr>
            </c:when>
            <c:otherwise>
               <c:forEach items="${list }" var="dto">
                  <tr align="center">
                     <td>${dto.boardno }</td>
                     <td style="text-align: left;">${dto.title }</td>
                     <td>${dto.id }</td>
                     <td>${dto.regdate }</td>
                     <td>${dto.likenum }</td>
                  </tr>
               </c:forEach>
            </c:otherwise>
         </c:choose>
   
      </table>
   </div>
   
   <div  align="center">
      <input type="button" value="게시판 입장" class="btn-primary" id="board" onclick="location.href='danim.do?command=review&page=1'"/>
   </div>
</div>

<br/><br/><br/><br/><br/><br/>

</div>

<%@ include file="./form/footer.jsp" %>


</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
<title>Insert title here</title>
<script type="text/javascript">


$(function(){
   
      $("input[name='chk']").click(function(){
         if($(this).prop('checked')){
            $("input[name='chk']").prop("checked",false);
            $(this).prop("checked",true);
         }
      })

   });
   

   


function gradecheck(){
/*    var valueCheck = false;
    var delCheck = confirm($('#grade option:selected').val()+'로 변경하시겠습니까?');
    if(delCheck==true){

       alert(ss);
    } */
   var tempText = $(this); 
    alert(temtText);
}

function yncheck(){
   var valueCheck = false;
    var delCheck = confirm($('#yn').val()+'로 변경하시겠습니까?');
    if(delCheck==true){
       alert("안녕");
    }
}






</script>
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


#write,#back{
    

   width:60px;
   height:30px;
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

   float: right;
   background-color:rgb(200,160,220);
   border:none;
    color : white;
   text-align : center;
   font-size:15px;
   border-radius : 4px;
   left: 50px;
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
<style type="text/css">


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
      <li><a href="danim.do?command=adminMain">회원 관리</a></li>
      <li><a href="danim.do?command=review&page=1">글 관리</a></li>
	  <li><a href="danim.do?command=diary&page=1">다이어리 관리</a></li>
    </ul>
  </div>
</div>
  <!-- /사이드바 -->
  


<div align="center">
<h1>회원 관리</h1>
   <input type="hidden" name="command" value="" >
   <table border="1" style="text-align: center">

      <col width="30px"/>
      <col width="100px"/>      
      <col width="100px"/>
      <col width="200px"/>
      <col width="100px"/>
      <col width="300px"/>
      <col width="110px"/>
      <col width="70px"/>
      <col width="50px"/>
      <col width="50px"/>
      <tr>
         <th></th>
         <th>아이디</th>
         <th>별  명</th>
         <th>주  소</th>
         <th>전화번호</th>
         <th>이메일</th>
         <th>회원등급</th>
         <th>탈퇴여부</th>
         <th>인증여부</th>
         <th>가입경로</th>
         
      </tr>
      <c:choose>
         <c:when test="${empty list }">
         <tr>
            <td colspan="6">---작성된 글이 없습니다----</td>
         </tr>
         </c:when>
         <c:otherwise>
         <form action ="danim.do" method="post">
         <input type="hidden" name="command" value="updateUserForm">
            <c:forEach items="${list }" var="dto" varStatus="status">
             
               <tr id="trr">
                  <td><input type="checkbox"name="chk" value="${dto.id }"/>
                  <td>${dto.id }</td>
                  <td>${dto.name }</td>
                  <td>${dto.addr }</td>
                  <td>${dto.phone }</td>
                  <td>${dto.email }</td>
                  <td>${dto.grade }</td>
                  <td>${dto.yn }</td>
                  <td>${dto.confirm }</td>
                  <td>${dto.sns }</td>
                  
               </tr>
               </c:forEach>
   
     
        <tr style="border-right:hidden; border-left:hidden; border-bottom:hidden;"><td colspan="10"><input type="submit" id="back" value="수정" class="btn-primary" ></td></tr>
            </form>
         </c:otherwise>
      </c:choose>
      
      <tr> </tr>   
   </table> 
   </div>
</body>
</html>
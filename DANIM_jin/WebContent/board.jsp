<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" >
 <script src="js/bootstrap.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
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
							location.href='write.jsp';
					}else if(msg=="N"){
						alert("이메일 인증을 해주세요.")
					}

				},
				error:function(){
					alert("ajax실패");
				}
			}); 
			
			}


</script>
<style type="text/css">

table{
	margin: auto;
}

#share{
	font-weight : bold;
	font-size: 32px;
	color: #8B8989;
	text-align: center;
	margin: 50px auto;
	width: 700px;
   	border: 2px solid lightgray;
   	border-radius: 25px;
	padding: 25px;
}

#boardContainer{
	margin: 50px auto;
	width: 1000px;
	border: 2px solid lightgray;
   	border-radius: 25px;
	padding: 25px;
}

#boardtop{
    text-align: center;
    font-weight: bold;
}

#boardContainer td{
	padding: 20px;
}

#boardContainer tr{
	border-bottom: 2px dashed lightgray;
}

.selected{
	color:rgb(200,160,220);
}

.center-block {
    display: block;
    margin-right: auto;
    margin-left: auto;
}

.btn-primary,#write,#back{
	background-color:rgb(200,160,220);
	border:none;
 	color : white;
	text-align : center;
	font-size:12px;
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

.pager{
	font-size:20px;
	font-weight: bold;
}
#write,#back{
    
	postion: absolute;
	width:120px;
	height:50px;
	font-size:23px;
	font-style: normal;
	font-weight: bold;
}
a #detail{
	color : black;
}
#detail:hover,
#detail:active{
	font-weight:bold;
}


@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
	font-family: 'BMHANNAAir'; 
}

#boardbtn{
	margin-top: 25px; 
}

</style>

<script type="text/javascript" src="js/jquery-3.3.1.min.js">
</script>
<script type="text/javascript">
<!--
	function goPage(i){
		if(i==null){
			i=1;
		}
		var cur=i;
		alert(cur);
		
	  $.ajax({
      url:"danim.do?command=review&page="+i,   
      type:"get",
      ascyc:true,
     
      success:function(t){
    	alert("연결성공!");
     	alert(msg);
      },
      error:function(){
       
      }
   });  
		  		
	}-->
</script>

</head>
<body>

<div style="height: 100px;">
	<jsp:include page="./form/header.jsp"></jsp:include>
</div>

	<form action="danim.do" method="post">
		<h1 id="share"><i>Community</i></h1>
		<input type="hidden" name="command" value="" >
		<div id="boardContainer">
			<table>
		         <col width="100px">
		         <col width="425px">
		         <col width="125px">
		         <col width="200px">
				<tr id="boardtop">
		            <td>No.</td>
		            <td>제목</td>
		            <td>글쓴이</td>
		            <td>작성일</td>
				</tr>
				<c:choose>
					<c:when test="${empty pagelist }">
					<tr>
						<td colspan="6">---작성된 글이 없습니다----</td>
					</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${pagelist }" var="dto">
							<tr>
								<td align="center">${dto.boardno }</td>
								<td id="boardtitle"><a href="danim.do?command=boarddetail&boardno=${dto.boardno  }" id="detail">${dto.title }</a></td>
								<td align="center">${dto.id }</td>
								<td align="center">${dto.regdate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</table>
		<div align="center" id="boardbtn">
			<div style="display: inline-block;  margin-right: 30px;" >
				<input type="button"  id="write" value="글쓰기" class="btn-primary"  onclick="confirmChk();"  >
			</div>
			<div style="display: inline-block" >	
				<input type="button" id="back" value="뒤로가기" class="btn-primary" onclick="location.href='danim.do?command=main'" >
			</div>
		</div>
	</div>
	</form>

<div class="pager" align="center">
	
		<c:if test="${paging.curPageNum>4 }">
			<a href="danim.do?command=review&page=${paging.blockStartNum-1 }">◀</a>	
		</c:if>
		<c:forEach var="i" begin="${paging.blockStartNum }" end="${paging.blockLastNum }">
			<c:choose>
				<c:when test="${i>paging.lastPageNum || paging.lastPageNum==0 }">
					<a href="danim.do?command=review&page=${i }" style="color:gray;">${i }</a>
				</c:when>
				<c:when test="${i==paging.curPageNum }">
					<a href="danim.do?command=review&page=${i }" class="selected">${i }</a>
				</c:when>	
				<c:otherwise>
					<a href="danim.do?command=review&page=${i }" style="color:gray;">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.lastPageNum>paging.blockLastNum }">
			<a href="danim.do?command=review&page=${paging.blockLastNum+1 }">▶</a>
		</c:if>
</div>
<br/>




</body>
</html>
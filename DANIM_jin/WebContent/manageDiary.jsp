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
<title>다이어리 게시판 입장</title>
<style type="text/css">

table{
	margin: auto;
}

#share{
	font-weight : bold;
	font-size: 32px;
	color: #8B8989;
}

ul{
   list-style:none;
   padding-left:0px;
   }

img { display: block; }

.pager{
	font-size:20px;
	font-weight: bold;
}


@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
	font-family: 'BMHANNAAir'; 
}


	
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
<script type="text/javascript" src="js/jquery-3.3.1.min.js">
</script>


</head>
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
      <li><a href="manageUser.jsp">회원 관리</a></li>
      <li><a href="danim.do?command=review&page=1">글 관리</a></li>
	  <li><a href="danim.do?command=diary&page=1">다이어리 관리</a></li>	
    </ul>
  </div>
</div>
  <!-- /사이드바 -->
  <br/><br/>
<div align="center">
<form action="danim.do" method="post">
	<h1 id="share">다른 여행자들의 #DANIM</h1> <br/><br/>
	<input type="hidden" name="command" value="" >
	<table border="1">
		<col width="50px"/>
		<col width="300px"/>
		<col width="200px"/>
		<tr>
			<th>No</th>
			<th>#diary</th>
			<th>다이어리 설명</th>
		</tr>
		<c:choose>
			<c:when test="${empty pagelist }">
			<tr>
				<td colspan="3">---작성된 글이 없습니다----</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${pagelist }" var="Pdto">
					<tr>
						<td>${Pdto.pno }</td>					
						<td><img src="sav/${Pdto.pimage }.png" width="200px" height="200px"></td>
						<td>${Pdto.id } &nbsp;&nbsp; ${Pdto.ptitle }</td>
					</tr>	
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</form>

<div class="pager" align="center">
	
		<c:if test="${paging.curPageNum>4 }">
			<a href="danim.do?command=diary&page=${paging.blockStartNum-1 }">◀</a>	
		</c:if>
		<c:forEach var="i" begin="${paging.blockStartNum }" end="${paging.blockLastNum }">
			<c:choose>
				<c:when test="${i>paging.lastPageNum || paging.lastPageNum==0 }">
					<a href="danim.do?command=diary&page=${i }" style="color:gray;">${i }</a>
				</c:when>
				<c:when test="${i==paging.curPageNum }">
					<a href="danim.do?command=diary&page=${i }" class="selected">${i }</a>
				</c:when>	
				<c:otherwise>
					<a href="danim.do?command=diary&page=${i }" style="color:gray;">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.lastPageNum>paging.blockLastNum }">
			<a href="danim.do?command=diary&page=${paging.blockLastNum+1 }">▶</a>
		</c:if>
</div>

</div>

</body>
</html>














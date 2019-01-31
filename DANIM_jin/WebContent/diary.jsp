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
	display:inline-block; 
	align : center;
}

#title{
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
#share{
	margin: auto;
    width: 1000px;
}

#share td{
	padding: 5px 25px;
}


@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
	font-family: 'BMHANNAAir'; 
}


</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js">
</script>


</head>
<body>

<div style="height: 100px;">
	<jsp:include page="./form/header.jsp"></jsp:include>
</div>

<form action="danim.do" method="post">
<h1 id="title">&nbsp; &nbsp;다른 여행자들의 Diary</h1>
	<input type="hidden" name="command" value="" >
	<div id="share">		
		<c:choose>
			<c:when test="${empty pagelist }">
				<div>---작성된 글이 없습니다.----</div>
			</c:when>
			<c:otherwise>				
			<c:forEach items="${pagelist }" var="Pdto" >
			<table>
			<col width="200px">
				<tr>
					<td align="center"><a href="danim.do?command=diarydetail&pno=${Pdto.pno }"><img src="sav/${Pdto.pimage }" width="200px" height="200px" ></a></td>
				</tr>
				<tr style="font-size: 14pt; font-weight: bold;">
					<td> ${Pdto.ptitle }</td>
				</tr>
				<tr>
					<td>#갬성 #여행 #당일치기</td>
				</tr>		
			</table>
			</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
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



</body>
</html>














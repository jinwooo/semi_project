<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>	
<%@page import="com.plan.dto.planDto" %>
<%@page import="com.plan.dao.planDao" %>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="com.like.dto.LikeDto"%>
<%@page import="com.like.dao.LikeDao"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="com.board.dao.BoardDao"%>
<%@page import="com.cmt.dto.BoardCmtDto"%>
<%@page import="java.util.List"%>
<%@page import="com.cmt.dao.BoardCmtdao"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

	String pno=request.getParameter("pno");

	planDao Pdao=new planDao();
	planDto Pdto=Pdao.selectOne(pno);
	
	int ipno=Integer.parseInt(request.getParameter("pno"));
	
	BoardDao dao = new BoardDao();
	BoardDto dto=dao.selectOne(ipno);	
	BoardCmtdao cmtdao = new BoardCmtdao();
	List<BoardCmtDto> cmtList = cmtdao.selectCmt(ipno);
	
	int cmtCount = cmtdao.CmtCount(ipno);
	String id = (String)session.getAttribute("sessionId"); 
	
	LikeDao likedao = new LikeDao();
	LikeDto likedto = new LikeDto(id, ipno);
	int isLiked = likedao.isLiked(likedto);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" >
 <script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style type="text/css">

#name{
	margin : auto;
	font-weight : bold;
	font-size: 32px;
	color: #8B8989;
}

.title{
	font-weight : bold;
	font-size: 25px;
	font-family: Arial;
	width:400px;
	height:50px;
	margin:auto;
}

.content{
	margin:auto;	
}

.btn-primary,#back{
	background-color:rgb(200,160,220);
	border:none;
 	color : white;
	text-align : center;
	font-size:12px;
	border-radius : 4px;
}

.btn-primary,#back:hover,
.btn-primary,#back:active{
	background-color : rgb(229, 204, 255);
}

#back{
	postion: relative;
	width:120px;
	height:50px;
	font-size:23px;
	font-style: normal;
	font-weight: bold;
	margin-top: 120px;

}


@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
	font-family: 'BMHANNAAir'; 
}

</style>


<body>
	<!-- 헤더 -->
	<div style="height: 100px;">
		<jsp:include page="./form/header.jsp"></jsp:include>
	</div>

	<!-- 본문 -->
	<h1 id="name"><%=Pdto.getId() %> 님의 다이어리</h1>
	
	<br/><br/><br/>
	<div align="center">
	<div id="diarybody">	
		<!-- content -->
		<div class="content"  >
			<div class="title">
				<p><%=Pdto.getPtitle() %></p>
			</div>
			<div class="diary" style="width:500px; height:500px; margin:auto;">
				<img src="sav/<%=Pdto.getPimage()%>" style="width:600px; height:600px;">
			</div>
		
		</div>		
	</div>
	

		<div>
			<input type="button" id=back value=뒤로가기 class="btn-primary" onclick="location.href='danim.do?command=main'" >
		</div>
	
	</div>


</body>
</html>
























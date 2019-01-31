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
<title>Insert title here</title>

<style type="text/css">

table{
	margin: auto;
}

#name{
	font-weight : bold;
	font-size: 32px;
	color: #8B8989;
}


@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
	font-family: 'BMHANNAAir'; 
}

</style>


</head>
<body>

<div style="height: 100px;">
	<jsp:include page="./form/header.jsp"></jsp:include>
</div>

<form action="danim.do" method="post">
	<h1 id="name" ><%=Pdto.getId() %> 님의 다이어리</h1>
	<input type="hidden" name="command" value="">
	<div class="title" >
		<%=Pdto.getPtitle() %>
	</div>
	
	<div class="dairy">
		<img src="sav/<%=Pdto.getPimage()%>" width="500px" height="500px">
		<span><%=dto.getLikenum() %></span>
	</div>

</form>



</body>
</html>
























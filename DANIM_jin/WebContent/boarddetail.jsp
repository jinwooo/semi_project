<%@page import="com.board.dto.BoardDto"%>
<%@page import="com.board.dao.BoardDao"%>
<%@page import="com.cmt.dto.BoardCmtDto"%>
<%@page import="java.util.List"%>
<%@page import="com.cmt.dao.BoardCmtdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setContentType("text/html; UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int boardno = Integer.parseInt(request.getParameter("boardno"));
	
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.selectOne(boardno);
	
	
	BoardCmtdao cmtdao = new BoardCmtdao();
	
	List<BoardCmtDto> cmtList = cmtdao.selectCmt(boardno);
	
	int cmtCount = cmtdao.CmtCount(boardno);
	String id = (String)session.getAttribute("sessionId"); 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	html,body{
		height: 100%;
	}
	
</style>

</head>
<body>
	<!-- header -->
	<div style="height: 100px;">
		<jsp:include page="./form/header.jsp"></jsp:include>
	</div>
	
	<!-- board content -->
	<div id="boardContent">
		<div class="content">
			
		</div>
		
		<div class="userlike">
			♥ <%=dto.getLikenum() %>
		</div>
	</div>
	
	<!-- board comment -->
	<div id="comment">
		<form action="danim.do?command=insertCmt" method="post">
			<input type="hidden" name="boardno" value="<%=boardno %>" >
			<input type="hidden" name="id" value="<%=id %>" >
			<table border="1">
				<col width="50px">
				<col width="100px">
				<col width="50px">
				<tr>
					<th colspan="4" align="center">댓글 [ <%=cmtCount %> ] </th>
				</tr>
				<tr>
					<td align="center"><%=id %></td>
					<td><textarea rows="3" cols="45" name="cmt" placeholder="내용을 입력해주세요"></textarea>
					<td><input type="submit" value="작성"></td>
				</tr>
			</table>
		</form>


		<div class="cmtlist">
<%
		if(cmtList.size() == 0){
%>
			<span>작성된 댓글이 없습니다.</span>		
<%
		} else {
			for(BoardCmtDto cmtdto : cmtList){
%>
				<span class="cmtname"><%=cmtdto.getCmtno() %></span>
				<span class="cmtid"><%=cmtdto.getId() %></span>
<%
				if(dto.getId().equals(id)){
%>
					<a class="cmtdelete" href="danim.do?command=deleteCmt&cmtno=<%=cmtdto.getCmtno() %>">삭제</a>
<%
				}
%>
				<div class="cmtcontent">
					<%=cmtdto.getCmt() %>
				</div>
<%
		}
	}
%>
		</div>

	</div>

	<!-- footer -->
	<div>
		<jsp:include page="./form/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>
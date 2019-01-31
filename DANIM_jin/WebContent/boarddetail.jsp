<%@page import="com.like.dto.LikeDto"%>
<%@page import="com.like.dao.LikeDao"%>
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
	
	LikeDao likedao = new LikeDao();
	LikeDto likedto = new LikeDto(id, boardno);
	int isLiked = likedao.isLiked(likedto);
	
	//String id=request.getParameter("id");
	
	

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
	
	html,body{
		width: 100%;
		height: 100%;
	}
	
	#detailbody{
		display: grid;
		margin-top: 50px;
	}
	
	#detailbody .boardContent, #detailbody .comment{
		margin: auto; 
	}
	
	#detailbody .comment{
		margin-top: 50px;
	}
	
	
	#detailbody .comment .cmtinput{
		padding: 0 25px 10px;
	}
	
	#detailbody .comment .cmtinput .cmttext{
		all: unset;
		border: 1px solid lightgray;
		border-radius: 10px; 
		padding: 10px;
	}
	
	#detailbody .comment .cmtinput input[type=submit] {
      all: unset;
      width: 70px;
      height: 70px;
      background-color: rgb(200, 160, 220);
      border-radius: 35px;
      color: white;
      font-size: 11pt;
      text-align: center;
      cursor: pointer;
   }
   
	#detailbody .comment .cmtlist{
		background: #efefef; 
		padding: 15px 10px;
		border-radius: 10px; 
	}
	
	#detailbody .comment .cmtlist .cmttable{
		border-collapse: collapse;
	}
	
	#detailbody .comment .cmtlist .cmttable .cmtContent{
		padding: 10px 13px;
	}
	
	#detailbody .userlike{
		margin-top: 25px;
		text-align: center;
		display: block;
	}
	#likebtn {
		all: unset;
		cursor: pointer;
	}
	.btn-primary,#update{
		background-color:rgb(200,160,220);
		border:none;
 		color : white;
		text-align : center;
		font-size:12px;
		border-radius : 4px;
	}
	
   	.btn-primary,#update:hover,
	.btn-primary,#update:active{
		background-color : rgb(229, 204, 255);
	}
	#update{
	
		postion: absolute;
		width:120px;
		height:50px;
		font-size:23px;
		font-style: normal;
		font-weight: bold;
		margin-top:20px;
	}
   
	
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		$("#likebtn").click(function() {
			
			$.ajax({
				url: "danim.do",
				type: "post",
				data: { command : "like", id: "<%=id %>", boardno : <%=boardno %> },
				dataType: "json",
				success: function (data) {
					
					var msg = data.msg;
					var likenum = data.likenum;
						
					if(msg=="unlike"){
						$("#likebtn > img").attr("src","./image/unlike.png");
						$("#likebtn > span").html(likenum)
						
					} else if(msg=="like"){
						$("#likebtn > img").attr("src","./image/like.png");
						$("#likebtn > span").html(likenum)
					}
				},
				error:function(){
					alert("좋아요 실패ㅠ");	
				}
				
			})
			
		})
		
	});
	
</script>


</head>
<body>
	<!-- header -->
	<div style="height: 100px;">
		<jsp:include page="./form/header.jsp"></jsp:include>
	</div>
	
	<div id="detailbody">
		<!-- board content -->
		<div class="boardContent">
			<table border="1">


		<col width="200px"/>
		<col width="300px"/>
		<col width="100px"/>
		<col width="50px"/>
		<tr>
			<th>제  목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getViewcount() %></td>
		</tr>
		<tr>
			<th>내   용</th>
			<td><textarea rows="10" cols="60" readonly="readonly"><%=dto.getContent() %></textarea></td>
		</tr>	


	</table>
			
			<div class="userlike">
					<button id="likebtn">
						<img src="<%=isLiked>0?"image/like.png":"image/unlike.png" %>" width="25px" height="25px">
						<span><%=dto.getLikenum() %></span>
					</button>
			</div>
		</div>
	
		<!-- board comment -->
		<div class="comment">
			<div class="cmtinput">
				<form action="danim.do?command=insertCmt" method="post">
					<input type="hidden" name="boardno" value="<%=boardno %>" >
					<input type="hidden" name="id" value="<%=id %>" >
					<table>
						<col width="600px">
						<col width="70px">
						<tr>
							<th colspan="4">댓글 [ <%=cmtCount %> ] </th>
						</tr>
						<tr>
							<td><textarea rows="2" cols="79" name="cmt" class="cmttext" placeholder="내용을 입력해주세요"></textarea>
							<td><input type="submit" value="작성"></td>
						</tr>
					</table>
				</form>
			</div>

			<div class="cmtlist">
<%
			if(cmtList.size() == 0){
%>
				<span style="text-align: center; display: block; padding: 25px;">작성된 댓글이 없습니다.</span>		
<%
			} else {
%>
				<table class="cmttable">
					<col width="500px">
					<col width="50px">
					<col width="150px">
<%
				int i = 1;
				for(BoardCmtDto cmtdto : cmtList){
%>
					<tr <%=i>1?"style='border-top: 2px dashed white;'":"" %>>
						<th><%=cmtdto.getId() %></th>
<%
					if(cmtdto.getId().equals(id)){
%>
						<td><a class="cmtDelete" href="danim.do?command=deleteCmt&cmtno=<%=cmtdto.getCmtno() %>&boardno=<%=boardno %>">삭제</a></td>
<%
					} else {
%>
						<td></td>
<%
					}
%>
						<td><%=cmtdto.getCmtdate() %></td>
					</tr>
					
					<tr>
						<td colspan="3">
							<div class="cmtContent">
								<%=cmtdto.getCmt() %>
							</div>
						</td>
					</tr>
<%
					i++;
				}
			}
%>
				</table>
			</div>
		</div>
	

	<div align="center">
		<input type="button" id="update" class="btn-primary" value="수정하기" onclick="location.href='danim.do?command=updateboard&boardno=<%=boardno%>&id=<%=id%>'"/>
	</div>	
		
	</div>
	

	<!-- footer -->
	<div style="text-align: center; margin: 50px 0 50px 0; padding: 20px; border-top: 1px solid lightgray;">
		<jsp:include page="./form/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>
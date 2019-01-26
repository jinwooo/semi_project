<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="danim.do" method="post">
	<h1>Board</h1>
	<input type="hidden" name="command" value="" >
	<table border="1">
		<col width="50"/>
		<col width="200px"/>
		<col width="200px"/>
		<col width="300px"/>
		<col width="100px"/>
		<col width="50px"/>
		<tr>
			<th>번  호</th>
			<th>글제목</th>
			<th>id</th>
			<th>파일이름</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
			<tr>
				<td colspan="6">---작성된 글이 없습니다----</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.boardno }</td>
						<td><a href="danim.do?command=boarddetail&boardno=${dto.boardno }">${dto.title }</a></td>
						<td>${dto.id }</td>
						<td>${dto.filename }</td>
						<td>${dto.regdate }</td>
						<td>${dto.viewcount }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<tr></tr>	
	</table>

</form>

<div class="pager">
	
		<c:if test="${paging.curPageNum>4 }">
			<a href="danim.do?command=review&page=${paging.blockStartNum-1 }">앞으로</a>	
		</c:if>
		<c:forEach var="i" begin="${paging.blockStartNum }" end="${paging.blockLastNum }">
			<c:choose>
				<c:when test="${i>paging.lastPageNum || paging.lastPageNum==0 }">
					<a href="danim.do?command=review&page=${i }">${i }</a>
				</c:when>
				<c:when test="${i==paging.curPageNum }">
					<a href="danim.do?command=review&page=${i }" class="selected">${i }</a>
				</c:when>	
				<c:otherwise>
					<a href="danim.do?command=review&page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.lastPageNum>paging.blockLastNum }">
			<a href="danim.do?command=review&page=${paging.blockLastNum+1 }">뒤로</a>
		</c:if>

</div>
<div>
	<input type="button"  id="write" value="삭제" class="btn-primary center-block" onclick="location.href='danim.do?command=insert'" >
</div>

</body>
</html>
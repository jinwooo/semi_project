<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>	
<%@page import="com.board.dto.BoardDto"%>
<%@page import="com.board.dao.BoardDao"%>

<%
	String id="";
	id=(String)session.getAttribute("sessionId");
	String ctx=request.getContextPath();
	
	int boardno=Integer.parseInt(request.getParameter("boardno"));
	
	BoardDao dao=new BoardDao();
	BoardDto dto=dao.selectOne(boardno);
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 스마트 에디터 소스 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="<%=ctx %>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

var oEditors=[];
$(function(){
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef:oEditors,
		elPlaceHolder:"smarteditor", // textarea에서 지정한 id
		sSkinURI:"/DANIM_jin/se2/SmartEditor2Skin.html",
		htParams : {
			//툴바 사용 여부
			bUserToolbar : true,
			//입력창 크기 조절바 사용 여부
			bUserVerticalResizer: true,
			//모드텝 (Editor | HTML | TEXT)
			bUserModeChanger : true,
			fOnBeforeUnload : function(){	
			}
		},
		fOnAppLoad : function(){
			// 기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			oEditors.getById["smarteditor"].exec("PASTE_HTML",["글을써주세요.."]);
		},
		fCreator:"createSEditor2"
	});
	// 저장버튼 클릭-> form전송
	$("#save").click(function(){
		oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD",[]);
			$("#frm").submit();
	});
	
});



</script>


</head>
<body>

<h1>내 게시글 수정</h1>
<form action="danim.do" method="post" id="frm"> 
<input type=hidden name="command" value="updateboardres"/>
<input type="hidden" name="id" value=<%=id %>>

	<table width="100%">
		<tr>
			<th>글번호</th>
			<td><input type="text" name="boardno" value=<%=dto.getBoardno() %> readonly="readonly"/></td>
		</tr>
		<tr>
			<th>제  목</th>
			<td><input type="text" name="title" value=<%=dto.getTitle() %> /></td>
		</tr>
		<tr>
			<th>내  용</th>
			<td><textarea name="content" id="smarteditor" rows="10" cols="100" style="width:650px; height:350px;"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2"> 
				<input type="submit" id="save" value="저장"/>
				<input type="button" id="cancel" value="취소" onclick="location.href='danim.do?command=boarddetail'" />
			</td>
		</tr>
	
	</table>

</form>



</body>
</html>


































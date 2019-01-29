<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" >
 <script src="js/bootstrap.min.js"></script>
<style type="text/css">
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

@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
input[type=button]{
	font-family: 'BMHANNAAir'; 
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

</style>
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
      <li><a href="manageWriting">글 관리</a></li>

    </ul>
  </div>
</div>
  <!-- /사이드바 -->
  <br/><br/><br/><br/><br/><br/>
<div align="center">
<h1>회원 관리</h1>
<br/><br/><br/>
<form action ="danim.do" method="post">
	<input type="hidden" name="command" value="updateUser">
	<input type="hidden" name="id" value="${dto.id }">
	<table border="1" style="text-align: center">

		<col width="100px" />
		<col width="100px" />
		<col width="200px" />
		<col width="100px" />
		<tr>
			<th>아이디</th>
			<td>${dto.id }</td>
		</tr>
		<tr>
			<th>이 름</th>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<th>등 급</th>
			<td>
				<select name='grade'>
					<option selected="selected">${dto.grade=="admin"?"admin":"general" }</option>
					<option>${dto.grade=="admin"?"general":"admin" }</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>탈퇴여부</th>		
			<td>
				<select name='yn'>
					<option selected="selected">${dto.yn=="Y"?"Y":"N" }</option>
					<option>${dto.yn=="Y"?"N":"Y" }</option>
				</select>
			</td>
		</tr>
	</table>
	<div align="center">
		<div style="display: inline-block; margin-right: 30px;">
			<input type="submit" value="수정" id="write" class="btn-primary">
		</div>
		<div style="display: inline-block">
			<input type="button" value="취소" id="back" class="btn-primary">
		</div>
	</div>
</form>
</div>
</body>
</html>
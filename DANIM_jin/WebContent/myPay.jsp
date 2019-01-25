<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pay.dao.payDao" %>
<%@ page import="com.pay.dto.payDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script type="text/javascript">

<% 
String count = request.getParameter("count");

int minus = Integer.parseInt(count)-3;
%>

function openWin(){  
   window.open("pay.jsp", "결제창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  



function payClear() {
	alert("안해");
	
	if(<%=minus%>>=0){
		<%
		
		%>
		
	}else{
		alert("보유한 연필이 부족합니다.");
	}
	
}

</script>



<body>
	

	<table border="1">
		<tr>
			<th>보유중인 연필 갯수</th>
			<th>필요한 연필 갯수</th>
			<th>남은 연필 갯수</th>
			<th>결제하기</th>
			<th>충전하기</th>
		</tr>
		<tr>
			<td><%=count %></td>
			<td>3</td>
			<td id="minus"><%=minus %></td>
			<td><button onclick="payClear();">결제 하기</button></td>
			<td><button onclick="openWin();">연필 충전</button></td>
			
		</tr>
	</table>




</body>
</html>
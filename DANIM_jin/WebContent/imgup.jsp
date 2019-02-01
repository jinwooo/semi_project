<%@page import="java.util.Enumeration"%>
<%@page import="com.updateImg.dto.updateImgDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import ="com.updateImg.dto.updateImgDto" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	
	String id = (String)session.getAttribute("sessionId");;
	System.out.println(id);
	//String savePath = request.getServletContext().getRealPath("img\\"+id);
	String savePath = "C:\\Users\\user2\\git\\semi_project\\DANIM_jin\\WebContent\\img\\"+id;
	System.out.println("저장될 경로 : "+savePath);
	/*  폴더 생성하기 */
	//생성할 파일경로 지정
	String path = savePath;
	//파일 객체 생성
	File file = new File(path);
	//!표를 붙여주어 파일이 존재하지 않는 경우의 조건을 걸어줌
	if(!file.exists()){
	//디렉토리 생성 메서드
	file.mkdirs();
	System.out.println("created directory successfully!");
	}

	//파일에 저장될 서버의 경로,
	
	int sizeLimit = 1024*1024*30; //파일크기제한 30mb
	
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	
	Enumeration<?> files =multi.getFileNames();
	
	updateImgDto dto = new updateImgDto();
	
	while(files.hasMoreElements()){
		String filesName = (String)files.nextElement();
		savePath = (String)multi.getFilesystemName(filesName);
	}
	
	String realPath = savePath + "\\" + savePath;
	String realPath1 = application.getRealPath("\\");
	
	
		
 
%>

<script type="text/javascript">
	location.href = "planner.jsp?load=yaaa";
</script>


<title>Insert title here</title>
</head>
<body>
</body>




</html>

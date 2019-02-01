<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page import="com.plan.dto.planDto"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<b>dsfasdfasdfs</b>
	<%
		planDto dto = (planDto)request.getAttribute("dto");	
		//out.println(dto.getPdata());
		//String filename = "temp.txt";
		System.out.println(dto.getPdata() + "###");
		
		String encoding = "<"+"%"+"@"+ " page language="+"\"java\""+ " contentType="+"\"text/html; charset=UTF-8\""+" pageEncoding="+"\"UTF-8\" "+"%"+">";
		String encoding1 = "<" + "%" +" request.setCharacterEncoding(" +"\"UTF-8\""+ "); " + "%" + ">";
		String encoding2 = "<"+"%" + " response.setContentType(" + "\"text/html; charset=UTF-8\"" + "); " + "%"+">";
		
		PrintWriter writer = null;
		
		String filePath = "";

	 	try{
			//filePath = request.getServletContext().getRealPath("txtSrc");
			//filePath = request.getSession().getServletContext().getRealPath("form");
			//filePath = (this).getClass().getResource("").getPath();
			//out.println(filePath);
			filePath = "C:\\Users\\user2\\git\\semi_project\\DANIM_jin\\WebContent\\sav"; 
			//filePath = "./form/";
			filePath = filePath +"\\"+dto.getPno()+".jsp";
			//out.print(filePath);
		
			writer = new PrintWriter(new File(filePath));
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath), "UTF-8"));
			
			writer.write(encoding);
			writer.write(encoding1);
			writer.write(encoding2); 
			writer.write(dto.getPdata());
			//writer.print(dto.getPdata());
			
			dto.setPdata(dto.getPno()+".jsp");
						
			System.out.println(filePath+"*****");
			System.out.println("sucess!!");
			
		}catch(IOException e){
			System.out.println("failed");
		}finally{
			writer.close();
		} 
		 
		request.setAttribute("dto", dto); 
		pageContext.forward("danim.do?command=savePath"); 
	%>	
	

</body>
</html>
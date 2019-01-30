package com.plan.moveFile;

import java.io.File;

public class moveFile {
	
    public String moveFile(String fileName, String beforeFilePath, String afterFilePath) {
    	 
        String path = afterFilePath;
        String filePath = path+"\\"+fileName+".png";
        
        System.out.println(filePath + ": 아니 안옮겨지냐고 경로");
        System.out.println(beforeFilePath + " : 비포파일페스");
 
        File dir = new File(path);
 
        try{
 
            File file =new File(beforeFilePath);
 
            if(file.renameTo(new File(filePath))){ //파일 이동
            	System.out.println("파일 이동 성공");
                return filePath; //성공시 성공 파일 경로 return
            }else{
                return null;
            }
 
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
 
    }

	
}

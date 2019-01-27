package com.map.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.dao.detailPlanDao;
import com.map.dao.planDao;
import com.map.dto.detailPlanDto;
import com.map.dto.planDto;

@WebServlet("/mapController")
public class mapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public mapController() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		detailPlanDao detaildao = new detailPlanDao();
		planDao plandao = new planDao();	
		
		HttpSession session = request.getSession();
			
		if(command.equals("insertdetailplan")) {
			String id = (String)session.getAttribute("sessionId"); 
			String[] daycnt = request.getParameterValues("daycnt");
			String[] timepickernow = request.getParameterValues("timepickernow");
			String[] selectedplace = request.getParameterValues("selectedplace");
			String[] sldate = request.getParameterValues("sldate");
			String[] planplace = request.getParameterValues("planplace");
			String[] mytitle = request.getParameterValues("mytitle");
						
			List<detailPlanDto> list = new ArrayList<detailPlanDto>();
			
			String firstday = sldate[0].replace("-", "");
			String lastday = sldate[sldate.length-1].replace("-", "");
			String title = mytitle[0];
			
			// plan insert
			planDto plandto = new planDto(null,title,firstday,lastday,"",id);			
			int planRes = plandao.insertPlan(plandto);		
			System.out.println("planinsert 결과 : " + planRes);
			
			String pno = plandao.selectPno(plandto);
			
			System.out.println("pno: " + pno);
			
			// detailplan insert
			for(int i = 0 ; i < daycnt.length ;i++) {
				// bikeRow를 가지고
				// db에 값을 저장하자.
				detailPlanDto dto = new detailPlanDto(
					Integer.parseInt(daycnt[i]),
					timepickernow[i],
					pno,
					selectedplace[i],
					"");
				list.add(dto);
			}			
			System.out.println("list 총 개수: "+list.size());			
			
			int detailPlanRes = detaildao.insertDetailPlan(list);
			System.out.println("저장된 갯수 : " + detailPlanRes);			
			
			jsResponse(response,"firstMap.jsp","일정저장 완료");
			
		} else if( command.equals("test")) {
			jsResponse(response,"location.href='firstMap.jsp'","test"); 
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doGet(request, response);
	}
	
	public void dispatch(HttpServletRequest request,HttpServletResponse response,String url) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	public void jsResponse(HttpServletResponse response,String url,String msg) throws IOException {
		String tmp = "<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
		PrintWriter out = response.getWriter();
		out.print(tmp);
	}

}

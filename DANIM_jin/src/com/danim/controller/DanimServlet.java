package com.danim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.json.simple.JSONObject;

import com.board.dao.BoardDao;
import com.board.dto.BoardDto;
import com.cmt.dao.BoardCmtdao;
import com.cmt.dto.BoardCmtDto;
import com.danim.dao.DanimDao;
import com.danim.dto.DanimDto;
import com.like.dao.LikeDao;
import com.like.dto.LikeDto;
import com.paging.Paging;
import com.pay.dao.payDao;
import com.pay.dto.payDto;
import com.plan.dao.planDao;
import com.plan.dto.planDto;
import com.plan.moveFile.moveFile;

import mail.sendMail;
import util.SHA256;
import util.random;


@WebServlet("/danimServlet")
public class DanimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DanimServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		sendMail SM= new sendMail();
		BoardDao dao=new BoardDao();
		DanimDao Ddao = new DanimDao();
		BoardCmtdao cmtdao = new BoardCmtdao();
		LikeDao likedao = new LikeDao();
		random random = new random();
		planDto Pdto = new planDto();
		planDao Pdao = new planDao(); 
		payDto payDto = new payDto();
		payDao payDao = new payDao();
		
		String command=request.getParameter("command");
		System.out.println("["+command+"]");
		
		
		
		
		HttpSession session = request.getSession();
		
		if(command.equals("main")) {
			List<BoardDto> list=dao.selectAll();
			request.setAttribute("list", list);
			dispatch(request,response,"main.jsp");
		}else if(command.equals("list")) {
			List<BoardDto> list=dao.selectAll();
			request.setAttribute("list", list);
			dispatch(request,response,"board.jsp");
		
		}else if(command.equals("join")) {
			String inName = request.getParameter("inName");
			String inId = request.getParameter("inId");
			String inPw = SHA256.getSHA256(request.getParameter("inPw"));
			String inEmail = request.getParameter("inEmail");
			String inPhone = request.getParameter("inPhone");
			String inAddr = request.getParameter("inAddr");
			
			DanimDto dto = new DanimDto(inId,inName,inPw,inAddr,inPhone,inEmail);
			
			int res = Ddao.join(dto);
			if(res>0) {
				String host = "http://localhost:8787/DANIM_jin/";
				String content= "다음 링크에 접속하여 이메일 확인을 진행하세요." +
						"<a href='" + host + "danim.do?command=emailCode&id=" + inId + "'>이메일 인증하기</a>";
				SM.sendEmail(inEmail, content);
				jsResponse(response, "afterJoin.jsp", "회원가입 성공");
			}else {
				jsResponse(response, "index.jsp", "회원가입 실패");
			}
			
		}else if(command.equals("findId")) {
			String email=request.getParameter("email");

			DanimDto dto=Ddao.findInfo(email);
			String id= dto.getId();
			System.out.println(id);
			request.setAttribute("dto", dto);
			dispatch(request, response, "issueId.jsp");
		
		}else if(command.equals("findPw")) {
			String email = request.getParameter("email");
			String id = request.getParameter("id");
			System.out.println("id : "+id);
			DanimDto dto=Ddao.login(id);
			if(dto==null) {
				jsResponse(response, "findInfo.jsp", "입력하신 정보가 없습니다.");
			}else {
				String pass= dto.getId();
				System.out.println("pass: "+pass);
				if(id.equals(pass)) {
				String newNum=random.excuteGenerate();
				String pw =SHA256.getSHA256(newNum); 
				int res =Ddao.updatePw(id, pw);
					if(res>0) {
						jsResponse(response, "issuePw.jsp" , "비밀번호 변경 성공");
						String content= "임시 비밀번호는 : "+ newNum;
						SM.sendEmail(email, content);
					}else {
						jsResponse(response, "findInfo.jsp", "비밀번호 변경 실패");
					}
				
				}else {
					jsResponse(response, "findInfo.jsp" , "입력하신 정보가 없습니다.");
				}
		
			}
		}else if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = SHA256.getSHA256(request.getParameter("pw"));
			System.out.println("id= "+id+ "/ pw= "+pw);
			
			DanimDto dto = Ddao.login(id);
			String pass = dto.getPw();
			PrintWriter out = response.getWriter();
			if(pw.equals(pass)) {
				// 로그인 성공
				System.out.println("로그인 성공");
				out.print("ok");
				
			}else {
				System.out.println("로그인 실패");
				out.print("no");
			}
		}else if(command.equals("snsLogin")){
			String id= request.getParameter("id");
			String name= request.getParameter("name");

			DanimDto dto = Ddao.login(id);
			if(dto==null) {
				System.out.println("와 없당");
				DanimDto newAccount = new DanimDto(id,name,"","","","");
				int res = Ddao.snsJoin(newAccount);

				if(res>0) {
					jsResponse(response, "danim.do?command=afterLogin&id="+id , "회원가입 성공");
				
				}else {
					jsResponse(response, "index.jsp", "회원가입 실패");
				}
			}else {
				jsResponse(response, "danim.do?command=afterLogin&id="+id , "로그인 성공");
			}
			
		}else  if(command.equals("afterLogin")) {
			  String id= request.getParameter("id");
		         DanimDto dto= Ddao.login(id);


		         if (dto.getGrade().equals("admin")) {
		             session.setAttribute("sessionId", id);
		             session.setMaxInactiveInterval(2*60*60);
		             dispatch(request, response, "danim.do?command=adminMain");
		          } else if (dto.getGrade().equals("general")) {
		             session.setAttribute("sessionId", id);
		             session.setMaxInactiveInterval(2*60*60);
		             dispatch(request, response, "danim.do?command=main");
		          }
		}else if(command.equals("logout")) {
			// 문제다!
			
			session.invalidate();
			jsResponse(response, "danim.do?command=main", "로그아웃하셨습니다.");
			
		}else if(command.equals("emailCode")) {
			String id= request.getParameter("id");
			
			DanimDto dto = Ddao.login(id);
			
			if(dto==null) {
				jsResponse(response, "danim.do?command=main", "잘못된 접근입니다.");
			}else {
				int res = Ddao.confirm(id);
				if(res>0) {
					jsResponse(response, "danim.do?command=afterLogin&id="+id , "이메일 인증 성공");
				
				}else {
					jsResponse(response, "index.jsp", "회원가입 실패");
				}
			}
			
		}else if(command.equals("idCheck")) {
			String inId = request.getParameter("inId");
			DanimDto res = Ddao.idCheck(inId);
			System.out.println(res);
			
			/*System.out.println(inId);
			System.out.println(res);*/
			
			PrintWriter out = response.getWriter();
			
			
			if(res!=null) {
				/*JSONObject obj = new JSONObject();
				obj.put("아이디:", inId);*/
				out.println("사용불가");
			}else {
				
				out.println("사용가능");
			}
			
		}else if(command.equals("saveText")) {
			/* 저장버튼을 누르면 처음 들어오는애 */
			String pno = request.getParameter("pno");
			String text = request.getParameter("text");
			String id = request.getParameter("id");
			
			/*pno = "1";*/
				
			Pdto.setPno(pno);
			Pdto.setPtitle(request.getParameter("ptitle"));
			Pdto.setPsdate(request.getParameter("psdate"));
			Pdto.setPldate(request.getParameter("pldate"));
			Pdto.setPdata("none-data");
			Pdto.setId(id);
			
			
			System.out.println(Pdto.getPno()+":"+Pdto.getPtitle()+":"+Pdto.getPsdate()+":"+Pdto.getPldate()+":"+Pdto.getPdata()+":"+Pdto.getId());
	
			int tempDto = 0;
			
			System.out.println(pno.getClass().getName());
			
			
			/* 저장이 안되어 있을 경우 db저장시키기 */
			if(pno == null || pno.equals(null) || pno.equals("")) {
				/* 아무것도 안나옴  - 저장합시다*/
				System.out.println("아무것도 없을때 사용하는 if문으로 들어옴1");
				
				Pdto.setPno(Integer.toString(Pdao.setPno()));
				
				int res = Pdao.insert(Pdto);
				
				System.out.println("::insert가 됨 값은 : " +res);
				
				if(res > 0) {
					System.out.println("성공적으로 저장");
					Pdto.setPdata(text);
				}else {
					System.out.println("안됨");
				}
			}else {
				System.out.println("else로 들어옴");
				tempDto = Pdao.checkPno(id, pno);
				System.out.println("tempDto는 : "+tempDto);
				if(tempDto != 1) {
					/* 아무것도 안나옴  - 저장합시다*/
					System.out.println("아무것도 없을때 사용하는 if문으로 들어옴");
					
					Pdto.setPno(Integer.toString(Pdao.setPno()));
					
					int res = Pdao.insert(Pdto);
					
					System.out.println("::insert가 됨 값은 : " +res);
					
					if(res > 0) {
						System.out.println("성공적으로 저장");
						Pdto.setPdata(text);
					}else {
						System.out.println("안됨");
					}
				}else {
					Pdto.setPno(pno);
					Pdto.setPdata(text);
				}
			}		
			
			request.setAttribute("dto", Pdto);
			System.out.println("여기까진 옴");
			dispatch(request, response, "tempOption.jsp");
			
		}else if(command.equals("savePath")) {
			Pdto = (planDto)request.getAttribute("dto");
			System.out.println(Pdto.getPno());
			
			int res = Pdao.saveText(Pdto);
			Pdto = Pdao.selectOne(Pdto.getPno());
			
			if(res >0) {
				System.out.println("success!" + Pdto.getPno());
				request.setAttribute("pno", Pdto.getPno());
				//id가 아니라 pno를 보내야함 
				dispatch(request, response, "planner.jsp");
			}else {
				System.out.println("false");
			}			
		}else if(command.equals("getText")) {
			String pno = (String)request.getParameter("pno");			
			System.out.println(pno);
			Pdto = Pdao.selectOne(pno);
			System.out.println(Pdto);
			
			String re = Pdto.getPdata();
			PrintWriter out = response.getWriter();
			out.println(re);
		}else if(command.equals("pwchk")) {
			String id = request.getParameter("id");
			String pw = SHA256.getSHA256(request.getParameter("pw"));
			System.out.println("id= "+id+ "/ pw= "+pw);
			
			DanimDto dto = Ddao.login(id);
			String pass = dto.getPw();
			String sns = dto.getSns();
			if(sns=="sns"||sns.equals("sns")) {
				jsResponse(response, "myPage.jsp" , "sns 가입자들은 이용하실 필요가 없습니다.");
			}else {
				if(pw.equals(pass)) {
					jsResponse(response, "danim.do?command=goMyInfo&id="+id , "맞네");
				
				}else {
					jsResponse(response, "myPage.jsp" , "엥 틀렸네");
				}
			}
		}else if(command.equals("goMyInfo")) {
			String id = request.getParameter("id");
			
			DanimDto dto = Ddao.login(id);
			request.setAttribute("dto", dto);
			dispatch(request, response, "myInfo.jsp");
			
		}else if(command.equals("changeInfo")) {
			String name = request.getParameter("inName");
			String id = request.getParameter("inId");
			String pw = request.getParameter("inPw");
			String email = request.getParameter("inEmail");
			String phone = request.getParameter("inPhone");
			String addr = request.getParameter("inAddr");
			
			System.out.println(id+"/"+pw+"/"+name+"/"+email+"/"+phone+"/"+addr);
	
			int res = Ddao.changeInfo(id,pw,name,email,phone,addr);
			if(res>0) {
				
				jsResponse(response, "myPage.jsp", "개인정보 변경 성공");
			}else {
				jsResponse(response, "index.jsp", "개인정보 변경 실패");
			}
			
		}else if(command.equals("confirmchk")) {
			String id =(String)session.getAttribute("sessionId");
			DanimDto dto = Ddao.login(id);
			String confirm = dto.getConfirm();
			PrintWriter out = response.getWriter();
			System.out.println(confirm);
			if(confirm.equals("Y")) {
			
					out.print("Y");
					
				}else {
					
					out.print("N");
				}
			
			
		}else if(command.equals("review")) {
			//int total=dao.countAll();
			int curpage=Integer.parseInt(request.getParameter("page"))==1?1:Integer.parseInt(request.getParameter("page"));
			List<BoardDto> pagelist=new ArrayList<BoardDto>();
			
			System.out.println("클릭한 페이지 : " +curpage);
			
			Paging paging=new Paging();
			
			paging.setCurPageNum(curpage);
			paging.makeBlock(curpage);
			paging.makeLastPageNum();
			// 위에 걸로 다시 계산 
			int blockLastNum=paging.getBlockStartNum();
			int blockStartNum=paging.getBlockLastNum();
			int lastPageNum=paging.getLastPageNum();
			
			request.setAttribute("curPageNum", curpage);
			request.setAttribute("blockStartNum", blockStartNum);
			request.setAttribute("blockLastNum", blockLastNum);
			request.setAttribute("lastPageNum", lastPageNum);
			request.setAttribute("paging", paging);	
			
			pagelist=dao.getPaging(paging);
			
			request.setAttribute("pagelist", pagelist);
			dispatch(request,response,"board.jsp");
			
		}else if(command.equals("insert")) {
			dispatch(request,response,"write.jsp");
		}else if(command.equals("insertres")) {
			
			String id=request.getParameter("id");
			System.out.println("id : " + id);
			String title=request.getParameter("title");
			System.out.println("title1 : " + title);
			String content=request.getParameter("content");
			
			BoardDto dto=new BoardDto();
			// 좋아요개수&filename 해결해야함
			dto.setId(id);
			dto.setTitle(title);
			dto.setLikenum(0);
			dto.setViewcount(0);
			dto.setFilename("fname");
			dto.setContent(content);
			// insert dao 만들어야함!!! 매퍼도 수정
			int res=dao.insert(dto);
			
			
			if(res>0) {
				jsResponse(response,"danim.do?command=review&page=1","추가성공");
			}else {
				jsResponse(response,"danim.do?command=review&page=1","추가실패");
			}
			
			
		} else if(command.equals("boarddetail")) {
			String boardno = request.getParameter("boardno");
			request.setAttribute("boardno", boardno);
			dispatch(request, response, "boarddetail.jsp");
			
		} else if(command.equals("insertCmt")) {
			String id = request.getParameter("id");
			String cmt = request.getParameter("cmt");
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			System.out.println(id+cmt+boardno);
			
			BoardCmtDto dto = new BoardCmtDto();
			dto.setCmt(cmt);
			dto.setBoardno(boardno);
			dto.setId(id);
			
			int res = cmtdao.insertCmt(dto);
			
			if(res > 0) {
				dispatch(request, response, "danim.do?command=boarddetail&boardno="+boardno);
			} else {
				System.out.println("false");
			}
			
		} else if(command.equals("deleteCmt")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			int cmtno = Integer.parseInt(request.getParameter("cmtno"));
			System.out.println(cmtno+" 코멘트 삭제");
			
			int res = cmtdao.deleteCmt(cmtno);
			
			if(res > 0) {
				dispatch(request, response, "danim.do?command=boarddetail&boardno="+boardno);
			} else {
				System.out.println("false");
			}
		}else if(command.equals("myHistory")) {
			String id = request.getParameter("id");
			
			List<BoardDto> list=dao.idList(id);

			request.setAttribute("list", list);
			dispatch(request,response,"myHistory.jsp");
		}else if(command.equals("payHistory")) {
			String id = request.getParameter("id");
			
			List<BoardDto> list=payDao.payList(id);

			request.setAttribute("list", list);
			dispatch(request,response,"payHistory.jsp");
		}else if(command.equals("muldel")) {
			String[] array = request.getParameterValues("chk");
			System.out.println(Arrays.toString(array));
			String id = request.getParameter("id");
			
			int res = dao.multiDelete(array);
			if(res > 0) {
				jsResponse(response, "danim.do?command=myHistory&id="+id, "삭제 성공");
			} else {
				System.out.println("false");
			}
		}else if(command.equals("like")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			String id = request.getParameter("id");
			
			LikeDto dto = new LikeDto(id, boardno);
			
			int isLiked = likedao.isLiked(dto);
			
			JSONObject obj = new JSONObject();
			
			if(isLiked != 0) {
				int res = likedao.deleteLike(dto);
				
				BoardDto likenumdto = dao.selectOne(boardno);
				int likenum = likenumdto.getLikenum();
				
				if(res > 0) {
					obj.put("msg", "unlike");
					obj.put("likenum", likenum);
					response.getWriter().print(obj.toJSONString());
//					response.getWriter().print("{'msg' : 'unlike'}");
				} else {
					System.out.println("like 실패");
				}
			} else {
				int res = likedao.insertLike(dto);
				
				BoardDto likenumdto = dao.selectOne(boardno);
				int likenum = likenumdto.getLikenum();
				
				if(res > 0) {
					obj.put("msg", "like");
					obj.put("likenum", likenum);
					response.getWriter().print(obj.toJSONString());
//					response.getWriter().print("like");
				} else {
					System.out.println("unlike 실패");
				}
			}
		}else if(command.equals("payUser")) {
			String id = request.getParameter("user");			
			
			DanimDto dto = Ddao.login(id);
			
			String email = dto.getEmail();
			String name = dto.getName();
			String phone = dto.getPhone();
			String addr = dto.getAddr();
			
			JSONObject obj = new JSONObject();
			obj.put("email", email);
			obj.put("name", name);
			obj.put("phone", phone);
			obj.put("addr", addr);
			
			PrintWriter out = response.getWriter();
			out.println(obj.toJSONString());
		}else if(command.equals("paySuccess")){
			
			String paynum = request.getParameter("paynum");
			int paymoney = Integer.parseInt(request.getParameter("paymoney"));
			String id = request.getParameter("id");
			
			System.out.println(paynum);
			System.out.println(paymoney);
			System.out.println(id);
			
			payDto dto = new payDto(paynum,id,paymoney);
			payDao PLdao = new payDao();
			int res = PLdao.payInsert(dto);
			
			if(res > 0) {
				jsResponse(response, "lastPage.jsp", "완료");
			} else {
				System.out.println("false");
			}

		
		}else if(command.equals("adminMain")) {

	         List<DanimDto> list=Ddao.adminMain();
	         request.setAttribute("list", list);
	         dispatch(request, response, "adminMain.jsp");

	    }else if(command.equals("updateUserForm")) {
	    	String id= request.getParameter("chk");
	    	System.out.println(id);
	    	DanimDto dto = Ddao.login(id);
		    request.setAttribute("dto", dto);
		    dispatch(request, response, "updateUser.jsp");

		}else if(command.equals("updateUser")) {
	    	String id= request.getParameter("id");
	    	String grade= request.getParameter("grade");
	    	String yn= request.getParameter("yn");
	    	
	    	System.out.println("id:"+id+"/grade:"+grade+"/yn:"+yn);
	    	
	    	int res = Ddao.manageUser(id,grade,yn);
			if(res>0) {
				
				jsResponse(response, "danim.do?command=adminMain", "회원정보 변경 성공");
			}else {
				jsResponse(response, "danim.do?command=adminMain", "회원정보 변경 실패");
			}
	    	

		}else if(command.equals("saveText")) {
	         /* 저장버튼을 누르면 처음 들어오는애 */
	         String pno = request.getParameter("pno");
	         String text = request.getParameter("text");
	         String id = request.getParameter("id");
	         
	         /*pno = "1";*/
	            
	         Pdto.setPno(pno);
	         Pdto.setPtitle(request.getParameter("ptitle"));
	         Pdto.setPsdate(request.getParameter("psdate"));
	         Pdto.setPldate(request.getParameter("pldate"));
	         Pdto.setPdata("none-data");
	         Pdto.setPimage("none-date");
	         Pdto.setId(id);
	         
	         
	         System.out.println(Pdto.getPno()+":"+Pdto.getPtitle()+":"+Pdto.getPsdate()+":"+Pdto.getPldate()+":"+Pdto.getPdata()+":"+Pdto.getId());
	   
	         int tempDto = 0;
	         
	         System.out.println(pno.getClass().getName());
	         
	         
	         /*이미지 옮기는 작업*/
	         
	         moveFile mvfile = new moveFile();
	         System.out.println(request.getParameter("pimage"));
	         mvfile.moveFile(request.getParameter("pimage"),"C:\\Users\\user2\\Downloads\\"+request.getParameter("pimage")+".png", "C:\\workspace_semiProject\\Danim_190125\\WebContent\\sav");
	         
	         Pdto.setPimage(request.getParameter("pimage")+".png");
	         
	         /* 저장이 안되어 있을 경우 db저장시키기 */
	         if(pno == null || pno.equals(null) || pno.equals("")) {
	            /* 아무것도 안나옴  - 저장합시다*/
	            System.out.println("아무것도 없을때 사용하는 if문으로 들어옴");
	            
	            Pdto.setPno(Integer.toString(Pdao.setPno()));
	            
	            int res = Pdao.insert(Pdto);
	            
	            System.out.println("::insert가 됨 값은 : " +res);
	            
	            if(res > 0) {
	               System.out.println("성공적으로 저장");
	               Pdto.setPdata(text);
	            }else {
	               System.out.println("안됨");
	            }
	         }else {
	            System.out.println("else로 들어옴");
	            tempDto = Pdao.checkPno(id, pno);
	            System.out.println("tempDto는 : "+tempDto);
	            if(tempDto != 1) {
	               /* 아무것도 안나옴  - 저장합시다*/
	               System.out.println("아무것도 없을때 사용하는 if문으로 들어옴2");
	               
	               Pdto.setPno(Integer.toString(Pdao.setPno()));
	               
	               int res = Pdao.insert(Pdto);
	               
	               System.out.println("::insert가 됨 값은 : " +res);
	               
	               if(res > 0) {
	                  System.out.println("성공적으로 저장");
	                  Pdto.setPdata(text);
	               }else {
	                  System.out.println("안됨");
	               }
	            }else {
	               Pdto.setPno(pno);
	               Pdto.setPdata(text);
	            }
	         }      
	         
	         request.setAttribute("dto", Pdto);
	         System.out.println("여기까진 옴");
	         dispatch(request, response, "tempOption.jsp");
	         
	      }

		
	}

	
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatch=request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String tmp = "<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(tmp);
	}
	
	
}



















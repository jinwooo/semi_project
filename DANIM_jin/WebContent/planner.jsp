<%@page import="java.util.HashMap"%>
<%@page import="com.plan.dto.planDto"%>
<%@page import="java.util.List"%>
<%@page import="com.plan.dao.planDao"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">
html, body {
	padding: 0;
	margin: 0;
	overflow: hidden;
}

body {
	background: gray;
	width: 100%;
	height: 100%;
}

#body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}

/* 상단 메뉴 */
#topmenu {
	background: white;
	width: 100%;
	height: 49px;
	position: fixed;
	padding: 0;
	margin: 0;
	border-bottom: 1px solid #ccc;
	min-width: 650px;
}

#topmenu .topmenu_wrapper {
	top: 10px;
	right: 15px;
	left: 15px;
	position: absolute;
}

#topmenu .topmenu_wrapper .planSelect {
	float: left;
}

#topmenu .topmenu_wrapper .menu {
	text-align: right;
}

/* side menu bar */
#sidemenu {
	all: unset;
	background: white;
	top: 50px;
	width: 246px;
	height: 100%;
	position: fixed;
	padding: 2px;
	margin: 0;
	overflow: auto;
}

#sidemenu .accordion>div {
	padding: 5px;
	text-align: center;
}

#sidemenu .accordion>h3 {
	border: 1px solid #eee;
	font-size: 10pt;
	font-weight: bold;
}

#sidemenu .accordion>.ui-state-active {
	background: rgb(200, 160, 220);
}

#sidemenu .accordion>div .draggable {
	border: 1px solid lightgray;
	cursor: move;
}

#sidemenu .accordion>div input[type=submit] {
	margin: 0;
	margin-top: 10px;
}

/* editor */
#editor {
	top: 50px;
	left: 250px;
	right: 0;
	bottom: 0;
	background-color: #eee;
	padding: 0;
	position: fixed;
	overflow: auto;
}

#editor .wrapper {
	width: 100%;
	height: 100%;
	position: absolute;
	bottom: 0px;
	min-width: 1200px;
}

#editor .wrapper .prev {
	top: 40%;
	left: 2%;
	position: absolute;
	font-size: 50px;
}

#editor .wrapper .next {
	top: 40%;
	right: 2%;
	position: absolute;
	font-size: 50px;
}

#editor .wrapper .prev, #editor .wrapper .next {
	cursor: pointer;
	color: rgb(200, 160, 220);
}

#editor .wrapper .canvas {
	top: 10%;
	margin-bottom: 5%;
	left: 50%;
	margin-left: -500px;
	position: absolute;
	border: 1px solid #aaa;
}

#editor .wrapper .canvas .display {
	display: none;
}

#editor .wrapper .canvas .display .inputText {
	background: none;
	border: 0;
	outline: none;
}

#editor .wrapper .canvas .display .inputText:focus {
	background: white;
}

#editor .wrapper .canvas .display.selected {
	display: block;
}

#editor .wrapper .canvas .display .view {
	width: 1000px;
	height: 700px;
	background: white;
	overflow: hidden;
}

#editor .wrapper .canvas .page {
	position: absolute;
	bottom: -50px;
	left: 45%;
	color: rgb(200, 160, 220);
}

/* content */
#editor .wrapper .canvas .view .droppable {
	width: 500px;
	height: 175px;
	float: left;
	cursor: move;
}

.placeholder {
	width: 500px;
	height: 175px;
	background-color: #ffeedd;
	float: left;
}

#editor .wrapper .canvas .view .droppable .contentholder {
	width: 500px;
	height: 175px;
	background-image: url(image/placeholder.png);
}

.ui-droppable.drophover {
	opacity: 0.3;
}

/* button */
.btn {
	all: unset;
	width: 85px;
	height: 30px;
	margin-left: 5px;
	background-color: rgb(200, 160, 220);
	border-radius: 7px;
	color: white;
	font-size: 10pt;
	text-align: center;
	cursor: pointer;
}

.contentDel {
	all: unset;
	display: none;
	width: 50px;
	height: 50px;
	top: -55px;
	position: relative;
	left: 5px;
	border-radius: 50px;
	background-color: rgb(200, 160, 220);
	color: white;
	font-size: 10pt;
	text-align: center;
	cursor: pointer;
}

.contentOtherDel {
	all: unset;
	display: none;
	width: 20px;
	height: 20px;
	border-radius: 15px;
	background-color: rgb(200, 160, 220);
	color: white;
	font-size: 11pt;
	font-weight: bold;
	text-align: center;
	cursor: pointer;
	position: absolute;
	top: -10px;
	right: -10px;
	line-height: 0.5;
}

.textMove {
	top: 0px;
	left: -40px;
	padding: 5px;
	width: 30px;
	height: 30px;
	color: rgb(200, 160, 220);
	border: 1px solid rgb(200, 160, 220);
	border-radius: 30px;
	background: white;
	position: absolute;
	font-size: 10pt;
	line-height: 2.3;
	text-align: center;
	cursor: move;
	opacity: 0.8;
	display: none;
}
</style>

<%
	int dpsq = 3;
	String dptime = "10시";
	String dploc = "부산";
	String dpcont = "해운대물놀이";
%>


<script src="js/html2canvas.min.js"></script>
<script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
<%
	String user = (String)session.getAttribute("sessionId"); //dto로 받아와야함
	// String id = "aaa"; 
	planDao dao = new planDao();
	List<planDto> listDto = dao.selectList(user);
%>
	var pno = "";
   $(function() {
		$("#selDiary").empty();
		<%		
		if(listDto.equals(null)||listDto==null||listDto.size() == 0){
		%>
		$("#selDiary").append("<option value=" + 0 + ">" + "여행정보가 없습니다" + "</option>" );		
		<%
		}else{
			Map<String,planDto> map = new HashMap<String,planDto>();
			for(planDto dto : listDto){
				map.put(dto.getPno(), dto);
			}
			for(Map.Entry<String,planDto> cnt : map.entrySet()){
		%>
		  		$("#selDiary").append("<option value=" + "<%=cnt.getKey() %>" + ">" + "<%=cnt.getValue().getPtitle() %>" + "</option>" );
	
		<%
			}
		}
		%> 
	  
		$(".accordion").accordion({
			heightStyle: "content",
			collapsible: true,
			active: true
		});
      
      $(document).on("mouseenter", ".view", function() { 
    	  $(this).sortable({
    	         placeholder: 'placeholder'
          });
      });
            
      $("#editor .wrapper .canvas").disableSelection(); //이 부분은 반드시 필요한 부분은 아닌데, 아이템 내부의 글자를 드래그 해서 선택하지 못하도록 하는 기능 입니다.
      
		$(document).on("mouseenter", ".draggable", function() {
			$(".droppable").droppable({
				accept: ".draggable",		// draggable만 drop
				tolerance: "intersect",		// 50%이상 겹치면 drop가능
				hoverClass: "drophover",	// css를 통해 해당 element위에 올라와있을때 변화시킴
				drop: function(ev, ui) {
					if($(this).find(".contentholder").length > 0){
						$(this).find(".contentholder").remove();
						
						if($(ui.draggable).clone().find("img")) {
							$(this).append($(ui.draggable).clone().find("img").attr({width: 500, height: 175}))
						}
						
						$(this).append("<button class='contentDel'>삭제</button>");
					}
				}
			})
		})
		
		
		$(document).on("mouseenter", ".draggableOther", function() {
			$(".view").droppable({
				accept: ".draggableOther",		// draggable만 drop
				tolerance: "pointer",		// 50%이상 겹치면 drop가능
				hoverClass: "drophover",	// css를 통해 해당 element위에 올라와있을때 변화시킴
				drop: function(ev, ui) {
					
					if($(ui.draggable).clone().is(".draggableOther.text")){
						$(this).prepend($(ui.draggable).clone().attr({"class":"draggableincanvas"}).css({"position" : "absolute"}).html("<textarea class='inputText'>글상자</textarea>").append("<button class='contentOtherDel'>x</button><span class='textMove'>이동</span>"))
						
					} else if($(ui.draggable).clone().is(".draggableOther.sticker")){
						$(this).prepend($(ui.draggable).clone().attr({"class":"draggableincanvas"}).css({"position" : "absolute"}).append("<button class='contentOtherDel'>x</button>")).find("img").attr("class","inputSticker")
					}
				}
			})
		})
		
		$(document).on("mouseenter", ".draggableincanvas", function() {
			$(this).hover(function() {
				$(this).children().children(".inputText").parent().css({"border":"1.5px dashed rgb(200, 160, 220)","background":"white"})
				$(this).find(".contentOtherDel").css("display","inline-block")
				$(this).find(".textMove").css("display","inline-block")
			   
			}, function () {
				$(this).children().children(".inputText").parent().css({"border":"","background":""})
				$(this).find(".contentOtherDel").css("display","none")
				$(this).find(".textMove").css("display","none")
				  
			});
			$(this).draggable({
				appendTo: "body",
				refreshPositions: true,
				scroll: false,
			});
			
			$(this).children().eq(0).resizable();
		})
		
		$(".draggableOther").draggable({
			appendTo: "body",
			helper: "clone",
			scroll: false
		})
		
      $(".draggable").draggable({
         appendTo: "body",
         refreshPositions: true,
         helper: "clone",
         scroll: false
      })
      
      
      // 297 210
       $("#pdfdown").click(function() { //   $("#pdfdown").click((e) => {
//          if($(".contentholder").length > 0){
//             alert("빈 칸을 모두 채워주세요")
//          } else {
//          }
			alert("결제를 진행해주세요.");
			 
			 $.ajax({
			      url:"danim.do?command=payUser&user=<%=user%>",   
			            // data : data를 주겠다
			              // data를 받겠다
			      dataType:"json",     
			      success:function(msg){
			      	
						var IMP = window.IMP; // 생략가능
						IMP.init('imp04249110'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
						IMP.request_pay({
						    pg : 'nice', // version 1.1.0부터 지원. 나이스정보통신으로 결제이용
						    pay_method : 'card', //카드로 이용
						    merchant_uid : 'merchant_' + new Date().getTime(),
						    name : '주문명:PDF파일생성 및 다운로드',	//제품명
						    amount : 1000,        //금액설정
						    buyer_email : msg.email,  //구매자 이메일
						    buyer_name : msg.name,			//구매자 이름
						    buyer_tel : msg.phone,	//구매자 연락처
						    buyer_addr : msg.addr,	//구매자 주소
						    buyer_postcode : '',		//구매자 우편번호
						    /* m_redirect_url : 'planner.jsp' //결제한뒤에 이동할 위치 */
						}, function(rsp) {
						    if ( rsp.success ) {
						        var msg = '결제가 완료되었습니다. PDF생성 및 다운로드가 시작됩니다.';
								alert(msg);
														        
/* 						        msg += '고유ID : ' + rsp.imp_uid;
						        msg += '상점 거래ID : ' + rsp.merchant_uid;
						        msg += '결제 금액 : ' + rsp.paid_amount;
						        msg += '카드 승인번호 : ' + rsp.apply_num;
 */						        
						        PDFsave();
 								
 								
 								/* 실행 5초 지연 */
 								setTimeout(() => {
 								location.href="danim.do?command=paySuccess&paynum="+rsp.apply_num+"&paymoney="+rsp.paid_amount+"&id=<%=user%>"
								}, 5000);
						           
 										
						    } else {
						        var msg = '결제에 실패하였습니다.';
						        msg += '에러내용 : ' + rsp.error_msg;
						    }
						});
			         
			      },
			      error:function(){
			         alert("실패;;");
			      }
			   });
			 
		$("#picUpload").submit(function() {
			
			
		});
	
	})
      
		$(document).on("mouseenter", ".view > .droppable", function() {
			
			if($(this).children().is("img")){
			   $(this).hover(function() {
				   $(this).find(".contentDel").css("display","inline-block")
				   $(this).children().css({"border":"2px dashed rgb(200, 160, 220)"}).attr({"width":496,"height":171})
				}, function () {
			 	  $(this).find(".contentDel").css("display","none")
			 	  $(this).children().css({"border":""}).attr({"width":500,"height":175})
			 	})
			}
		 	  
		});
      
		$(document).on("click", ".contentDel", function() {
			   $(this).parent().append("<div class='contentholder'></div>")
			   $(this).parent().find("img").remove()
			   $(this).parent().find(".contentDel").remove()
		});
		
		
		$(document).on("click", ".contentOtherDel", function() {
			   $(this).parent().remove()
		});
		
      
      
     <%
		planDto pdto = new planDto();
      	pdto.setPtitle("sample_Ptitle");
      	pdto.setPsdate("sample_psdate");
      	pdto.setPldate("sample_pldata");
      %>      
      
      /* 2. [임시저장] 버튼을 선택하는 경우
      2.1 현재 사용하고 있는 아이디와 여행번호, 파일 제목, 저장해야할 텍스트를 servlet에 보낸다.
      2.2 해당 아이디에 중에서 여행번호에 해당하는 정보가 있는지 확인한다.
        2.2.1 해당 번호가 없으면 새로 정보를 새로 넣는다.
      2.3 해당 번호가 있으면 기존에 있던 정보에 넣는다.
      2.4 해당 번호를 planner.jsp 파일에 보내준다.  */
       
      $("#planSave").click(function(){
			$(".display").css("display","block");
    		 var element = $(".canvas")[0];
             html2canvas(element).then(function(canvas){
             	 	
             	var imgData = canvas.toDataURL();
            	fileName = setPno();
             	downloadURI(imgData,fileName);
              	
             });	  
         
         
		var ptitle = "";
		ptitle = prompt("제목을 입력하세요","");
		
		fileName = setPno();
		
		$.ajax({
 			url : "danimServlet",
 			type : "POST",
 			data : {
 				command : "saveText",
 				id : "<%=user %>",
 				pno : pno,
 				text : delSpace($("#openFile").html()),
 				ptitle : ptitle,
 				psdate : "<%=pdto.getPsdate() %>",
 				pldate : "<%=pdto.getPldate() %>",
 				pimage : fileName
 			}
 		});	     
		$(".display").removeAttr("style")
      }); 
      
/* 저장된 파일을 불러오는 함수 */
      $(function(){
        	$("#planSelect").click(function(){
        		var titleno = $("#selDiary option:selected").val();
        		pno = titleno;
  			$.ajax({
  				url:"danimServlet",
  				type : "POST",
  				data: {command : "getText", pno: titleno},
  				success : function(data){
  					$("#openFile").empty();
  					$("#openFile").load("sav/"+data);
  				}
  			}) .fail (function() {
                  alert('failure');
  			});
        	});
        	
        });
  });
      
   function setPno(){
	   return <%=dao.setPno() %>
   }
 
   function downloadURI(uri, name) {
	    var link = document.createElement("a");
	    link.download = name;
	    link.href = uri;
	    document.body.appendChild(link);
	    link.click();
   }    
   
   
   function prevPage() {
      if(!$(".display.selected").prev(".display").length==0){
         $(".display.selected").attr("class","display").prev(".display").attr("class","display selected");
      }
   }
   
   function nextPage() {
      if(!$(".display.selected").next(".display").length==0){
         $(".display.selected").attr("class","display").next(".display").attr("class","display selected")
      }
   }
   
   function delSpace(text){
		var res = text.replace(/\t/g,'');
		
		res = res.replace(/\s+/, "");//왼쪽 공백제거
		res = res.replace(/\s+$/g, "");//오른쪽 공백제거
		res = res.replace(/\n/g, "");//행바꿈제거
		res = res.replace(/\r/g, "");//엔터제거
		return res;
	}
   function PDFsave() {
		
       $(".display").css({"display":"block","padding":"53px 70px 53px 70px"});
       $(".canvas").css("border","0");
       
		for(var i = 0; i < <%=dpsq %>; i++){
			$(document).find(".display").eq(i).find(".inputText").parent().css({"top":(753*i)+(53*(i+1)),"left":70,"position":"absolute"});
			$(document).find(".display").eq(i).find(".inputSticker").parent().css({"top":(753*i)+(53*(i+1)),"left":70,"position":"absolute"});
		}
       
       html2canvas(document.querySelector(".canvas")).then(canvas => {
             
          var imgData = canvas.toDataURL('image/png');
                      
           var imgWidth = 297;    // 이미지 가로 길이(mm) A4 기준
           var pageHeight = 210;   // 출력 페이지 가로 길이 계산 A4 기준   
           var imgHeight = canvas.height * imgWidth / canvas.width;
           var heightLeft = imgHeight;
          
           var doc = new jsPDF('l', 'mm', 'a4');
           var position = 0;
           
           doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
          heightLeft -= pageHeight;
           
          while(heightLeft >= 0){
             position = heightLeft - imgHeight;
             doc.addPage();
             doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
             heightLeft -= pageHeight;
          }
          doc.save('<%=user+"의 여행"%>'); 
          $(".display").removeAttr("style");
          $(".inputText").parent().removeAttr("style");
          $(".inputSticker").parent().removeAttr("style");
          $(".canvas").removeAttr("style");
       })
	}
</script>

</head>

<body>
	<%--   <jsp:include page="./form/header.jsp"></jsp:include> --%>
	<div id="body">
		<div id="topmenu">
			<div class="topmenu_wrapper">
				<div class="planSelect">
					<select id="selDiary"
						style="width: 200px; height: 30px; color: rgb(200, 160, 220); font-weight: bold;">
						<option selected disabled style="display: none;">여행불러오기</option>
						<option>2019.01.11 부산</option>
						<option>2019.02.01 제주</option>
					</select> <input type="button" value="선택" id="planSelect" class="btn"
						style="width: 55px;">
				</div>

				<div class="menu">
					<input type="button" value="메인으로" class="btn"> <input
						type="button" value="임시저장" id="planSave" class="btn"> <input
						type="button" value="PDF 저장" id="pdfdown" class="btn">
				</div>
			</div>
		</div>
		<div id="sidemenu">
			<div class="accordion">
				<h3>여행경로</h3>
				<div>
					<div class="draggable">
						<img style="background: white;" width="200px" height="100px"
							src="image/DotGrid.png">
					</div>
				</div>
				<h3>날짜</h3>
				<div></div>
				<h3>비용</h3>
				<div></div>
				<h3>리뷰</h3>
				<div></div>
				<h3>일기메모</h3>
				<div></div>
				<h3>표지</h3>
				<div></div>
				<h3>사진</h3>
				<div>
					<form id="picUpload" action="danim.do?" method="post"
						enctype="multipart/form-data">
						<input type="file" name="file" id="myFile"
							accept=".jpg, .jpeg, .png" style="width: 220px;"> <input
							type="submit" class="btn" value="업로드">
					</form>

				</div>
				<h3>글상자</h3>
				<div>
					<div class="draggableOther text">
						<img src="image/text.png" width="100px" height="100px">
					</div>
				</div>
				<h3>스티커</h3>
				<div>
					<div class="draggableOther sticker">
						<img src="image/like.png" width="100px" height="100px">
					</div>
				</div>
			</div>
		</div>

		<div id="editor">
			<div class="wrapper">
				<div class="prev">
					<p onclick="prevPage()">◀</p>
				</div>

				<div class="canvas" id="openFile">

					<%
            for(int i = 1; i <= dpsq; i++){
%>
					<div class="display <%=i==1?"selected":"" %>">
						<div class="view">
							<div class="droppable">
								<div class="contentholder"></div>
							</div>
							<div class="droppable">
								<div class="contentholder"></div>
							</div>
							<div class="droppable">
								<div class="contentholder"></div>
							</div>
							<div class="droppable">
								<div class="contentholder"></div>
							</div>
							<div class="droppable">
								<div class="contentholder"></div>
							</div>
							<div class="droppable">
								<div class="contentholder"></div>
							</div>
							<div class="droppable">
								<div class="contentholder"></div>
							</div>
							<div class="droppable">
								<div class="contentholder"></div>
							</div>
							<div class="page">
								<span style="cursor: pointer;" onclick="prevPage()">◀</span>
								<%= i + " / " + dpsq %>
								PAGE <span style="cursor: pointer;" onclick="nextPage()">▶</span>
							</div>
						</div>
					</div>
					<%
            }
%>
				</div>



				<div class="next">
					<p onclick="nextPage()">▶</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
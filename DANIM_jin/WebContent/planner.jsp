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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
   html, body { padding: 0; margin: 0; overflow: hidden; }
   
   body { background: gray; width: 100%; height: 100%;   }
   
   #body { padding: 0; margin: 0; width: 100%; height: 100%; }
   
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
   
   #topmenu .topmenu_wrapper .planSelect { float: left; }
   
   #topmenu .topmenu_wrapper .menu { text-align: right; }
   
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
		
	#sidemenu .accordion > div{
		padding: 5px;
		text-align: center;
	}
		
	#sidemenu .accordion > h3{
		border: 1px solid #eee;
	    font-size: 10pt;
	    font-weight: bold;
	}
	
	#sidemenu .accordion > .ui-state-active {
		background: rgb(200, 160, 220);
	}
	
	#sidemenu .accordion > div .draggable{
		border: 1px solid lightgray;
		cursor: move;
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
   
   #editor .wrapper .prev{
      top: 40%;
      left: 2%;
      position: absolute;
      font-size: 50px;
   }
   
   #editor .wrapper .next{
      top: 40%;
      right: 2%;
      position: absolute;
      font-size: 50px;
   }
   
   #editor .wrapper .prev, #editor .wrapper .next{
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
   
   #editor .wrapper .canvas .display{
      display: none;
   }
   
   #editor .wrapper .canvas .display.selected{
      display: block;
   }

   #editor .wrapper .canvas .display .view {
      width: 1000px;
      height: 700px;
      background: white;
      overflow: hidden;
   }
   
   #editor .wrapper .canvas .page{
      position: absolute;
      bottom: -50px;
      left: 45%; 
      color: rgb(200, 160, 220);
   }
   
   
   /* content */
   #editor .wrapper .canvas .view .droppable{
      width: 500px;
      height: 175px;
      float: left;
      cursor: move;
   }
   
   .placeholder{
      width: 500px;
      height: 175px;
      background-color: #ffeedd;
      float: left;
   }
   
   #editor .wrapper .canvas .view .droppable .contentholder{
      width: 500px;
      height: 175px;
      background-image: url(image/placeholder.png);
   }
   
   .ui-droppable.drophover{
      opacity: 0.3;
   }
   
   .contentDel{
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
   
   
</style>

<%
	int dpsq = 3;
   String dptime = "10시";
   String dploc = "부산";
   String dpcont = "해운대물놀이";
%>


<%
	String id = (String)session.getAttribute("sessionId"); //dto로 받아와야함
	/* String pno = request.getParameter("pno");  */
	System.out.println(id);
	String pno = "1";
	//dto.pno를 갖고 있어야함 현재 사용하는것이 무엇인지 알아야하
	planDao dao = new planDao();
	List<planDto> listDto = dao.selectList(id);
	Map<String,planDto> map =null;
	if(listDto.equals(null)||listDto==null||listDto.size() == 0){
%>
<script type="text/javascript">
	$("#selDiary").append("<option value=" + 0 + ">" + "여행정보가 없습니다" + "</option>" );
</script>
<%		
	}else{
		map = new HashMap<String,planDto>();
		for(planDto dto : listDto){
			map.put(dto.getPno(), dto);
		}
	}
%>

<script src="js/html2canvas.min.js"></script>
<script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">


   $(function() {
	   
		$("#selDiary").empty();
/*		$("#selDiary").append("<option value=" + 0 + ">" + "여행불러오기" + "</option>" ); */
		<%
		if(listDto.equals(null)||listDto==null||listDto.size() == 0){
		%>
		$("#selDiary").append("<option value=" + 0 + ">" + "여행정보가 없습니다" + "</option>" );		
		<%
		}else{
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
      
      $(document).on("mouseenter", ".droppable", function() {
     	 $(this).droppable({
         accept: ".draggable",      // draggable만 drop
         tolerance: "intersect",      // 50%이상 겹치면 drop가능
         hoverClass: "drophover",   // css를 통해 해당 element위에 올라와있을때 변화시킴
         drop: function(ev, ui) {
            if($(this).find(".contentholder").length > 0){
               $(this).find(".contentholder").remove();
               $(this).append($(ui.draggable).clone().attr({width: 500, height: 175}))
               $(this).append("<button class='contentDel'>삭제</button>");
            }
		}
  	    });
      });
      
      $(".draggable").draggable({
         appendTo: "body",
         refreshPositions: true,
         helper: "clone",
         scroll: false,
         opacity: 0.7
      })
      
      
      // 297 210
       $("#pdfdown").click(function() { //   $("#pdfdown").click((e) => {
         
    	   
    	   $.ajax({
    		      url:"danim.do?command=pencount&id=<%=id%>",   
    		            // data : data를 주겠다
    		              // data를 받겠다
    		      success:function(msg){
    		         var pen = msg;
    		         window.open("myPay.jsp?count="+pen, "결제창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
    		         
    		      },
    		      error:function(){
    		         alert("실패;;");
    		      }
    		   });
    	   
    	   
    	   
//          if($(".contentholder").length > 0){
//             alert("빈 칸을 모두 채워주세요")
//          } else {
             
		if(!=null){
            $(".display").css({"display":"block","padding":"53px 70px 53px 70px"});
            $(".canvas").css("border","0");
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
               doc.save('sample-file.pdf'); 
               $(".display").removeAttr("style");
                $(".canvas").removeAttr("style");
            })
//          }
		}
      })
      
      $(document).on("mouseenter", ".view > .droppable", function() {
         $(this).hover(function() {
         $(this).find(".contentDel").css("display","inline-block")
      }, function () {
         $(this).find(".contentDel").css("display","none")
      })
      
      $(document).on("click", ".contentDel", function() {
         $(this).parent().append("<div class='contentholder'></div>")
         $(this).parent().find(".draggable").remove()
         $(this).parent().find(".contentDel").remove()
      })
      })
      
      $("#planSave").click(function(){
	 		/* var tempSorttable = $("#sortable").html();
			tempSorttable = delSpace(tempSorttable); */
			//공백이 있으면 텍스트로 가져갈때 문제가 됨! 공백을 없애주는 녀석
		/* 	location.href = 'textController?command=saveText&pno='+ "2" + '&text='+tempSorttable; */
		$.ajax({
 			url : "textController",
 			type : "POST",
 			data : {
 				command : "saveText",
 				pno : "<%=pno %>",
 				text : delSpace($("#openFile").html())
 			}
 		});	     
 		
      });
      
      $(function(){
        	$("#planSelect").click(function(){
        		var titleno = $("#selDiary option:selected").val();
  		/* 	1. dao로 한개를 찾아온다.
  			2. 해당 애를 불러온다.
  			3. 기존에 있던 div를 지워준다.
  			4. 지워진 자리에 붙여넣어 준다. */
  			$.ajax({
  				url:"textController",
  				type : "POST",
  				data: {command : "getText", pno: titleno},
  				success : function(data){
  					$("#openFile").empty();
  					alert(data.substr(data.length-7,6)); 
  					$("#openFile").load("form/"+data.substr(data.length-7,6), "html");
					
  				}
  			}) .fail (function() {
                  alert('failure');
  			});

        	});
        	
        }); 
      
   });
      
   
   
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
   

   

</script>

</head>

<body>
	<%-- <jsp:include page="./form/header.jsp"></jsp:include> --%>
   <div id="body">
      <div id="topmenu">
         <div class="topmenu_wrapper">
            <div class="planSelect">
				<select id="selDiary" style="width:200px; height:30px; color: rgb(200, 160, 220); font-weight: bold;">
				   <option selected disabled style="display: none;">여행불러오기</option>
				   <option>2019.01.11 부산</option>
				   <option>2019.02.01 제주</option>
				</select>
				<input type="button" value="선택" id="planSelect" class="btn" style="width: 55px;">
          </div>

            <div class="menu">
               <input type="button" value="메인으로" class="btn">
               <input type="button" value="임시저장" id="planSave" class="btn">
               <input type="button" value="PDF 저장" id="pdfdown" class="btn">
            </div>
         </div>
      </div>
      <div id="sidemenu">
         <div class="accordion">
				<h3>여행경로</h3>
				<div>
					<img class="draggable" style="background:white;" width="200px" height="100px" src="image/DotGrid.png">
					<img class="draggable" style="background:white;" width="200px" height="100px" src="image/DotGrid.png">
					<img class="draggable" style="background:white;" width="200px" height="100px" src="image/DotGrid.png">
					<img class="draggable" style="background:white;" width="200px" height="100px" src="image/DotGrid.png">
				</div>
				<h3>날짜</h3>
				<div>
					<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna. </p>
				</div>
				<h3>비용</h3>
				<div>
					<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui. </p>
					<ul>
						<li>List item</li>
						<li>List item</li>
						<li>List item</li>
						<li>List item</li>
						<li>List item</li>
						<li>List item</li>
						<li>List item</li>
					</ul>
				</div>
				<h3>리뷰</h3>
				<div>
					
				</div>
				<h3>일기메모</h3>
				<div>
					
				</div>
				<h3>표지</h3>
				<div>
					
				</div>
				<h3>사진</h3>
				<div>
					
				</div>
				<h3>글상자</h3>
				<div>
					
				</div>
				<h3>스티커</h3>
				<div>
					
				</div>
			</div>
      </div>

      <div id="editor">
         <div class="wrapper">
            <div class="prev"><p onclick="prevPage()">◀</p></div>
            
            <div class="canvas" id="openFile">

<%
            for(int i = 1; i <= dpsq; i++){
%>
            <div class="display <%=i==1?"selected":"" %>">
               <div class="view">
                  <div class="droppable"><div class="contentholder"></div></div>
                  <div class="droppable"><div class="contentholder"></div></div>
                  <div class="droppable"><div class="contentholder"></div></div>
                  <div class="droppable"><div class="contentholder"></div></div>
                  <div class="droppable"><div class="contentholder"></div></div>
                  <div class="droppable"><div class="contentholder"></div></div>
                  <div class="droppable"><div class="contentholder"></div></div>
                  <div class="droppable"><div class="contentholder"></div></div>
                  <div class="page">
                     <span style="cursor:pointer;" onclick="prevPage()">◀</span>
                     <%= i + " / " + dpsq %> PAGE
                     <span style="cursor:pointer;" onclick="nextPage()">▶</span>
                  </div>
               </div>
            </div>
<%
            }
%>
            </div>
            

            
            <div class="next"><p onclick="nextPage()">▶</p></div>
         </div>
      </div>
   </div>

</body>
</html>
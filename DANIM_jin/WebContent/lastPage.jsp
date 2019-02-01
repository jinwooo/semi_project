<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>카카오톡 공유하기 버튼</title>

 
<%
String user = (String)session.getAttribute("sessionId"); //dto로 받아와야함
%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 


<style type="text/css">

.button:hover span,#kakao-link-btn {
  padding-right: 25px;
  outline: 0px;  
  border: none;
}
.button:hover span:after,#kakao-link-btn {
  opacity: 1;
  right: 0;
  outline: 0px;
  border: none;
}
.button{
  display: inline-block;
  border-radius: 4px;
  background-color: #C8A0FA;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 15px;
  padding: 10px;
  width: 80px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  outline: 0px;
  
}

.button span,#kakao-link-btn {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
    outline: 0px;
  border: none;
}
</style>

</head>
<body>


<div style="height: 100px;">
	<jsp:include page="./form/header_ex.jsp"></jsp:include>
</div>

<div align="center">
<br/><br/><br/><br/><br/>
<h1>PDF 저장 및 결제가 완료되었습니다.</h1>
<br/><br/><br/><br/><br/><br/><br/>
<!-- 

<div align="center"style="display: inline;" >
	<a id="kakao-link-btn" href="javascript:;">
		<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>카카오톡 공유하기
	</a>
</div>	

<div>
<a href="#">
<img src="image/home.png" style="width: 70px; height: 70px;"><span>home</span>
</a>
</div>

<div style="display: inline;">
	<button class="button" style="vertical-align: middle " onclick="location.href='danim.do?command=insert'"><span>게시판에 글쓰기>></span></button>
</div>	  -->

<table style="text-align: center;">
<col width="100"/>
<col width="100"/>
<col width="100"/>
	<tr><th><img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/></th><th><img src="image/home.png" style="width: 70px; height: 70px;"></th><th>	<button class="button" style="vertical-align: middle " onclick="location.href='danim.do?command=insert'"><span>게시판에<br/>글쓰기</span></button></th></tr>
	<tr><td><a id="kakao-link-btn" href="javascript:;">공유하기</a></td><td><a href="#">Home</a></td></tr>
</table>



</div>
	
<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('5d1595fcdba49530de07a8fead7b83da'); //카카오개발자에서 받은 코드
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: 'DANIM_여행',
        description: '#여행 #일정 #계획 #감성 #플래너',
        imageUrl: 'https://www.uniqmagazine.com/media/CACHE/images/thumbs/2018/09/17/IGModule_870x617_WeddingPlanning/c71817a7d14aa06858b6c51b790784ca.jpg',
        link: {
          mobileWebUrl: 'http://192.168.10.33:8787/DANIM_jin/',	//모바일 카카오톡에서 사용하는 웹링크
          webUrl: 'http://192.168.10.33:8787/DANIM_jin/'	//PC카카오톡에서 사용하는 웹링크
        }
      },
      /* social: {
        likeCount: 286,			//컨텐츠의 좋아요 수
        commentCount: 45,		//컨텐츠의 댓글 수
        sharedCount: 845		//컨텐츠의 공유 수
      }, */
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://192.168.10.33:8787/DANIM_jin/',
            webUrl: 'http://192.168.10.33:8787/DANIM_jin/'
          }
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'http://192.168.10.33:8787/DANIM_jin/',
            webUrl: 'http://192.168.10.33:8787/DANIM_jin/'
          }
        }
      ]
    });
  //]]>
</script>

</body>
</html>
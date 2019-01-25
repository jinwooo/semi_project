<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!--앞으로 사용할 bootstrap에 관계된 css 파일을 연결(다운로드 받은 것)  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
 <script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>


        <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>개인정보 변경</h3>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
                <form action="danim.do" role="form" method="post">
                <input type="hidden" name="command" value="changeInfo"/>
                   <div class="form-group">
                        <label for="inputId">아이디</label>
                     <div class="form-inline">
                        <input type="text" class="form-control" id="inputId" name="inId" value="${dto.id }" placeholder="아이디를 입력해 주세요" style="width:80%;" readonly="readonly">
                  	 </div> 
                      </div>
                    <div class="form-group">
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" id="inputName" name="inName" value="${dto.name }"placeholder="이름을 입력해 주세요" required>
                    </div>
                 
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" id="inputPassword" value="${dto.pw }" name="inPw" placeholder="비밀번호를 입력해주세요" required>
                    </div>
                    <div class="form-group">
                        <label for="InputEmail">이메일 주소</label>
                        <input type="email" class="form-control" id="InputEmail" name="inEmail" value="${dto.email }" placeholder="이메일 주소를 입력해주세요" required>
                       </div>
                    <div class="form-group">
                        <label for="inputMobile">휴대폰 번호</label>
                        <input type="tel" class="form-control" id="inputMobile" name="inPhone" value="${dto.phone }" placeholder="휴대폰번호를 입력해주세요" required>
                    </div>
                    <div class="form-group">
                        <label for="inputtelNO">주소</label>
                        <input type="text" class="form-control" id="inputAddr" name="inAddr" value="${dto.addr }" placeholder="주소를 입력해주소" required>
                    </div>


                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary" title="전체입력을 해주세요.">
                            변경<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="button" class="btn btn-warning" onclick="location.href='danim.do?command=main'">
                            취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                   
</form>
</div>
        </article>


</body>
</html>
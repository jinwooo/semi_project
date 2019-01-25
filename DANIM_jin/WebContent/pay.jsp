<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">

var IMP = window.IMP; // 생략가능
IMP.init('imp04249110'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용



IMP.request_pay({
    pg : 'nice', // version 1.1.0부터 지원. 나이스정보통신으로 결제이용
    pay_method : 'card', //카드로 이용
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:연필(10자루)',	//제품명
    amount : 1100,        //금액설정
    buyer_email : 'iamport@siot.do',  //구매자 이메일
    buyer_name : '박정성',			//구매자 이름
    buyer_tel : '010-1234-5678',	//구매자 연락처
    buyer_addr : '서울특별시 강남구 삼성동',	//구매자 주소
    buyer_postcode : '123-456',		//구매자 우편번호
    m_redirect_url : 'https://www.naver.com' //결제한뒤에 이동할 위치
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;

        
        
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});


</script>

</head>
<body>

	
	



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
div.detail {
    width: 800px;
    overflow: auto;
    margin: auto;
}
div.detail div.picture1{
    width: 280px;
    height: 450px;
    float:left;
    margin: auto;
    padding-right:150px;
}
div.detail div.picture1 img{
	width:100%;
	height:auto
}
div.buying{
    height: 450px;
    margin: auto;
}   
img{
    width: 80%;
}
p.smalls {
    font-size: small;
}
h4 {
    color: #0055ff;
}
table{
	width:100%;
	border-collapse: collapse;
}
th,td{
	/* border:1px solid silver; */
}
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 680px;
    height: 100px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 12px;
    resize: none;
}
#btnReview {
    width:100px;
    height: 100px;
}
td.btnBox{
    text-align: right;
}
textarea.cmtBox{
	width:680px;
	height:70px;
}
table.cmtcnt{
	width:700px;
}
p.container{
	width:600px;
}

</style>
<body>
<header><a href="/">홈으로</a></header>
<input type=hidden id=book_id value="${book_id }">
<input type=hidden id=writer value="${userid }">
<div class="detail">
    <div class="title">
        <h1 id=hTitle></h1>
<!--         <h5>-&ensp;책부제</h5> -->
        <h5>작가 (지은이)&ensp;출판사&ensp;출판일</h5>
        <hr>
    </div>
    <div class="picture1" id=img>
        
    </div>
    <div class="buying">
        <br><br><br>
        <p>판매가<h3 id=price></h3></p>
        <br>
        배송료 3,000원<br><br><br><br><br><br>

        <button id="goCart" placeholder="작성하려면 로그인이 필요합니다" disable = true>장바구니</button>&ensp;
        <button id="goBuy">바로구매</button>
    </div>
    <br><br>
    <div>
        <h4>기본정보</h4>
        <p class="smalls">
            페이지&ensp;사이즈mm &ensp;무게g&ensp;ISBN:00000
        </p>
        <br>
        <hr>
        <h4>책소개</h4>
        <p class="smalls">
            책소개
        </p>
        <br>
        <hr>
        <h4>목차</h4>
        <p class="smalls">
            목차
        </p>
        <br>
        <hr>
        <h4>상품결제정보</h4>
        <p class="smalls">
            고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.
            확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.<br>
            무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.<br>  
            주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.
        </p>
        <br>
        <hr>
        <h4>배송정보</h4>
        <p class="smalls">
            배송 방법 : 택배<br>
            배송 지역 : 전국지역<br>
            배송 비용 : 3,000원<br>
            배송 기간 : 3일 ~ 7일<br>
            배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.
            고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.
            <br><br>
        </p>
        <hr>
        <h4>교환 및 반품 정보</h4>
        <p class="smalls">
        <b>교환 및 반품 주소</b><br>
        - [10402] 경기 고양시 일산동구 장항동 846 센트럴프라자빌딩 4층
        <br><br>
        <b>교환 및 반품이 가능한 경우</b><br>
        - 도서 수령일 기준 7일 이내에 접수 (단, 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.)<br>
        - 도서의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 도서를 공급받은 날부터 3개월 이내,<br><br>
        그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
        (초판의 경우 조기품절 될 수 있으며, 초판여부로는 환불되지 않습니다.)
        <br><br>
        <b>교환 및 반품이 불가능한 경우</b><br>
        - 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여  포장 등을 훼손한 경우는 제외<br>
        - 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br>
        - 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<br>
        - 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
        - 복제가 가능한 상품등의 포장을 훼손한 경우

        <b>고객님의 과실로 상품을 전달 받지 못하고  반송후 재발송 요구시</b><br>
        고객님께서 수령 주소, 전화번호를 잘못 표기 하거나 3일간 상품 인수자가 없어 반송이 된 경우 택배료는 구매금액과 관계없이 주문하신 고객님께서 부담해 주셔야 합니다.
        만약 재출고를 요청하실 경우 왕복 택배비를 별도 입금해 주셔야 하고, 환불을 원하실 경우 왕 배송비를 제외한 상품대금을 환불해 드립니다.
        <br>

        <b>(자세한 내용은 Q&A 게시판이나 카카오톡 채널등의 상담을 이용해 주시기 바랍니다.)</b><br><br>

        <b>※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.</b><br>
        </p>
        <br>
        <hr>
        <h4>환불정보</h4>
        <p class="smalls">
        환불시 반품 확인여부를 확인한 후 3영업일 이내에 결제 금액을 환불해 드립니다.<br>
        신용카드로 결제하신 경우는 신용카드 승인을 취소하여 결제 대금이 청구되지 않게 합니다.<br>
        (단, 신용카드 결제일자에 맞추어 대금이 청구 될수 있으면 이경우 익월 신용카드 대금청구시 카드사에서 환급처리 됩니다.)<br>
        </p>
        <br><br>
        <h4>상품후기</h4>
       <tr>
		    	<td><textarea id="cmtBox" class="cmtBox" placeholder="작성하려면 로그인이 필요합니다" disable = true></textarea></td></tr>
		  	 	<c:if test="${sessionScope.userid != null}">
			  	  <tr><td class="btnBox"><input type="button" id="btnAdd" value="등록"></td></tr>
				</c:if>
		</table>
		<hr>
		
		<!-- 댓글 확인 구역 -->
		<table class=cmtcnt>
		<c:forEach var="cmt" items="${alreview}">
			<tr>
				<td><input type="hidden" id=cmtid value="${cmt.id}"><br></td>
				<!-- 댓글 삭제 관리 -->
				<c:if test="${ sessionScope.admin == sessionScope.userid && sessionScope.admin!=null || sessionScope.userid != null && sessionScope.userid == cmt.writer}">
				<td class=btnBox><button id=btndel>x</button></td>
				</c:if>
			</tr>
			<tr>
				<td colspan=2><p class=container>${cmt.content}</p></td>
			</tr>
			<tr><td style="width:100px"><b>${cmt.writer}</b></td><td><small>${cmt.created}</small></td></tr>
			<tr><td colspan=2><hr></td></tr>
		</c:forEach>
		</table>
        <br><br><br>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	$.ajax({
		type:'post',
		url:'/doDetailList',
		data:{book_id:$('#book_id').val()},
		dataType:'json',
		success:function(data){
			let ob=data[0]
			$('#hTitle').text(ob['name'])
			let str='<img src="'+ob['image']+'">'
			$('#img').append(str)
			$('#price').text(ob['price'])
		}
	})
})
.on('click','#goCart',function(){
	console.log($('#writer').val())
    if( $('#writer').val() != ""){
        $('#goCart').disable = false;
        // console.log(userid)
    } else {
        alert('로그인페이지로 이동합니다');
        
        location.href="/login";
        return false
    }
	$.ajax({
		type:'post',
		url:'/gocart',
		data:{book_id:$('#book_id').val(),member_id:$('#writer').val()},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				alert('장바구니에 물품넣음')
				if(confirm('장바구니로 이동하겠습니까?')==1){
					document.location="/basketList"
				}
				return false
			}
			alert('실패!')	
		}
	})
})
// 댓글 작성 권한
.on('click','#cmtBox',function(){
    let userid = $('#writer').val();
    console.log("userid"+userid)
    if(userid != ""){
        $('#cmtBox').disable = false;    
        // console.log(userid)
    } else {
        alert('로그인페이지로 이동합니다');
        location.href="/login";
    }
})




// 댓글 등록
.on('click','#btnAdd',function(){
	$.ajax({
		type:'get',
		url:'/addcomment',
		data:{
			bookid:$('#book_id').val(),
			writer:$('#writer').val(),
			content:$('#cmtBox').val()
		},
		dataType:'text',
		success:function(data){
			console.log("addcmt:",data)
			location.reload();
		}
	})
})

// 댓글 삭제
.on('click','#btndel',function(){
	let n=$(this).parent().parent().find('td:eq(0)').find('#cmtid').val()
	console.log(n)
 	$.ajax({
		type:'get',
		url:'/delcomment',
		data:{id:n},
		dataType:'text',
		success:function(data){
			console.log("delval",$('#cmtid').val(),"del",data);
			location.reload();
		}
	})
})
// 로그아웃
.on('click','#btnout',function(){
	$.ajax({
		type:'post',
		url:'/gologout',
		data:{},
		dataType:'text',
		success:function(data){
			/* console.log("logout",data); */
			location.reload();
		}
	});
})

</script>
</html>
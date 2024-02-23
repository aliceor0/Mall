<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문페이지입니다</title>
</head>
<style>
		select{ 
			behavior: url('/inc/selectBox.htc');
		}
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        #basketList02 {
            display: flex;
        }

        #basketList03 {
            width: 20%;
            background-color: #f0f0f0;
            padding: 20px;
        }

        #basketList01 {
            flex: 1;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

</style>
<body>
<input type=hidden id=member_id value="${sessionScope.userid }">


<h1>주문페이지입니다</h1>
<br>
<h3>장바구니 내역을 주문해봅니다</h3>
	<div id="basketList02">
		<div id="basketList03">
			<h2>금주의 베스트셀러</h2>
			<p><img src="/img/book3.jpg"></p>
		</div>
		<div id="basketList01">
			<h2>하이미디어 장바구니</h2>
			<table id=tblbasketList>
				<tr>
					<th>책제목</th>
					<th>수량</th>
					<th>단가</th>
					<th>주문일자</th>
					<th>주소</th>
					<th>총액</th>
					<th>취소</th>
				
				</tr>
			</table>
		</div>
	</div>
	
	<a href="/">홈으로</a>
	
	
	<div>
		<div>
<!-- 			이건 결제 주문창으로 이동해서 새로운 내용들을 가져와야해 배송,결제카드 -->
			<form method="get" action="/gobuyList">
				<table>
					<tr><td style=text-align:center><input type=submit value="주문하기">
						<input type=button value="비우기" id=removebasketList></td></tr>
				</table>
			</form>
		</div>
	</div>



</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>



<script>
$(document)
.ready(function(){
	totalList();

})

.on("click","#delList",function(){
	console.log($(this).parent().parent().find('td:eq(3)').text())
	console.log($('#member_id').val())
	$.ajax({
		type:"get",
		url:"/delList",
		data:{order_dt:$(this).parent().parent().find('td:eq(3)').text(),member_id:$('#member_id').val()},
		dataType:"text",
		success:function(data){
			alert("삭제완료")
		
			location.reload();
			return false;
		}
	})
})

	function totalList(){
	console.log($('#member_id').val())
	$.ajax({
		type:"get",
		url:"/gobuyList",
		data:{member_id:$('#member_id').val()},
		dataType:"json",
		success:function(data){
			let str="";
			for(let i=0;i<data.length;i++){
				let ob=data[i]
				str+="<tr><td>"+ob['book_name']+"</td><td>"+ob['cnt']+"</td><td>"+ob['price']+"</td><td>"+ob['order_dt']+"</td><td>"+ob['address']+"</td><td>"+ob['total']
				+"</td><td><input type=button id=delList value='삭제'></td></tr>"
			}
			$("#tblbasketList").append(str)
		}
	})
}



</script>
</html>
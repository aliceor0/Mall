<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<header><a href="/">홈으로</a></header>
<input type=hidden id=userid value="${sessionScope.userid }">
<form method="post" action="/order" id=form>
	<div id="basketList02">
		<div id="basketList03">
			<h2>금주의 베스트셀러</h2>
			<p><img src="/img/book3.jpg"></p>
		</div>
		<div id="basketList01">
			<h2>하이미디어 장바구니</h2>
			<table id=tblbasketList>
				<tr>
					<th>책번호</th>
					<th>책사진</th>
					<th>책제목</th>
					<th>가격</th>
					<th>수량</th>
					<th>주문하기</th>
					</tr>
			</table>
		</div>
	</div>
	<div>
		<div>
<!-- 			이건 결제 주문창으로 이동해서 새로운 내용들을 가져와야해 배송,결제카드 -->
			
				<table>
					<tr><td style=text-align:center><input type=submit value="주문하기"  placeholder="작성하려면 로그인이 필요합니다" disable = true>
						<input type=button value="비우기" id=removebasketList></td></tr>
				</table>
			
		</div>
	</div>
</form>
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	getList()

})
.on('submit','#form',function(){
    let userid = $('#userid').val();
    console.log("userid"+userid)
    if(userid != ""){
        $('#cmtBox').disable = false;
        return true
        // console.log(userid)
    } else {
        alert('로그인페이지로 이동합니다');
        
        location.href="/login";
        return false
    }
})

.on('click','#removebasketList',function(){
	$.ajax({
		type:'post',
		url:'/cleanCart',
		data:{member_id:$('#userid').val()},
		dataType:'text',
		success:function(data){
			if(data!='0'){
				alert('비우기완료')
				location.reload();
				return false
			}
			console.log('비우기 실패')

		}
		
	})
})

	.on("click","#addbasketList",function(){
		let id = $(this).parent().parent().find('td:eq(0)').text();
		
		let nid=id.split('번');
		console.log(nid)
		let image= $(this).parent().parent().find('td:eq(1)').find('#himage').val();
		console.log(image)
		let name = $(this).parent().parent().find('td:eq(2)').text();
		console.log(name)
		let price = $(this).parent().parent().find('td:eq(3)').text();
		console.log(price)
		let count = $(this).parent().parent().find('td:eq(4)').find('#basketSelList option:selected').val();
		console.log(count)
		
		$.ajax({
			type:"get",
			url:"/addbasketList",
			data:{basketId:nid[0],basketImage:image,
				basketName:name,basketPrice:price,
				basketCnt:count},
			dataType:"text",
			success:function(data){
				console.log(data)
				let str = $(this).parent().parent().find('td:eq(0)').text();
				console.log('str  은 디스에 번호를 받아왓다'+ str)
				alert("보관성공")
			}
		})
	})

	
	.on("click","#clearbasketList",function(){
		$.ajax({
			type:'post',
			url:'/removecart',
			data:{order_id:$(this).parent().parent().find('td:eq(1)').find('#order_id').val()},
			dataType:'text',
			success:function(data){
				if(data=='1'){
					alert('삭제완료')
					return false
				}
				alert('실패')
			}
		})
		$(this).parent().parent().remove();
	});
	

	function getList(){
		$.ajax({
			type:'get',
			url:'/getbasketList',
			data:{userid:$('#userid').val()},
			dataType:"json",
			success:function(data){
				let j=0;
				let k=1;
				for(let i=0;i<data.length;i++){
					let str="<tr id=trbasketList>";
					for(j;j<k;j++){
						if(j==data.length){
							break;
						}
						console.log("j는 row입니다" + j)
						console.log(data.length)
						let ob=data[j]
						str+="<td id=basketId>"+ob['id']+"번</td>"
						+'<td id="basketImage"><input type=hidden id=himage value='+ob['image']+'><input type=hidden id=order_id value='+ob['order_id']+'><img src="'+ob['image']+'"'+'style=width:70px></td>'
							+'<td id=basketName>'+ob['name']+"</td>"+"<td id=basketPrice]>"+ob['price']+"</td>"
							+'<td><select name=cnt><option value="">수량선택</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select>'
							+'<td><input type=button value="보관" id="addbasketList"><input type=button value="삭제" id="clearbasketList"></td>'
							console.log("<td id=basketId>"+ob['id']+"번</td>")
					}
					str+="</tr>"
					$('#tblbasketList').append(str)
					console.log($('#tblbasketList'))
					console.log($('#tblbasketList').val())
					k+=1;
				}
			}
		})	
	}
	
</script>
</html>
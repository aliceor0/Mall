<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제창</title>
</head>
<style>
th,td{
	text-align:center;
}
.left{
	text-align:left;
}
</style>
<body>
<input type=hidden id=member_id value=${sessionScope.userid }>
<input type=hidden id=cnt value="${cnt}">
<input type=hidden id=book>
<table style="width:40%;height:400px;" id=list>
	<th>책번호</th><th>책이름</th><th>가격</th><th>수량</th><th>총액</th>
</table>
<table>	
	<tr><td class=left>주소지</td><td><input type=text id=address></td></tr>
	<tr><td class=left>결제 방법</td><td><input type=radio name=payway id=basic value="basic"><label for=basic>일반결제</label><input type=radio name=payway id=card value="card"><label for=card>신용카드</label><input type=radio name=payway id=toss value="toss"><label for=toss>toss</label></td></tr>
	<tr style="display:none;" id=b_style>
		<td></td>
		<td>
		<table>
			<tr><td class=left>휴대폰</td><td><input type=number id=mobile></td></tr>
		</table>
		</td>
	</tr>
	<tr style="display:none;" id=c_style>
		<td></td>
		<td>
		<table>
			<tr>
				<td class=left>신용카드</td>
				<td><select id=kindOfCard>
					<option value="국민">국민</option>
					<option value="우리">우리</option>
					<option value="신한">신한</option>
					<option value="새마을">새마을</option>
					<option value="하나">하나</option>
					<option value="농협">농협</option>
					<option value="롯데">롯데</option>
					<option value="삼성">삼성</option>
					<option value="카카오뱅크">카카오뱅크</option>
				</select></td>
			</tr>
			<tr><td class=left>카드번호</td><td><input type=number id=cardNum></td></tr>
		</table>
		</td>
	</tr>
	<tr style="display:none;" id=t_style>
		<td></td>
		<td>
		<table>
			<tr><td class=left>전화번호</td><td><input type=number id=tossMobile></td></tr>
		</table>
		</td>
	</tr>
	<tr><td class=left>총액</td><td><input type=number id=total readonly></td></tr>
	<tr><td colspan=2 style="text-align:center;"><button id=btnBuy>구매하기</button><button id=btnback>뒤로가기</button>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	showInf()
})
.on('click','input[name="payway"]',function(){
	
	let way = $(this).val()
	console.log(way)
	if(way==$('#basic').val()){
		$('#b_style').show()
		$('#c_style').hide()
		$('#t_style').hide()
	} else if(way==$('#card').val()){
		$('#b_style').hide()
		$('#c_style').show()
		$('#t_style').hide()
	} else if(way==$('#toss').val()){
		$('#b_style').hide()
		$('#c_style').hide()
		$('#t_style').show()
	}
})
.on('click','#btnback',function(){
	document.location.href="/basketList"
})
.on('click','#btnBuy',function(){
	var n = document.getElementsByName("book_id");
    var book= [];
    for(var i = 0; i < n.length; i++) {
        book.push(n[i].value);
    }
    $('#book').val(book)
    console.log(book)
	if($('input[name="payway"]:checked').val()=='basic'){
		$.ajax({
			type:'post',
			url:'/basicBuy',
			data:{cnt:$('#cnt').val(),book_id:$('#book').val(),address:$('#address').val(),payway:$('#basic').val(),member_id:$('#member_id').val(),mobile:$('#mobile').val()},
			dataType:'text',
			success:function(data){
				console.log("4")
				if(data=='0'){
					alert('전화번호가 다름니다')
					return false
				}
				addTotal()
				cleanCart()
				document.location.href="/"
			}
		})
	}else if($('input[name="payway"]:checked').val()=='card'){
		$.ajax({
			type:'post',
			url:'/cardBuy',
			data:{cnt:$('#cnt').val(),book_id:$('#book').val(),address:$('#address').val(),payway:$('#card').val(),member_id:$('#member_id').val(),card:$('#kindOfCard option:selected').val(),cardNum:$('#cardNum').val()},
			dataType:'text',
			success:function(data){
				console.log("9")
				addTotal()
				cleanCart()
				document.location.href="/"
			}
		})
	} else if($('input[name="payway"]:checked').val()=='toss'){
		$.ajax({
			type:'post',
			url:'/tossBuy',
			data:{cnt:$('#cnt').val(),book_id:$('#book').val(),address:$('#address').val(),payway:$('#toss').val(),member_id:$('#member_id').val(),mobile:$('#tossMobile').val()},
			dataType:'text',
			success:function(data){
				console.log("8")
				if(data=='0'){
					alert('이름 또는 전화번호가 올바르지 않습니다')
					return false
				}
				addTotal()
				cleanCart()
				document.location.href="/"
			}
		})
	}
	
})

function addTotal(){
	$.ajax({
		type:'post',
		url:'/addTotal',
		data:{payway:$('input[name="payway"]:checked').val(),member_id:$('#member_id').val(),total:$('#total').val()},
		dtaType:'text',
		success:function(data){
			if(data=='1'){
				console.log('총액 저장')
				return false	
			}
		console.log('실패')
		}
	})
}

function cleanCart(){
	$.ajax({
		type:'post',
		url:'/cleanCart',
		data:{member_id:$('#member_id').val()},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				console.log('비우기완료')
				return false
			}
			console.log('비우기 실패')
		}
		
	})
}

function showInf(){
	$.ajax({
		type:'post',
		url:'orderList',
		data:{cnt:$('#cnt').val(),userid:$('#member_id').val()},
		dataType:'json',
		success:function(data){
			if(data=='1'){
				alert('실패')
				return false
			}
			
//			console.log(data.length)
			let total=0
			for(let i=0;i<data.length;i++){
				console.log(data[i]);
				let ob=data[i]
//				console.log(ob)
//				console.log(ob['book_id'])
				let str='<tr><td><input type=hidden name=book_id value="'+ob['book_id']+'">'+ob['book_id']+'</td><td>'+ob['name']+'</td><td>';
				str+=ob['price']+'</td><td>';
				str+=ob['cnt']+'</td><td>';
				str+=(ob['price']*ob['cnt'])+'</td></tr>'
				$('#list').append(str)
				let sum=ob['price']*ob['cnt']
				total+=sum
//				console.log(i)
				}
			$('#total').val(total)

		}
	})
}
</script>
</html>
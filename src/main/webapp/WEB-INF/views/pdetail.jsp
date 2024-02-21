<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdetails</title>
</head>
<body>

<table>
<tr><td></td><td><input type="hidden" id=idbox value="${pd.id}"></td>
<tr><td>등록번호</td><td>${pd.id}</td>
<tr><td rowspan=2>이미지</td><td><img src="${pd.image}" width="200"></td></tr>
<tr><td><input type="text" id=imgbox value="${pd.image}"></td></tr>
<tr><td>제목</td><td><input type="text" id=namebox value="${pd.name}"></td></tr>
<tr><td>가격</td><td><input type="text" id=moneybox value="${pd.price}"></td></tr>
<tr><td colspan=2><button id=btnModfB>수정</button></td></tr>
</table>

<a href="/pregist">목록으로 돌아가기</a>&nbsp;&nbsp;

</body>
<script src='https://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.on('click','#btnModfB',function(){

	$.ajax({
		type:'get',
		url:'/modifybook',
		data:{
			id:$('#idbox').val(),
			img:$('#imgbox').val(),
			title:$('#namebox').val(),
			price:$('#moneybox').val()
		},
		dataType:'json',
		success:function(data){
			if(data==1){
				console.log('O');
				alert("수정완료");
				location.href="/pregist";
			} else {
				console.log('X');
			}	
			
		}
	})
})
</script>
</html>
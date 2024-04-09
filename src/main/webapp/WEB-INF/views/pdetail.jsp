<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdetails</title>
</head>
<style>
/* 헤더 스타일 */
header {
    background-color: #333;
    color: #fff;
    padding: 10px;
}

header a {
    color: #fff;
    text-decoration: none;
}

header a:hover {
    text-decoration: underline;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table td, table th {
    padding: 10px;
    border: 1px solid #ddd;
}

table th {
    background-color: #f2f2f2;
    text-align: left;
}

/* 이미지 스타일 */
img {
    max-width: 100%;
    height: auto;
}

/* 버튼 스타일 */
button {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

/* 링크 스타일 */
a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
/* 숨겨진 입력 필드 스타일 */
input[type="hidden"] {
    display: none;
}
div.detail {
    width: 800px;
    overflow: auto;
    margin: auto;
}
</style>
<body>
<header><a href="/">홈으로</a></header>
<div class=detail>
<table>
<tr><td colspan=2><input type="hidden" id=idbox value="${pd.id}"></td>
<tr><td>등록번호</td><td>${pd.id}</td>
<tr><td rowspan=2>이미지</td><td><img src="${pd.image}" width="200"></td></tr>
<tr><td><input type="text" id=imgbox value="${pd.image}"></td></tr>
<tr><td>제목</td><td><input type="text" id=namebox value="${pd.name}"></td></tr>
<tr><td>가격</td><td><input type="text" id=moneybox value="${pd.price}"></td></tr>
<tr><td>작가</td><td><input type="text" id=author value="${pd.author}"></td></tr>
<tr><td>출판일</td><td><input type="text" id=publishd value="${pd.publishDate}"></td></tr>
<tr><td>출판사</td><td><input type="text" id=publishc value="${pd.publishCompany}"></td></tr>
<tr><td>책종류</td><td id=booktype>
	<input type=checkbox name="interestBook" value="경제/경영">경제/경영
    <input type=checkbox name="interestBook" value="건강/취미">건강/취미
    <input type=checkbox name="interestBook" value="과학">과학<br>
    <input type=checkbox name="interestBook" value="로맨스">로맨스
    <input type=checkbox name="interestBook" value="소설/시/희곡">소설/시/희곡
    <input type=checkbox name="interestBook" value="심리/추리/스릴러">심리/추리/스릴러<br>
    <input type=checkbox name="interestBook" value="종교">종교
    <input type=checkbox name="interestBook" value="만화">만화
    <input type=checkbox name="interestBook" value="판타지/무협">판타지/무협
    <input type=checkbox name="interestBook" value="라이트노벨">라이트노벨
<tr><td colspan=2><button id=btnModfB>수정</button></td></tr>
</table>

<a href="/pregist">목록으로 돌아가기</a>&nbsp;&nbsp;
</div>
</body>
<script src='https://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.on('click','#btnModfB',function(){
	let str=""
		$("#booktype input:checked").each(function(){
			str+=$(this).val()+',';
		})
	$.ajax({
		type:'get',
		url:'/modifybook',
		data:{
			id:$('#idbox').val(),
			img:$('#imgbox').val(),
			title:$('#namebox').val(),
			price:$('#moneybox').val(),
			author:$('#author').val(),
			publishDate:$('#publishd').val(),
			publishCompany:$('#publishc').val(),
			booktype:str
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
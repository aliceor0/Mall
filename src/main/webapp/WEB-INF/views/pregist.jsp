<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
</head>
<style>
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
}

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

/* 등록 폼 스타일 */
h1 {
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table td, table th {
    padding: 10px;
}

table th {
    background-color: #f2f2f2;
    text-align: left;
}

input[type="text"], input[type="number"] {
    width: calc(100% - 20px);
    padding: 8px;
    box-sizing: border-box;
}

input[type="checkbox"] {
    width: auto;
    margin-right: 5px;
}

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

/* 등록 상품 내역 스타일 */
#tblList {
    margin-top: 20px;
}

#tblList th, #tblList td {
    text-align: center;
    padding: 10px;
}

#tblList th:first-child, #tblList td:first-child {
    width: 5%;
}

#tblList th:nth-child(2), #tblList td:nth-child(2) {
    width: 20%;
}

#tblList th:nth-child(3), #tblList td:nth-child(3) {
    width: 45%;
}

#tblList th:nth-child(4), #tblList td:nth-child(4) {
    width: 15%;
}
input[type="hidden"] {
    display: none;
}
div.detail {
    width: 1000px;
    overflow: auto;
    margin: auto;
}
</style>
<body>
<header><a href="/">홈으로</a></header>
<div class=detail>
<h1>상품등록</h1>
<table>
<tr><td>그림</td><td><input type="text" id=img></td></tr>
<tr><td>제목</td><td><input type="text" id=title></td></tr>
<tr><td>가격</td><td><input type="number" id=price></td></tr>
<tr><td>작가</td><td><input type="text" id=author></td></tr>
<tr><td>출판일</td><td><input type="text" id=publishd></td></tr>
<tr><td>출판사</td><td><input type="text" id=publishc></td></tr>
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
</td></tr>
<tr><td colspan=2><button id=btnAdd>등록</button></td></tr>
</table>

<hr>

<h3>등록상품내역</h3>
<table id=tblList>
<tr><th>번호</th><th>이미지</th><th>이름</th><th>가격</th></tr>
</table>

<table>
<c:forEach var="book" items="${albook}">
	<tr>
		<td><input type="hidden" id=bid value="${book.id}"></td>
		<td>${book.id}</td>
		<td><a href="/pdetail?id=${book.id}"><img src="${book.image}" width="100" height="100"></a></td>
		<td>${book.name}</td><td>${book.price}</td>
		<td><a href="/pdetail?id=${book.id}"><button id=btnModfB>수정</button></a></td>
		<td><a href="/deletebook?id=${book.id}&&userid=${sessionScope.userid}"><button id=btnDelB>삭제</button></a></td>
	</tr>
</c:forEach>
</table>
</div>
</body>

<script src='https://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.on('click','#btnAdd',function(){
		let str=""
		$("#booktype input:checked").each(function(){
			str+=$(this).val()+',';
		})
		console.log(str)
	$.ajax({
		type:'get',
		url:'/addpro',
		data:
			{itemName:$('#title').val(),
			img1:$('#img').val(),
			price:$('#price').val(),
			author:$('#author').val(),
			publishd:$('#publishd').val(),
			publishc:$('#publishc').val(),
			booktype:str},
		dataType:'text',
		success:function(data){
			console.log(data);
		}
	})
	
})
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판</title>
</head>
<style>
a{
	text-decoration:none;
}
table{
    border-collapse: collapse;
}
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
}

h2 {
    color: #333;
}

a {
    color: #3498db;
}

a:hover {
    color: #2980b9;
}

table {
    width: 1000px;
    margin-top: 20px;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12);
}

th, td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #3498db;
    color: #fff;
}

tr:hover {
    background-color: #f5f5f5;
}

caption {
    margin-top: 10px;
    margin-bottom: 20px;
    text-align: right;
}
button {
    padding: 8px 12px;
    background-color: #3498db;
    color: #fff;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #2980b9;
}
#btnout {
    margin-top: 10px;
    padding: 8px 12px;
    background-color: #e74c3c;
    color: #fff;
    border: none;
    cursor: pointer;
}
#btnout:hover {
    background-color: #c0392b;
}
div.detail {
    width: 1000px;
    overflow: auto;
    margin: auto;
}
td.qbutton{
	width:150px;
}
td.qid{
	width:50px;
}
td.qid{
	width:50px;
}
td.qtitle{
	width:450px;
}
td.qwriter{
	width:100px;
}
td.qdate{
	width:150px;
}
</style>
<body>

<c:if test="${sessionScope.admin != null}">
관리자
</c:if>
<c:if test="${sessionScope.userid == null}">
	<a href='/login'>로그인</a>&emsp;<a href="/signup">회원가입</a><br>
</c:if>
<c:if test="${sessionScope.userid != null}">
	${userid} 님, 환영합니다.
	<input type="button" id=btnout value="로그아웃">
</c:if>
<header><a href="/">홈으로</a></header>

<div class=detail>
<h2>QnA 게시판</h2>

<c:if test="${sessionScope.userid != null}">
	<caption style="text-align:right"><a href="/qnawrite"><button>작성</button></a></caption>
</c:if>
<table>
<tr><th>번호</th><th>제목</th><th>저자</th><th>작성시각</th></tr>
<c:forEach var="board" items="${alqna}">
	<tr>
		<td class=qid>${board.id}</td>
		<td class=qtitle><a href=qnaview?id=${board.id}>${board.title}</a></td>
		<td class=qwriter>${board.writer}</td>
		<td class=qdate>${board.created}</td>
		<c:if test="${sessionScope.admin != null || sessionScope.userid != null && sessionScope.userid == board.writer}">
			<td class=qbutton>
				&emsp;<a href=qnaview?id=${board.id}><button id="btnMod">수정</button></a>
				&emsp;<button id="btnDel">삭제</button>
			</td>
		</c:if>
	</tr>
</c:forEach>
</table>
</div>

</body>

<script src='https://code.jquery.com/jquery-latest.js'></script>
<script>

$(document)
.on('click','#btnout',function(){
	$.ajax({
		type:'get',
		url:'/logout',
		data:{},
		dataType:'text',
		success:function(data){
			console.log("logout",data);
			location.reload();
		}
	})
})

.on("click","#btnDel",function(){
	console.log($(this).parent().parent().find('td:eq(0)').text());
	$.ajax({
		type:"post",
		url:"/deletePost",
		data:{id:$(this).parent().parent().find('td:eq(0)').text()},
		dataType:"text",
		success:function(data){
			if(data==0){
				alert("삭제 실패")
				return false;
			}
			console.log(1)
			alert("삭제 성공")
			location.reload();
			
		}
		
	})
	
})

</script>
</html>
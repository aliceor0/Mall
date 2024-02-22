<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

table {
    width: 800px;
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
h2{
	text-align: center;
}
input[type="text"], input[type="password"], textarea {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 10px;
    background-color: rgba(255, 255, 255, 0.8); /* Adjust the last value for transparency */
}
textarea{
	height:300px;
}
button {
    padding: 8px 12px;
    background-color: #3498db;
    color: #fff;
    border: none;
    cursor: pointer;
}

#btnAdd:hover, #btnReset:hover {
    background-color: #2980b9;
}

</style>
<body>
<header><a href="/">홈으로</a></header>


<div class=detail>

<h2>Q&A 작성</h2>
<hr>
<table>
<caption style="text-align:right"><a href="/qnaboard"><button id=btnBack>목록</button></a></caption>
<tr><td></td><td><input type="hidden" id=vid value="${board.id}" readonly></td></tr>
<tr><td>작성자</td><td><input type="text" id=vwriter value="${userid}" readonly></td></tr>
<%-- <tr><td>비밀번호</td><td><input type="password" id=vpasswd value="${board.passwd}"></td></tr> --%>
<tr><td>제목</td><td><input type="text" id=vtitle value="${board.title}"></td></tr>
<tr><td>내용</td><td><textarea id=vcontent>${board.content}</textarea></td></tr>
<%-- <tr><td>작성일</td><td><input type="text" id=vdate value="${board.created}" readonly></td></tr> --%>
<tr><td colspan=2 style="text-align:center">
	<br>
	<button id="btnAdd">등록</button>
	<button id="btnReset">비우기</button>
	</td></tr>
</table>
</div>
</body>
<script src='https://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.on('click','#btnAdd',function(){
	$.ajax({
		type:'get',
		url:'/savepost',
		data:{
			writer:$('#vwriter').val(),
			passwd:$('#vpasswd').val(),
			title:$('#vtitle').val(),
			content:$('#vcontent').val(),
		},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				console.log(data)
				document.location="/qnaboard"
			}
		}
	})
})

.on('click','#btnReset',function(){
	$('#vtitle,#vcontent,#vdate').val('')
})
</script>
</html>
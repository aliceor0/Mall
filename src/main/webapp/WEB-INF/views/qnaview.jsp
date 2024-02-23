<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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



<c:if test="${sessionScope.admin != null}">
관리자: <b>${admin}</b> 접속완료.<br>
</c:if>




<c:if test="${sessionScope.userid != null}">
	${userid} 님, 환영합니다.
	<input type="button" id=btnout value="로그아웃">
</c:if>

<c:if test="${sessionScope.userid == null}">
	<a href='/login'>로그인</a>
</c:if>
<div class=detail>
<table>
<caption style="text-align:right"><a href="/qnaboard"><button >목록</button></a></caption>
<tr><td></td><td><input type="hidden" id=vid value="${board.id}" readonly></td></tr>
<tr><td>작성자</td><td><input type="text" id=vwriter value="${board.writer}" readonly></td></tr>
<%-- <tr><td>비밀번호</td><td><input type="password" id=vpasswd value="${board.passwd}"></td></tr> --%>
<tr><td>제목</td><td><input type="text" id=vtitle value="${board.title}"></td></tr>
<tr><td>내용</td><td><textarea id=vcontent cols=20 rows=15>${board.content}</textarea></td></tr>
<tr><td>작성일</td><td><input type="text" id=vdate value="${board.created}" readonly></td></tr>
<c:if test="${chkadmin.admin == 1 || sessionScope.userid != null && sessionScope.userid == board.writer}">
	<tr>
		<td colspan=2 style="text-align:center">
			<br>
			<button id="btnMod">수정</button>
			<button id="btnDel">삭제</button>
		</td>
	</tr>
</c:if>
</table>

<hr>
<div>
	
		<table >
			<tr>
				<th >답글</th>
				<th>작성자</th>
				<th>제목</th>
				<th>내용</th>
				<th>시간</th>
				<th>수정/삭제</th>
				
			</tr>
		</table>
	
	<div>
		<table id=tblAnswer>
		
			
			
			
		</table>
	</div>
	<hr>
	<div>
		<table>
			<tr><td><input type=text id=userid value="${sessionScope.userid }" readonly></td></tr>
			<tr><td><input type=hidden id=updated readonly></td></tr>
			
			
			<tr><td><textarea id=contentAnswer rows=15 cols=30 placeholder=입력></textarea></td></tr>
			<tr><td><input type=button id=btnAnswer value="답글달기"></td></tr>
		</table>
	</div>
</div>

</div>

</body>

<script src='https://code.jquery.com/jquery-latest.js'></script>

<script>

$(document)
.ready(function(){
	viewList();
	
})
.on('click','#btnDel',function(){
	$.ajax({
		type:'post',
		url:'/deletePost',
		data:{id:$('#vid').val()},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				alert('삭제 완료')
				document.location="/qnaboard"
			}	
		}
	})
	
	
})
.on('click','#btnMod',function(){
	$.ajax({
		type:'get',
		url:'/modpost',
		data:{
			id:$('#vid').val(),
			writer:$('#vwriter').val(),
			passwd:$('#vpasswd').val(),
			title:$('#vtitle').val(),
			content:$('#vcontent').val(),
			created:$('#vdate').val()
		},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				location.href="/qnaboard";
			}
		}
	})
})

.on('click','#btnout',function(){
	$.ajax({
		type:'post',
		url:'/logout123',
		data:{},
		dataType:'text',
		success:function(data){
			console.log("logout",data);
			document.location="/qnaboard"
		}
	})
})


.on("click","#btnAnswer",function(){
	$.ajax({
		type:"post",
		url:"/qnaAnswer",
		data:{board_id:$('#vid').val(),username:$('#userid').val(),
				title:$("#vtitle").val(),inf:$('#contentAnswer').val(),
				updated:$("#updated").val()},
		dataType:"text",
		success:function(data){
			if($('#contentAnswer').val()==""){
				alert("빈값입니다 답글을 입력해주세요")
				return false;
			}
			console.log("data는 답글"+data)
			if(data=="1"){
				
				alert("답글성공")
				viewList();	
				$('#contentAnswer').val("");
			}
		}
	})

})
.on("click",'#btnClear',function(){
	let n=($(this).parent().parent().find('td:eq(0) input').val())
	$.ajax({
		type:"get",
		url:"/qnaRemove",
		data:{board_id:n},
		dataType:"text",
		success:function(data){
				location.reload();
				alert("삭제성공")
			
		}
	})
	
})


function viewList(){
	$.ajax({
		type:"get",
		url:"/showAnswer",
		data:{board_id:$('#vid').val()},
		dataType:"json",
		success:function(data){
			console.log("data는 리뷰"+data)
				$('#tblAnswer').empty();
				for(let i=0;i<data.length;i++){
					let ob=data[i]
					let str="";
					str+="<tr><td>답글란<input type=hidden id=reviewid value="+ob['id']+"></td><td>"+ob['username']+"</td><td>"+ob['title']+"</td><td>"
						+ob['inf']+"</td><td class='delete'>"+ob['updated']+'</td>'
						+'<c:if test="${sessionScope.admin != null}">'
						+'<td><input type=button  id=btnClear value=삭제></td></tr></c:if>'
					$('#tblAnswer').append(str)
					console.log(ob['username'])
				}
		}
		
	})
}






</script>
</html>
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
	a{
		text-decoration:none;
	}
	
	
</style>
<body>
<c:if test="${sessionScope.admin != null}">
관리자
</c:if>
<c:if test="${sessionScope.userid == null}">
	<a href='/login'>로그인</a><br>
	<a href="/signup">회원가입</a><br>
	<a href="/">홈으로</a>
</c:if>
<c:if test="${sessionScope.userid != null}">
	${userid} 님, 환영합니다.
	<input type="button" id=btnout value="로그아웃">
</c:if>

<h2>QnA 게시판</h2>
<a href="/">홈으로</a><br>
<c:if test="${sessionScope.userid != null}">
	<caption style="text-align:right"><a href="/qnawrite"><button>작성</button></a></caption>
</c:if>
<table>
<tr><th>번호</th><th>제목</th><th>저자</th><th>작성시각</th></tr>
<c:forEach var="board" items="${alqna}">
	<tr>
		<td>${board.id}</td>
		<td><a href=qnaview?id=${board.id}>${board.title}</a></td>
		<td>${board.writer}</td>
		<td>${board.created}</td>
		<c:if test="${sessionScope.admin != null || sessionScope.userid != null && sessionScope.userid == board.writer}">
			<td>
				&emsp;<a href=qnaview?id=${board.id}><button id="btnMod">수정</button></a>
				&emsp;<button id="btnDel">삭제</button>
			</td>
		</c:if>
	</tr>
</c:forEach>
</table>


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
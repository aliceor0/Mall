<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
<!DOCTYPE html>

<html>
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<style>
   body{
      background-image:url("https://img.lovepik.com/photo/50090/7442.jpg_wh860.jpg" ); 
      background-repeat: no-repeat;
      background-size:cover;
      text-align:center;
   }
	input{
		text-decoration:none;
	}
	a{
		text-decoration:none;
	}
</style>
<body>


<%
if(session.getAttribute("userid")!=null){
%>
<h1> 홈화면화면 입니다</h1><hr>
<b style=text-align:right>${userid}  님 안녕하세요~</b><br><hr>
<h3> 개인정보 목록입니다</h3>
<a href="logout"> 로그아웃</a>
<% } else { %>


<h1 style=text-align:center> 로그인페이지 입니다</h1>




<form method='post' action="/doLogin123" id=goLogin>	
	<table id=tblLogin align="right">
	<tr><td>아이디</td><td><input type=text name=userid id=userid></td></tr>
	<tr><td>비밀번호</td><td><input type=password name=passwd id=passwd></td></tr>
	<tr><td colspan=2><input type=submit value="로그인" id=btnLogin></td></tr>
	<tr><td colspan=2><a href="signup">회원가입</a></td></tr><br>
	<tr><td colspan=2><a href="/">홈으로</a></td></tr>
	</table>
</form>


<% } %>








</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>


$(document)


	.on("submit","#goLogin",function(){
		if($('#userid').val()==""  || $('#passwd').val()=="") {
				return false;
	} 
		
		
	})

// 	.on("click","#btnLogin",function(){
// 		$.ajax({
// 			type:'post',
// 			url:'/doLogin',
// 			data:{userid:$('#userid').val(),passwd:$('#passwd').val()},
// 			dataType:"text",
// 			success:function(data){
// 				console.log(data)
// 				if(data=="1"){
					
// 					alert("로그인성공")
// 					$('#tblLogin').hide();
// 					$('#tblLoggedin').show();
// 					console.log($('#tblLoggedin').show());
// 					let str = $('#userid').val()
// 					$('#tdUserid').text(str)
// 					console.log($('#tdUserid').text(str))
// 					$('#tblList tr').each(function(){
// 						$(this).find('td:last').show();
// 					})
// 					location.href="/";
				
// 				}else if(data=="2"){
// 					alert(" 관리자로그인성공")
// 					$('#tblLogin').hide();
// 					$('#tblLoggedin').show();
// 					console.log($('#tblLoggedin').show());
// 					let str = $('#userid').val()
// 					$('#tdUserid').text(str)
// 					console.log($('#tdUserid').text(str))
// 					$('#tblList tr').each(function(){
// 						$(this).find('td:last').show();
// 					})
// 					$('#tblAdd').show();
// 					location.href="/";
					
// 				} else{
// 					alert("로그인실패")
// 				}
// 				$('#userid,#passwd').val('');
// 			}
// 		})
// 		return false;
// 	})
</script>
</html>
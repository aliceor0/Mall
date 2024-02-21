<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<style>
    body {
        font-size:20px;
        text-align:center;
        background-image:url("https://memberclicks.com/wp-content/uploads/2021/11/New_Member_Welcome_Email.jpg"); 
     	background-repeat: no-repeat ; 
     	background-size: 50% 50% middle;
     	background-position : 630px 330px;
    }
    table {
        border-collapse: collapse;
        margin:auto;
        background-color:ivory;
       
    }
    td { border:1px solid grey;  font-size:20px; 
     text-align:center;}
    h1 { margin:auto; }
    input { font-size:18px; }
</style>

<body>
<form method="Post" action="/doSignup" id=frmSignup>
<h1>회원가입페이지입니다</h1>
<table>
<tr><td>
	아이디 : <input type=text id=userid name=userid required>중복확인:<input type=button id=checkId name=checkId value="확인"> <input type=hidden name=hcheckId id=hcheckId value=""><br>
	</td></tr>
<tr><td>	
	비밀번호 : <input type=password name=passwd id=passwd required><br></td></tr>
<tr><td>	
	비밀번호확인 : <input type=password name=passwd1 id=passwd1><br></td></tr>
<tr><td>이름: <input type=text name=name></td></tr>

<tr><td id=email>이메일: <input type=text name=emailAddress>@<input type=text name=emailAddress123  id=emailAddress123 >
				<select id=selemailAddress><option value="">직접입력</option><option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option><option value="hanmail.net">hanmail.net</option><option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option></select> </td></tr>
				
<tr><td>모바일번호: <input type=text name=mobile></td></tr>

<tr><td>	
	<input type=submit value="회원가입" id=btnGo name=btnGo>
	<input type=reset value="지우기" id=btnClear></td></tr>


	<tr><td> <a href="/">홈으로</a></td></tr>
</table>
</form>

	
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)

// 아이디 확인 칸 만들기
	.on('submit','#frmSignup',function(){
		if($('#passwd').val()==$('#passwd1').val()){
			console.log($('#passwd').val())
			console.log($('#passwd1').val())
			return true;	
		}
		
		return false;
	
		
	})
	
// 	.on("keypress","#btnGo",function(e,u){
// 		if(e.keyCode==13){
// 			$('#btnGo').trigger()
// 		}
		
// 	})
	.on("click","#checkId",function(){
		$.ajax({
			type:"get",
			url:"/checkId",
			data:{userid:$('#userid').val()},
			dataType:"text",
		    beforeSend:function(){
			    if($('#userid').val()==""){
				    alert("정확한 값을 입력하시오")
				    return false;
				    }
			    },
			success:function(data){
				if(data=="1"){
					alert("중복된 아이디입니다")
					return false;
				} 
				alert("사용가능합니다")
				$('#hcheckId').val($('#userid').val())
				console.log($('#hcheckId').val())
			}
		})
	})
	
// 	이메일 주소 옮겨담아서 
	$('#selemailAddress').change(function(){

		$('#emailAddress123').val($('#selemailAddress').val())
	
	});
	

	
</script>	
</html>

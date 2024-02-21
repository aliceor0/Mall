<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
</head>
<body>
제목:<input id=title>
이미지:<input id=img>
정보:<input id=inf>
<button id=btnGo>저장</button>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#btnGo',function(){
	$.ajax({
		type:'post',
		url:'addEvent',
		data:{title:$('#title').val(),img:$('#img').val(),inf:$('#inf').val()},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				alert('추가완료')
				$('#title,#img,#inf').val('')
			}
		}
	})
})
</script>
</html>

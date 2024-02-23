<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<style>
    table{
        border-collapse: collapse;    
    }
    tr{
        border: 1px solid black;
    }
    .container {
        position: relative;
    } 
    .w{
        vertical-align: top;
        position: absolute;
    }
    .category{
        width: 180px;
    }
    .top{
        vertical-align: top;
    }
    .border{
        border : 0px;
    }
    li{
        float: left;
        list-style-type: none;
        padding-right: 50px;
    }
    .div{
    	width:150px;
    }
    a {
	  text-decoration: none;
	  color:black;
	}
</style>
<body>

	<h1 align="center">앙앙 서점</h1>
 <% 
if(session.getAttribute("userid")!=null){
 %> 
   <table align="right">
      <tr>
         <td>
            <b style=text-align:right> ${sessionScope.userid}  님 안녕하세요~</b>
         </td>
      </tr>
      <tr>
         <td>
            <a href="basketList">장바구니로 이동하기</a>         
         </td>
      </tr>
      <tr>   
         <td>
            <a href="/gomypage">마이페이지로 이동하기</a>
         </td>
      </tr>
      <tr>
         <td>
            <a href="logout"> 로그아웃</a>
         </td>
      </tr>
   </table>

<% if(session.getAttribute("admin")!=null) {
%>
<table id=tblAdd align='right' >
   <tr><td>관리자아이디:${admin }</td></tr>
   <tr ><td><a href="/pregist">추가하기</a></td></tr>
</table>
<%} %>


<% } else { %>

<table id=tblLogin align="right">
   <tr><td colspan=2><a href="/login">로그인</a></td>
   <td><a href="/signup">회원가입</a></td></tr>
</table>

 <% } %>
    <br><br><br><br><br><br>

	<table align="center" style=width:50%>
	 	<tbody ><tr><th>하이미디어 책방</th></tr>
		 <tr><td>
				검색엔진
		 </td></tr></tbody>
		  <tr>	
		 	<td> <input type="text" id="bookTitle" name="bookTitle" style=width:94% placeholder="검색어를 입력하시오"></td>
      		<td> <button id="btnSearch">검색</button></td>
    	</tr>
		
    </table>




<div>
	<table id=tblbookList>
	
	</table>
</div>

    <table class="container" style="width:80%; height: 10px; margin: auto; id-">
		<tr>
			<td>
                <div>
                    <div class="container">
                        <ul>
                            <li id="a">카테고리</li>
                            <li id="b">베스트셀러</li>
                            <li id="c">새로나온 책</li>
                            <li id="d">이벤트</li>
                            <li id="l">추천도서</li>
                        </ul>
                    </div>
                </div>
                <div class="container" style="display: none; width: 100%; position: absolute; padding-top:20px;" id="1">
                    <div class="w" style="background-color: rgb(255, 255, 255); height: 220px;width: 73%;">
                        <table>
                            <tr class="top">
                                <td>
                                    <table>
                                    <th colspan="2">국내도서</th>
                                    <tr  class="border"><td class="category">운동</td><td class="category">요리</td></tr>
                                    <tr  class="border"><td class="category">건강/취미</td><td class="category">자습서/학습서</td></tr>
                                    <tr  class="border"><td class="category">공무원 수험서</td><td class="category">유아</td></tr>
                                    <tr  class="border"><td class="category">과학</td><td class="category">인문학</td></tr>
                                    <tr  class="border"><td class="category">대학교재</td><td class="category">잡지</td></tr>
                                    <tr  class="border"><td class="category">만화</td><td class="category">장르소설</td></tr>
                                    <tr  class="border"><td class="category">사회과학</td><td class="category">종교/역학</td></tr>
                                    <tr  class="border"><td class="category">소설/시/희곡</td><td class="category">컴퓨터/모바일</td></tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <th colspan="2">외국도서</th>
                                        <tr  class="border"><td class="category">ELT/어학/사전</td><td class="category">그림책</td></tr>
                                        <tr  class="border"><td class="category">건강/스포츠</td><td class="category">동화책</td></tr>
                                        <tr  class="border"><td class="category">가정/원예/인테리어</td><td class="category">영어학습</td></tr>
                                        <tr  class="border"><td class="category">요리</td><td class="category">잡지</td></tr>
                                        <tr  class="border"><td class="category">역사</td><td class="category">인문/사회</td></tr>
                                        <tr  class="border"><td class="category">여행</td><td class="category">청소년</td></tr>
                                        <tr  class="border"><td class="category">만화</td><td class="category">코스북</td></tr>
                                        <tr  class="border"><td class="category">종교/명상/점술</td><td class="category">챕터북</td></tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <th>e-book</th>
                                        <tr  class="border"><td class="category"><a href="/page?id=2">경제/경영</a></td></tr>
                                        <tr  class="border"><td class="category"><a href="/page?id=1">건강/취미</a></td></tr>
                                        <tr  class="border"><td class="category"><a href="/page?id=3">과학</a></td></tr>
                                        <tr  class="border"><td class="category"><a href="/page?id=4">로맨스</a></td></tr>
                                        <tr  class="border"><td class="category"><a href="/page?id=5">만화</a></td></tr>
                                        <tr  class="border"><td class="category"><a href="/page?id=6">판타지/무협</a></td></tr>
                                        <tr  class="border"><td class="category"><a href="/page?id=7">라이트노벨</a></td></tr>

                                        </table>
                                </td>
                                <td>
                                    <table>
                                        <th>온라인중고</th>
                                        <tr  class="border"><td class="category">경제/경영</td></tr>
                                        <tr  class="border"><td class="category">건강/취미</td></tr>
                                        <tr  class="border"><td class="category">만화</td></tr>
                                        <tr  class="border"><td class="category">사회과학</td></tr>
                                        <tr  class="border"><td class="category">소설/시/희곡</td></tr>
                                        <tr  class="border"><td class="category">에세이</td></tr>
                                        <tr  class="border"><td class="category">유아</td></tr>
                                        <tr  class="border"><td class="category">인문학</td></tr>
                                        </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </td>
		</tr>
	</table>
    <table style="width:80%; height: 500px; margin: auto;" id="tblboard" align="center" >
        <tr style="display:none " id=choice>
        </tr>
        <tr style="display:none" id=event>
        </tr>
        <tr style="display:none" id=new>
        </tr>
        <tr style="display:none" id=hot>
        </tr>
		<tr style="height: 10%; text-align: center;"> 
            <td align="center"><div class="div" id=w>편집장의 선택</div></td><td align="center"><div class="div" id=q>추천 이벤트</div></td>
            <td align="center"><div class="div" id=e>신간 소개</div></td><td align="center"><div class="div" id=r>화제의 책</div></td>
        </tr>
    </table>
    <table border="1" id="tblList" style="margin: auto;">
        
    </table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	getList()
	$.ajax({
	  type:'post',
	  url:'/choice',
	  data:{},
	  dataType:'json',
	  success:function(data){
		for(let i=0;i<data.length;i++){
			let ob=data[i]
			let str='<td style="width: 25%;"><table style="margin: auto;width: 250px; height: 300px;"><tr><td style="height: 85%;"><a href="/details?book_id='+ob['id']+'"><img src="'+ob['image']+'"></a></td></tr><tr><td>'+ob['name']+'</td></tr><tr><td>'+ob['price']+'원</td></tr></table></td>'
			$('#choice').append(str)
		  }
		$('#choice').show();
		$('#w').css("background-color", "#5882FA");
	  }
  })
  
	$.ajax({
			type:'post',
			url:'/eventList',
			data:{},
			dataType:'json',
			success:function(data){
				let str='<td style="width: 100%;;" colspan=4>'
				for(let i=0;i<data.length;i++){
					let ob=data[i]
					str+='<div style="float:left; width:30%; padding:20px;"><table style="margin: auto;width: 250px; height: 300px;display:inline;"><tr><td style="text-align:center">'+ob['title']+'</td></tr><tr><td style="text-align:center">'+ob['inf']+'</td></tr><tr><td style="height: 85%;"><a href="/eventpage?book_id='+ob['id']+'"><img src="'+ob['img']+'"></a></td></tr></table></div>'
					
				}
				str+='</td>'
			$('#event').append(str)
			}
		})	
	
	$.ajax({
		type:'post',
		url:'/newList',
		data:{},
		dataType:'json',
		success:function(data){
			console.log(data)
			console.log(data.length)
			console.log(data[0])
			for(let i=0;i<data.length;i++){
				let ob=data[i]
				let str='<td style="width: 25%;"><table style="margin: auto;width: 250px; height: 300px;"><tr><td style="height: 85%;"><a href="/details?book_id='+ob['id']+'"><img src="'+ob['image']+'"></a></td></tr><tr><td>'+ob['name']+'</td></tr><tr><td>'+ob['price']+'원</td></tr></table></td>'
				$('#new').append(str)
			  }
		}
	})
	
})
.on("keypress","#bookTitle",function(e,u){
	if(e.keyCode==13){
		if($('#bookTitle').val()==""){
			return false;
			
		}
		$('#btnSearch').trigger('click');
	}
})

.on("click","#btnSearch",function(){
	console.log('1')
	$.ajax({
		type:"get",
		url:"/getSearchList",
		data:{bookTitle:$('#bookTitle').val()},
		dataType:"json",
		beforeSend:function(){
			if($('#bookTitle').val()=="")return false;	
		},
		success:function(data){
			$('#tblbookList').empty();
			console.log('data는검색'+data)
				for(let i=0;i<data.length;i++){
					let ob=data[i]
					let str="";
					str+='<td><table style="margin: auto;width: 250px; height: 300px;"><tr><td style="height: 85%;">'
					+'<a href="/details?book_id='+ob['id']+'">'
					+'<img src="'+ob['image']+'"></a></td></tr><tr><td>제목: '+ob['name']+'</td></tr><tr><td>작가: '+ob['author']+'</td></tr><tr><td>가격: '+ob['price']+'원</td></tr></table></td>'
					$('#tblbookList').append(str)
				}
		}
	})
})



$('#a,#1').hover(function(){
    $('#1').show()
    $('#1').css('z-index','2')
    
},function(){
    $('#1').hide()
})

$('#w').hover(function() {
	$('#event').hide();
	$('#new').hide();
	$('#hot').hide();
 	$(this).css("background-color", "#5882FA");
 	$('#choice').show();
 	$('#q,#e,#r').css("background-color","white");
})

$('#q').hover(function() {
	$('#choice').hide();
	$('#new').hide();
	$('#hot').hide();
	$('#event').show();
	$(this).css("background-color", "#5882FA");
	$('#w,#e,#r').css("background-color","white");
	
})

$('#e').hover(function() {
	$('#choice').hide();
	$('#event').hide();
	$('#hot').hide();
	$('#new').show();
	
	$(this).css("background-color", "#5882FA");
	$('#q,#w,#r').css("background-color","white");
})

$('#r').hover(function() {
	$('#choice').hide();
	$('#event').hide();
	$('#new').hide();
	$('#hot').show();
	$(this).css("background-color", "#5882FA");
	$('#q,#e,#w').css("background-color","white");
})







	
	





function getList(){
	$.ajax({
		type:'get',
		url:'/getList',
		data:{},
		dataType:'json',
		success:function(data) {
			$('#tblList').empty()
			let j=0
			let k=4
			for(let i=0;i<data.length;i++) {
				let str='<tr>'
				for(j;j<k;j++){
					if(j==data.length){
						break
					}
					let ob=data[j]
					str+='<td><table style="margin: auto;width: 250px; height: 300px;"><tr><td style="height: 85%;"><a href="/details?book_id='+ob['id']+'"><img src="'+ob['image']+'"></a></td></tr><tr><td>'+ob['name']+'</td></tr><tr><td>'+ob['price']+'원</td></tr></table></td>'
					
				}
				str+='</tr>'
				$('#tblList').append(str)
				k+=4
				i=j
			}
		}
	})
}
</script>
</html>
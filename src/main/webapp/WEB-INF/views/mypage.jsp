<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지입니다</title>
</head>
<style>
		select{ 
			behavior: url('/inc/selectBox.htc');
		}
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        #basketList02 {
            display: flex;
        }

        #basketList03 {
            width: 20%;
            background-color: lightgrey;
            padding: 20px;
        }

        #basketList01 {
            flex: 1;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

</style>
<body>
 <% 
if(session.getAttribute("userid")!=null){
 %> 

	
	
	<div>
		<div>
			<h3>마이페이지 화면 입니다</h3><hr>
			<h4><b style=text-align:right> ${sessionScope.userid}  님 안녕하세요~</b><br></h4>
		</div>
		<div>		
			<table>
				<tr>
					<td>
						<a href="godeliveryList">배송조회</a>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table>		
				<tr>
					<td>
						<a href="/buyList">결제내역상세</a>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table>		
				<tr>
					<td>
						<a href="/qnaboard">QNA페이지로 이동</a>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table>
				<tr>
					<td>
						<a href="goreviewList">리뷰쓰기</a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="logout"> 로그아웃</a>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<% if(session.getAttribute("admin")!=null) {
	%>
	<table id=tblAdd align='right' >
		<tr><td>관리자아이디:${admin }</td></tr>
		<tr ><td><a href="/pregist">상품등록하기</a></td></tr>
	</table>
	<%	} %>
<% } %>


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>



</script>

</html>
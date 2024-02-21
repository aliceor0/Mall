<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>		
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
		<td><a href="/deletebook?id=${book.id}"><button id=btnDelB>삭제</button></a></td>
	</tr>
</c:forEach>
</table>
</body>
</html>
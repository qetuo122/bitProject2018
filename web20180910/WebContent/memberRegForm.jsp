<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form action = "memberReg.jsp">
<table>
	<tr>
		<td>아이디</td>
		<td><input name = "id"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input name = "name"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input name = "email"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input name = "address"></td>
	</tr>
	<tr>
		<td colspan="2"><input type = "submit" value = "가입"></td>
	</tr>
</table>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
String name = request.getParameter("name");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String pwdOk = request.getParameter("pwdOk");
String privateNum = request.getParameter("privateNum");
String homeNum = request.getParameter("homeNum");
String home = request.getParameter("home");
String job = request.getParameter("job");
String hobby = request.getParameter("hobby");
String self = request.getParameter("self");

%>
<style>
	form{
		width : 600px;
		border: 1px solid black;
		padding : 30px; 20%;
	}
	.lavel{
		width : 20%;
		float : left;
	}
	.bottom{
	text-align : center;
	}
	input[type=submit]{
		background-color: #4CAF50;
    	border: none;
    	color: white;
    	padding: 16px 32px;
	}
</style>
<body>
	<h1>회원가입이 완료되었습니다!</h1>
	<div class = "all">
	<form action = "">
		<div class = "middle">
		<div class = "lavel"><label for = "name">이름</label></div><%=name %><br>
		<div class = "lavel"><label for = "id">ID</label></div><%=id %><br>
		<div class = "lavel"><label for = "pwd">비밀번호</label></div><%=pwd %><br>
		<div class = "lavel"><label for = "privateNum">주민등록번호</label></div><%=privateNum %><br>
		<div class = "lavel"><label for = "homeNum">우편번호</label></div><%=homeNum %><br>
		<div class = "lavel"><label for = "home">주소</label></div><%=home %><br>
		<div class = "lavel"><label for = "job">직업</label></div><%=job %><br>
		<div class = "lavel"><label for = "hobby">취미</label></div><%=hobby %><br>
		<div class = "lavel"><label for = "self">자기소게</label></div><%=self %><br>
		</div>
		<div class = "bottom"><input type = "submit"  value = "확인"></div>
	</form>
	</div>
</body>
</html>
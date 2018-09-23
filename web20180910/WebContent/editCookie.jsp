<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies(); //저장된 쿠키를 배열에 불러옴
		
		for(int i = 0; i < cookies.length; i++){
			Cookie c = cookies[i]; //불러온 쿠키를 보여줌
			
			if(c.getName().equals("id")){
				Cookie cookie = new Cookie("id","hot"); //기존에 저장딘 쿠키를 새로운 내용으로 바꿈
				response.addCookie(cookie); //수정된 쿠키를 저장
			}
		}
	%>
	<h1>쿠키값 변경</h1>
	<a href = "viewCookie.jsp">쿠키 확인</a>
</body>
</html>
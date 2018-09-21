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
		Cookie[] cookies = request.getCookies(); //저장된 쿠키를 받아옴
		
		if(cookies != null && cookies.length > 0){ //쿠키가 존재한다면
			for(int i = 0; i < cookies.length; i++){
				if(cookies[i].getName().equals("id")){ // 불러온 쿠키중에 id라는 키를 가진 쿠키를 찾는다.
					Cookie c = new Cookie("id","");
					c.setMaxAge(0); //쿠키를 삭제함
					response.addCookie(c); // 삭제한 쿠키를 저장
				}
			}
		}
	%>
	<h1>쿠키 삭제</h1>
	<a href = "viewCookie.jsp">쿠키확인 </a>
</body>
</html>
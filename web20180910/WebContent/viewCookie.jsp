<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<% 
			//쿠키를 배열형태로 받아옴
			Cookie[] cookies = request.getCookies();
		
			if(cookies != null && cookies.length > 0){
				
				for (int i = 0; i < cookies.length; i++){
				%>
				<%= cookies[i].getName() %> = <%= cookies[i].getValue() %><br>
				<%
				}
			} else {
				%>
				저장된 쿠키정보가 없습니다.
				<%
			}
		%>
		
		//// ${cookie.id.value}  <!-- <---- 쿠키에 있는 id에 저장되어있는 벨류값을 가져옴 --> 
	</h1>
	아이디<input type = "text" value = "${cookie.id.value}"> <!-- //결과값이 null이면 el표현식은 공백으로 표현됨 <%=%>는 null로 표현 -->
		<a href = "editCookie.jsp">쿠키 변경</a>
		<a href = "deleteCookie.jsp">쿠키 삭제</a>
	
</body>
</html>
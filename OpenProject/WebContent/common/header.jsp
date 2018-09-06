<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 class = "title">OpenProject</h1>
    <ul id = "gnb">
    	<li><a href="index.jsp">메인</a></li>
        <li><a href="memberRegForm.jsp">회원가입</a></li>
        <%
        	String uid = (String)request.getSession(false).getAttribute("userId");
        	if(uid == null) {
        %>
        <li><a href="loginform.jsp">로그인</a></li>
        <%
        	} else{ %>
        	<li><a href="logout.jsp">로그아웃</a></li>
        <% } %>
        <li><a href="myPage.jsp">마이페이지(회원)</a></li>
        <li><a href="#">회원리스트(회원)</a></li>
    </ul>
    
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id = "member" class = "member.MemberInfo" scope = "request"/>
 <!-- 해당 빈 객체가 없으면 생성하고 있으면 불러온다. -->
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<h1><%= member.getName() %>(<%=member.getId() %>)님 접속되었습니다.</h1>
</body>
</html>
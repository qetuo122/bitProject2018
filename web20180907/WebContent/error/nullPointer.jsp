<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isErrorPage = "true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
null에러
<h3> 에러타입 : <%= exception.getClass().getName() %></h3>
<h3> 에러 메시지 : <%= exception.getMessage() %></h3>
</body>
</html>
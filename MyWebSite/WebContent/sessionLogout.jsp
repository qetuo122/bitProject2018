<%@ page contentType="text/html; charset=utf-8"%>
<%
	session.invalidate();
%>
<html>
<head>
</head>
<body>
<%
response.sendRedirect("/Hello.jsp");
%>
</body>
</html>

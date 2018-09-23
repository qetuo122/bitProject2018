<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setAttribute("id", "cool"); //리퀘스트 객체에 속성을 입력
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	기본객체 사용 : <br>
	요청 URI : ${pageContext.request.requestURI}
	
	<hr>
	
	request 속성 확인 id : ${requestScope.id }
	
	<hr>
	
	파라미터 확인 code : ${param.code} <%-- null이므로 공백으로 표현될것 <% request.getParameter()%>를 사용 안해도됨 --%>

</body>
</html>
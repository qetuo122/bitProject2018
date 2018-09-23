<%@page import="test.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Thermometer t = new Thermometer();
	request.setAttribute("t", t); // Thermometer 객체를 생성하고 request에 저장함
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${t.setCelsius('서울',27.3) } 온도설정 <br>
	
	서울 온도 : 섭씨 - ${t.getCelsius('서울')}
	
	<br>
	
	서울 온도 : 화씨 - ${t.getFahrenheit('서울')}
	
	정보 : ${t.info}
</body>
</html>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String userName = request.getParameter("userName");
	String address = request.getParameter("address");
	
%>
userName 파라미터 : <%= userName %> <br>
address 파라미터 : <%= address %>

<hr>

<%
	String[] pets = request.getParameterValues("pet");
	
	if(pets != null) {
		for(int i = 0; i < pets.length; i++){
				%>
				
				<%= pets[i] %> <br>
				<%
		}
	}
%>
<hr>
<%
	Enumeration enumParam = request.getParameterNames();
	while(enumParam.hasMoreElements()){ // enumParam을 차례대로 검색하여 값이 없을때까지 반복
		String name = (String)enumParam.nextElement(); //enumParam은 오브젝트 타입이므로 스트링 타입으로 변환
		%>
		<%= name %> <%= request.getParameter(name) %> <br> 
		<%
	}
%>
<hr>
<%
	Map mapParam = request.getParameterMap();
	String[] userNames = (String[])mapParam.get("userName"); //map의 값은 오브젝트타입이므로 스트링 배열로 형변환
	
	if(userNames != null){
		%>
		userName : <%= userNames[0] %>
		<%
	}
%>

	
</body>
</html>
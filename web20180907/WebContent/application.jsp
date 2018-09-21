<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	String path = "/message/notice/notice.txt";
%>



	<%= application.getRealPath(path) %>
	
	
	
	
<%
	BufferedReader br = null;
	char[] buff = new char[512]; //512개가 채워지면 보내는 배열
	int len = -1; //보내야되는 길이(마지막에 더이상 보낼것이 없을때 -1이 됨)
	
	br = new BufferedReader(new InputStreamReader(application.getResourceAsStream(path)));
	
	while((len = br.read(buff)) != -1){ 
		out.print(new String(buff, 0, len)); //스트링 객체로 만들어주는것(buff를 0번째부터 len까지)
	}

	
%>

</body>
</html>
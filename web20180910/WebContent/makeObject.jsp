<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:useBean id = "member" class = "member.MemberInfo" scope = "request"/>
<!-- 클래스이름에는 패키지 주소를 포함한 풀네임을 사용한다. 스코프를 사용하면 setAttribute등을 사용하지 않아도 된다. -->

<%
	member.setId("cool");
	member.setName("유영진");
%>
<jsp:forward page="useObject.jsp"></jsp:forward>
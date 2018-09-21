<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<String> members = new ArrayList<String>();
	members.add("홍길동1");
	members.add("철수2");
	members.add("영희3");
	members.add("홍길동4");
	members.add("철수5");
	members.add("영희6");
	members.add("홍길동7");
	members.add("철수8");
	members.add("영희9");
	
	request.setAttribute("members", members);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:redirect url = "/useElObject.jsp"> <!-- ElObject페이지로 넘김 -->
	<c:param name="code">1111</c:param> <!-- code에 1111값을 넣음 -->

</c:redirect>

<hr>

<c:url value = "/jstl_1.jsp" var = "target"> <!-- 현재페이지로 보냄 -->
	<c:param name = "sel">c</c:param> <!--sel값에 c를추가  -->
</c:url>

경로 : ${target} <br>
<a href = "${target}">c페이지</a>

<hr>


<ul>
<c:forEach items = "${members}" var = "mem" begin = "0" end = "5" varStatus = "status"> <!-- //mem는 반복문 안에서만 사용할수 있는 변수 -->
	
	<li>${status.index} - ${status.count} - ${mem}</li> <!-- varStatus를 이용해 인덱스와 카운트 값을 가져올 수 있음 -->
	
</c:forEach>
</ul>
<table border = 1px>
<tr>
<c:forTokens var = "sel" items = "홍길동 / 010-9999-7777 / qetuo122@naver.com / 서울" delims = "/">
	<td>${sel} </td>
</c:forTokens>
</tr>
</table>

<hr>
<c:choose>
	<c:when test="${param.sel == 'a' }">
	<h3>a를 선택!!!!!!!!!!!!!!!!!!!!!</h3>
	</c:when>
	<c:when test="${param.sel == 'b' }">
	<h3>b를 선택!!!!!!!!!!!!!!!!!!!!!</h3>
	</c:when>
	<c:when test="${param.sel == 'c' }">
	<h3>c를 선택!!!!!!!!!!!!!!!!!!!!!</h3>
	</c:when>
	<c:otherwise>
	a,b,c 이외의 선택!!!!!!!!!!!!!!!
	</c:otherwise>
</c:choose>

<select>
	<option ${param.sel == 'a' ? 'selected' : ''}>a</option>
	<option ${param.sel == 'b' ? 'selected' : ''}>b</option>
	<option ${param.sel == 'c' ? 'selected' : ''}>c</option>
</select>

<hr>

<table border = 1>
	<c:forEach var = "name" items = "${members}"> <!-- //  name의 변수로 사용 가능 items안에는 데이터 원본이 들어감 -->
	<tr>
		<td>
			<c:out value="${name}" escapeXml = "false">
				<span style = "color:red;">이름없음</span> <!-- 값이 null일때 표현됨 -->
			</c:out>
		</td>
	</tr>
	</c:forEach>
</table>


</body>
</html>
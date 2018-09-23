<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class = "member.MemberInfo"/> <!-- 스코프가 다르므로 useBean 새로 생성함 -->
<jsp:setProperty property="*" name="member"/><!-- usebean의 아이디와 프로퍼티 네임이 같아야함. form에서 전달한 값이 다 들어가있음-->
<jsp:setProperty property="password" name="member" value = "<%=member.getId() %>"/> <!--form에 비밀번호가 없으므로 프로퍼티를 생성해줌 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 가입 정보</h1>
<table>
	<tr>
		<td>아이디</td>
		<td><%= member.getId() %> / ${member.id}</td> <!--${member.id}는 변수를 호출하는 것이 아닌 메서드를 호출하는것  -->
	</tr>
	<tr>
		<td>이름</td>
		<td><%= member.getName() %> / ${member.name}</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%= member.getPassword() %> / ${member.password}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%= member.getEmail() %> / ${member.email}</td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%= member.getAddress() %> / ${member.address}</td>
	</tr>
	<tr>
		<td colspan="2"><input type = "submit" value = "가입"></td>
	</tr>
</table>
</body>
</html>
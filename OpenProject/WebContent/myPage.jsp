<%@page import="member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	MemberInfo mem = (MemberInfo) request.getSession(false).getAttribute("members");

	if(mem == null){
		%>
		<script>
		alert("로그인후 이용가능합니다.");
		location.href("loginform.jsp");
		</script>
		<%
	}else {
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
<style>
	h2, td {
		padding : 10px;
	}
	#memberPhoto{
	background-image : url('images/imagesi.png');
	background-size : 100%;
	width : 150px;
	height : 150px;
	border : 1px solid #333333;
	border-radius : 75px;
	margin : 20px 10px;
	}
</style>
</head>
<body>
<%@ include file = "common/header.jsp" %>

<div id = #contents>
	<h2>회원 정보</h2>

	<div id = "memberPhoto">
	<img alt="회원사진" src="<%= request.getContextPath()%>/uploadfile/${mem.photoFile}">
	</div>
    <hr>
        <table>
            <tr>
                <td>아이디(이메일)</td>
                <td>${mem.userId}</td>
            </tr>
            
            <tr>
                <td>이름</td>
                <td>${mem.userName}</td>
            </tr>
            
        </table>
</body>
</html>
<%}%>
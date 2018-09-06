<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String id = (String)request.getSession(false).getAttribute("userId"); //오브젝트로 들어오므로 스트링으로 타입변경
	String name = (String)request.getSession(false).getAttribute("userName");
	
	if(id == null) {
		%>
		<script>
			alert('로그인 후 사용가능한 서비스 입니다.');
			location.href = 'loginform.jsp';
		</script>
		<%
	} else {
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

	<div id = "memberPhoto"></div>
    <hr>
        <table>
            <tr>
                <td>아이디(이메일)</td>
                <td><%= id %></td>
            </tr>
            
            <tr>
                <td>이름</td>
                <td><%= name %></td>
            </tr>
            
        </table>
</body>
</html>
<%} %>
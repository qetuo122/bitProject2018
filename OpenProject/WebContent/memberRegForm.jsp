<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<%@ include file = "common/header.jsp" %>

<div id = #contents>
<h2>회원 가입</h2>
    <hr>
    <form action = "memberReg.jsp" method = "post">
        <table>
            <tr>
                <td>아이디(이메일)</td>
                <td><input type="text" name = "userId"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name = "password"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type = "text" name = userName></td>
            </tr>
            <tr>
                <td>사진</td>
                <td><input type="file"  value = "사진선택"  alt = "사진없음" name = "photoFile"></td>
            </tr>
            <tr>
                <td colspan="2"><input type = "submit" value = "등록"></td>
            </tr>
        </table>
    </form>
</body>
</html>
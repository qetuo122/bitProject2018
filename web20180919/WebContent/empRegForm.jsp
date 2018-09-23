<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="empReg.jsp" type = "psot">
	<table>
		<tr>
			<td>사원번호</td>
			<td><input type = "text"  name = "empno" ></td>
		</tr>
		<tr>
			<td>사원이름</td>
			<td><input type = "text"   name = "ename"></td>
		</tr>
		<tr>
			<td>사원직급</td>
			<td><input type = "text"   name = "job"></td>
		</tr>
		<tr>
			<td colsapn = "2"><input type = "submit" value = "등록"></td>
		</tr>
	</table>
</form>
</body>
</html>
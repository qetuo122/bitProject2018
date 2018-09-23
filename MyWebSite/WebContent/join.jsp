<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	h1 {
	font-size : 30px;
	}
	form {
		border: 1px solid black;
		width : 600px;
		padding : 20px;
	}
	.label {
		width : 20%;
		float: left;
	}
	.input{
		width : 100%;
	}
	.self{
		width : 70%;
		height : 200px;
	}
	.bottom{
		padding-top : 10px;
		text-align : center;
	}
	input[type=submit], input[type=reset]{
		background-color: #4CAF50;
    	border: none;
    	color: white;
    	padding: 16px 32px;
	}
	
</style>

</head>
<body>
	<h1>회원가입</h1>
	<form action = "/joinAction" method = "post">
		<div class = "label">*이름</div> 
			<div class = "rightText"><input type = "text" name = "name" required></div> <br>
		<div class = "label">*ID</div> 
			<div class = "rightText"><input type = "text" name = "id" required>  <input type = "button" name = "same" value = "중복검사"></div> <br>
		<div class = "label">*비밀번호</div> 
			<div class = "rightText"><input type = "text" name = "pwd" required></div> <br>
		<div class = "label">*비밀번호 확인</div> 
			<div class = "rightText"><input type = "text" name = "pwdOk" required></div> <br>
		<div class = "label">*주민등록번호</div> 
			<div class = "rightText"><input type = "text" name = "privateNum" required>-<input type = "text" name = "privateNum" required></div> <br>
		<div class = "label">*우편번호</div>
			<div class = "rightText"><input type = "text" name = "homeNum" required>  <input type = "button" name = "serch" value = "우편번호 검색"></div><br>
		<div class = "label">*주소</div> 
			<div class = "rightText"><input type = "text" name = "address" required></div> <br>
		<div class = "label">*직업</div>
			<div class = "rightText"><select name = "job">
				<option value = "학생"> 학생 </option>
				<option value = "백수"> 백수 </option>
				<option value = "직장인"> 직장인 </option>
			</select></div> <br>
		<div class = "label">*취미</div> 
			<div class = "rightText">
			<input type = "checkBox" class = "hobby" name = "hobby" value = "독서" >독서
			<input type = "checkBox" class = "hobby" name = "hobby" value = "드라이브" >드라이브
			<input type = "checkBox" class = "hobby" name = "hobby" value = "영화" >영화
			<input type = "checkBox" class = "hobby" name = "hobby" value = "콘서트" >콘서트
			<input type = "checkBox" class = "hobby" name = "hobby" value = "쇼핑" >쇼핑
			<input type = "checkBox" class = "hobby" name = "hobby" value = "놀이동산" >놀이동산 </div> <br>
		<div class = "label">자기소개</div> 
			<textarea class = "self" name = "self" cols="30" rows = "10" placeholder = "자기소개를 입력해주세요" ></textarea><br>
		<div class = "bottom"><input type = "submit"  value = "가입완료">     <input type = "reset"  class = "cancle" value = "취소"></div>
	</form>
</body>
</html>
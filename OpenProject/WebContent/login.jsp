<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("userId");
	String pwd = request.getParameter("password");
	
	List members = new ArrayList<MemberInfo>();
	
	if (application.getAttribute("members") != null) {
		
        members = (ArrayList) application.getAttribute("members");
    }
		
	
%>
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
	<h2>회원 로그인</h2>
    <hr>
    <h1> 아이디 또는 비밀번호가 틀립니다. 확인해주세요.</h1>
    <h1><a href = "loginform.jsp"> 다시 로그인 하기</a></h1>
    </div>
    <%  //아이디와 비밀번호가 빈칸이 아니라면
    	if(id !=null && pwd != null){
    		//저장된 아이디와 비밀번호를 불러와서 사용자가 입력한 값과 비교
    		for(int i = 0; i < members.size(); i++){
    			//기존에 저장된 정보를  불러옴
    			MemberInfo mem = (MemberInfo) members.get(i);
    			//로그인이 되면 세션에 정보를 저장
    			if(mem.getUserId().equals(id) && mem.getPassword().equals(pwd)){
    				request.getSession(false).setAttribute("members", new MemberInfo(mem.getUserId(),"",mem.getUserName(),mem.getPhotoFile()));
    				response.sendRedirect("myPage.jsp");
    			}
    		}
    		
    	}
    %>
</body>
</html>
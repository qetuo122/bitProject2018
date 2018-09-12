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
	String rememberChk = request.getParameter("rememberChk");
	
	List members = new ArrayList<MemberInfo>();
	
	if (application.getAttribute("members") != null) {
		
        members = (ArrayList) application.getAttribute("members");
    }
		
	
%>
    <%  //아이디와 비밀번호가 빈칸이 아니라면
    	if(id !=null && pwd != null){
    		//저장된 아이디와 비밀번호를 불러와서 사용자가 입력한 값과 비교
    		for(int i = 0; i < members.size(); i++){
    			
    			//기존에 저장된 정보를  불러옴
    			MemberInfo mem = (MemberInfo) members.get(i);
    			
    			//로그인이 되면 세션에 정보를 저장
    			if(mem.getUserId().equals(id) && mem.getPassword().equals(pwd)){
    				
    				request.getSession().setAttribute("members", new MemberInfo(mem.getUserId(),"",mem.getUserName(),mem.getPhotoFile()));
					
    				// 아이디 기억박스가 체크되어 있으면
    				if(rememberChk != null){
    					Cookie cookie = new Cookie("id",id);
    					response.addCookie(cookie);
    					
    				//아이디 기억박스가 해제되어 있으면
    				} else{
    					Cookie cookie = new Cookie("id","");
    					cookie.setMaxAge(0);
    					response.addCookie(cookie);
    				}
    				
    				response.sendRedirect("myPage.jsp");
    			} 
    		}
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
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
 
 <%
 
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String userName = request.getParameter("userName");	
	String photoFile = request.getParameter("photoFile");
	List memList = new ArrayList();
	
	if(application.getAttribute(userId) != null){
		memList.add(new MemberInfo(userId, password, userName, photoFile));
	}
 %>
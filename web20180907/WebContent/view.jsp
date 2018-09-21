<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* 컨트롤러 페이지  */
	//1. 사용자가 요청한 데이터 받기
	//2. 분석
	//3. 처리 -> 결과 -> 기본객체에 속성으로 저장
	//4. 응답 페이지 지정
	//5. 포워딩
	
	String code = request.getParameter("code"); //데이터 받기
	String viewPage = "";
	
	if(code.equals("A")) { //분석
		
		Date date = new Date(); //결과데이터
		request.setAttribute("result", date); //속성으로 저장
		viewPage = "view/a.jsp"; //응답 페이지 지정
		
	} else if (code.equals("B")){
		
		String str = "Hello~!!";
		request.setAttribute("result", str);
		viewPage = "view/b.jsp";
		
	} else if (code.equals("C")){
		
		int age = 12;
		request.setAttribute("result", age);
		viewPage = "view/c.jsp";
		
	}
%>

<jsp:forward page = "<%= viewPage %>"></jsp:forward> <!-- 포워딩 -->
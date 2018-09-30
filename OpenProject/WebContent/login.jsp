<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("userId");
	String pwd = request.getParameter("password");
	String rememberChk = request.getParameter("rememberChk");
	
	List memList = new ArrayList<MemberInfo>();
	
	if (application.getAttribute("members") != null) {
		
        memList = (ArrayList) application.getAttribute("members");
    }
		
	
%>
    <%  //아이디와 비밀번호가 빈칸이 아니라면
    	if(id !=null && pwd != null){
    		//저장된 아이디와 비밀번호를 불러와서 사용자가 입력한 값과 비교
    		for(int i = 0; i < memList.size(); i++){
    			
    			//기존에 저장된 정보를  불러옴
    			MemberInfo savedMem = (MemberInfo) memList.get(i);
    			
    			//로그인이 되면 세션에 정보를 저장
    			if(savedMem.getUserId().equals(id) && savedMem.getPassword().equals(pwd)){
    				
    				request.getSession().setAttribute("members", new MemberInfo(savedMem.getUserId(),"",savedMem.getUserName(),savedMem.getPhotoFile()));
					
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
    %> --%>
    
   <%
   		String id = request.getParameter("userId");
   		String pwd = request.getParameter("password");
   		String rememberChk = request.getParameter("rememberChk");
   		
   		if(id != null && pwd != null){
   		/* //드라이버에 연결
   		 	Class.forName("oracle.jdbc.driver.OracleDriver");
   		 	
   		 	//데이터로그인 정보 불러옴
   		 	String url = "jdbc:oracle:thin:@localhost:1522:orcl";
   			String user = "scott";
   			String pw = "tiger";  */
   		 	
   			String jdbcUrl = "jdbc:apache:commons:dbcp:open";
   			
   		 	Connection conn = null;
   		 	PreparedStatement pstmt = null;
   			ResultSet rs = null;
   			
   		 	//데이터베이스에 로그인
   		 	conn = DriverManager.getConnection(jdbcUrl);
   		 	String sql = "select * from openproject where userid = ?";
   			
   		 	//sql문 실행
   	 		pstmt = conn.prepareStatement(sql);
   		 	pstmt.setString(1, id);
   		 	
   		 	rs = pstmt.executeQuery();
   		 	
   		 	if(rs.next()){
   		 		//파라미터로 불러온 아이디와 비밀번호를 데이터베이스에 저장된 아이디와 비밀번호와 비교후 로그인
  	 		 	if(id.equals(rs.getString("userid")) && pwd.equals(rs.getString("password"))) {
  	 		 		//로그인이 되면 세션을 생성
  	 		 		request.getSession(false).setAttribute("members", new MemberInfo(rs.getString(1), "", rs.getString(3), rs.getString(4)));
  	 		 		//로그인이 된 후 아이디기억부분이 체크되어있다면 쿠키를 생성
  	 		 		if(rememberChk != null){
  	 		 			Cookie cookie = new Cookie("id",id);
  	 		 			response.addCookie(cookie);
  	 		 		} else {
  	 		 			Cookie cookie = new Cookie("id","");
  	 		 			cookie.setMaxAge(0);
  	 		 			response.addCookie(cookie);
  	 		 		}
  	 		 		//로그인이 되면 마이페이지로 넘김 
   			 		response.sendRedirect("myPage.jsp");
   			 		
   			 	} else{
   		 		%>
   		 		<script>
   		 			alert("아이디 혹은 비밀번호가 틀립니다.");
   		 			location.href("loginform.jsp");
   		 		</script>
   		 		<%
   			 	}
   		 	} else{
   		 		%>
   		 		<script>
   		 			alert("가입된 아이디가 아닙니다")
   		 			location.href("loginform.jsp");
   		 		</script>
   		 		<%
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userId");
	String pwd = request.getParameter("password");
	String name = request.getParameter("userName");
	String photo = request.getParameter("photoFile");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	/* Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1522:orcl";
	String user = "scott";
	String pw = "tiger"; */
	
	// 위의 4가지 불러온 내용을 하나로 통합
	String jdbcUrl = "jdbc:apache:commons:dbcp:open";
	//수정이 완료되면 cnt가 변함
	int cnt = -1;
	try{
	conn = DriverManager.getConnection(jdbcUrl);
	
	String sql = "update openproject set password = ?, username = ?, photofile = ? where userid = ?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pwd);
	pstmt.setString(2, name);
	pstmt.setString(3, photo);
	pstmt.setString(4, id);
	
	cnt = 1;
	pstmt.executeUpdate();
	
	} finally{
		pstmt.close();
		conn.close();
	}
	
	if(cnt == 1){
		%>
		<script>
			alert("수정이 완료되었습니다.");
			location.href = "memberList.jsp";
		</script>
		<%
	}
%>
</body>
</html>
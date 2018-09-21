<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	
	//1. 데이터베이스 드라이버 로드
	//Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	//데이터베이스에 연결정보 가져옴
	/* String url = "jdbc:oracle:thin:@localhost:1522:orcl";
	String user = "scott";
	String pw = "tiger";
	 */
	String jdbcUrl = "jdbc:apache:commons:dbcp:open";
	try{
	//컨넥션 객체를 가져옴
	//conn = DriverManager.getConnection(url,user,pw);
	conn = DriverManager.getConnection(jdbcUrl);
	
	String sql = "insert into emp(empno, ename, job) values (?,?,?)";
	// sql쿼리문 실행
	pstmt = conn.prepareStatement(sql);
	// ?에 파라미터로 받아온 값을 삽입함
	pstmt.setInt(1, Integer.parseInt(empno));
	pstmt.setString(2, ename);
	pstmt.setString(3, job);
	int resultCnt = pstmt.executeUpdate();
	
	} finally{
		pstmt.close();
		conn.close();
	}
%>
<h1>등록완료  <a href = "emp_list.jsp">emp LIST</a></h1>
</body>
</html>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("userId");

		Connection conn = null;
		PreparedStatement pstmt = null;

		/* Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1522:orcl";
		String user = "scott";
		String pw = "tiger"; */
		String jdbcUrl = "jdbc:apache:commons:dbcp:open";
		int cnt = -1;
		try {
			conn = DriverManager.getConnection(jdbcUrl);

			String sql = "delete from openproject where userid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			cnt = 1;
			pstmt.executeUpdate();
			
		} finally {
			pstmt.close();
			conn.close();
		}
		if (cnt == 1) {
	%>
	<script>
		alert("삭제되었습니다.");
		location.href = "memberList.jsp";
	</script>
	<%
		}
	%>
</body>
</html>
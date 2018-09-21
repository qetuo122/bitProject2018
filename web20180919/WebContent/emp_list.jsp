<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp_list</title>
</head>
<body>
<h1>사원리스트</h1>
<h3><a href = "empRegForm.jsp">사원 등록</a></h3>
<table border="1">
	<tr>
		<td>사원번호</td>
		<td>사원이름</td>
		<td>직급</td>
		<td>관리</td>
	</tr>
	<%
		
		// 1. 데이터베이스 드라이버 로드
		//Class.forName("oracle.jdbc.driver.OracleDriver"); <---- 서블릿의 loader에 등록했기때문에 사용할 필요 x 서버가 실행될때 드라이버 로드하도록 해줌
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		//데이터베이스접속을 위한 접근정보 불러옴
		//String url = "jdbc:oracle:thin:@localhost:1522:orcl";
		//String user = "scott";
		//String pw = "tiger";
		
		String jdbcUrl = "jdbc:apache:commons:dbcp:open";
		
		try{
		// 2. 컨넥션 객체 생성(데이터베이스에 로그인)
		//conn = DriverManager.getConnection(url,user,pw);
		
		conn = DriverManager.getConnection(jdbcUrl);
		
		// 3. statement 객체 생성
		stmt = conn.createStatement();
		
		String list_sql = "select empno, ename, job from emp order by empno";
		
		// 4. 쿼리 실행(select문은 executeQuery를 사용함)
		rs = stmt.executeQuery(list_sql);
		
		if(rs.next()){
			do{
			%>
	<tr>	 <!-- rs.getInt(1)는 rs에 저장된 칼럼에서 1번째 컬럼을 불러옴 -->
		<td><%= rs.getInt(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<!-- 해당하는 행을 지우기 위해서 empno값을 불러줌 -->
		<td><a href = "editForm.jsp?empno=<%= rs.getInt(1) %>">수정</a> 
			  <a href = "delete.jsp?empno=<%= rs.getInt(1)%>">삭제</a></td>
	</tr>
			
			<%
			} while(rs.next());
			//rs에 다음 목록이 없다면?
		} else{
			%>
	<tr>
		<td colspan = "3">등록된 사원정보가 없습니다.</td>
	</tr>
			
			<%
		}
		
		} finally{
			
			if(rs != null){
				try{
					rs.close();
				} catch (SQLException se){
				}
			}
			if(stmt != null){
				try{
					stmt.close();
				} catch(SQLException se){
				}
			}
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException se){
				}
			}
		}
		
	%>
	
</table>


</body>
</html>
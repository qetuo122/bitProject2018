<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	MemberInfo mem = (MemberInfo) request.getSession(false).getAttribute("members");
	
	if(mem == null) {
		%>
		<script>
			alert('로그인 후 사용가능한 서비스 입니다.');
			location.href = 'loginform.jsp';
		</script>
		<%
	} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	#memTable, tr, td{
		border : 1px solid black;
		text-align : center;
	}
	#listTitle{
		margin : 10px;
	}
	#memTable{
		margin:10px;
		width : 700px;
		height : 150px;
	}
</style>
</head>
<body>
<%@ include file = "common/header.jsp" %>
<h1 id = "listTitle">회원 리스트</h1>
<table id = "memTable">
	<tr>
		<td><h1>회원 ID</h1></td>
		<td><h1>비밀번호</h1></td>
		<td><h1>회원 이름</h1></td>
		<td><h1>회원 사진</h1></td>
		<td><h1>관리</h1></td>
	</tr>
<%-- <%
	//어플리케이션에 저장된 정보를 전부 불러온다.
	//테이블을 만들고 저장된 기존 정보를 차례대로 입력한다.
	//어플리케이션에 저장된것이 있다면
	if(application.getAttribute("members") != null){
		//저자된 정보를 리스트에 담는다.
		List memList = (ArrayList) application.getAttribute("members");
		
		//반복문을 돌려 회원리시트를 멤버에 담고 테이블에 그린다.
		for(int i = 0;  i < memList.size(); i++){
			MemberInfo member = (MemberInfo) memList.get(i);
			%>
			<tr>
				<td><%= member.getUserId() %></td>
				<td><%= member.getPassword() %></td>
				<td><%= member.getUserName() %></td>
				<td><input type = "button" value = "수정" id = "modi"> <input type = "button" value = "삭제" id = "del"></td>
			</tr>
			
			<%
		}
	}
%> --%>

<%

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	/* Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1522:orcl";
	String user = "scott";
	String pw = "tiger"; */
	String jdbcUrl = "jdbc:apache:commons:dbcp:open";
	
	try{
	conn = DriverManager.getConnection(jdbcUrl);
	
	stmt = conn.createStatement();
	
	String sql = "select * from openproject";
	
	rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		do{
			%>
	<tr>	 <!-- rs.getInt(1)는 rs에 저장된 칼럼에서 1번째 컬럼을 불러옴 -->
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><img alt="images/imagesi.png" src="<%= request.getContextPath()%>/uploadfile/<%=rs.getString(4)%>"></td>
		<!-- 해당하는 행을 지우기 위해서 empno값을 불러줌 -->
		<td><a href = "editForm.jsp?userId=<%= rs.getString(1)%>">수정</a> 
			  <a href = "delete.jsp?userId=<%= rs.getString(1)%>">삭제</a></td>
	</tr>
			
			<%
			} while(rs.next());
	} else{
		%>
		<tr>
			<td colspan = "5">등록된 사원정보가 없습니다.</td>
		</tr>
		<%
	}
	} finally{
		rs.close();
		stmt.close();
		conn.close();
	}
%>
	
</table>

</body>
</html>
<%} %>

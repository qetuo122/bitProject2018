<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "common/header.jsp" %>
<%
	String id = request.getParameter("userid");


Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

/* Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1522:orcl";
String user = "scott";
String pw = "tiger"; */

String jdbcUrl = "jdbc:apache:commons:dbcp:open";
conn = DriverManager.getConnection(jdbcUrl);

stmt = conn.createStatement();

String sql = "select * from openproject where userid = " + id;

rs = stmt.executeQuery(sql);

String pwd = null;
String name = null;
String photo = null;
//rs가 있다면 해당 변수에 데이터베이스의 값을 불러옴
if(rs.next()){
	pwd = rs.getString("password");
	name = rs.getString("userName");
	photo = rs.getString("photoFile");
}
%>
<div id = #contents>
<h2>회원 가입</h2>
    <hr>
    <form action = "edit.jsp" method = "post">
        <table>
            <tr>
                <td>아이디(이메일)</td>
                <td><input type="text" name = "userId"  value = "<%=id  %>" readonly></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name = "password" value = "<%=pwd  %>"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type = "text" name = userName value = "<%=name  %>"></td>
            </tr>
            <tr>
                <td>사진</td>
                <td><input type="file"  value = "사진선택"  alt = "사진없음" name = "photoFile" value = "<%=photo  %>"></td>
            </tr>
            <tr>
                <td colspan="2"><input type = "submit" value = "수정"></td>
            </tr>
        </table>
    </form>
</body>
</html>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	#memTable, tr, td{
		border : 1px solid black;
	}
</style>
</head>
<body>
<table id = "memTable">
	<tr>
		<td><h1>ȸ�� ID</h1></td>
		<td><h1>ȸ�� �̸�</h1></td>
	</tr>
<%
	//���ø����̼ǿ� ����� ������ ���� �ҷ��´�.
	//���̺��� ����� ����� ���� ������ ���ʴ�� �Է��Ѵ�.
	//���ø����̼ǿ� ����Ȱ��� �ִٸ�
	if(application.getAttribute("members") != null){
		//���ڵ� ������ ����Ʈ�� ��´�.
		List memList = (ArrayList) application.getAttribute("members");
		
		//�ݺ����� ���� ȸ������Ʈ�� ����� ��� ���̺� �׸���.
		for(int i = 0;  i < memList.size(); i++){
			MemberInfo mem = (MemberInfo) memList.get(i);
			%>
			<tr>
				<td><%= mem.getUserId() %></td>
				<td><%= mem.getUserName() %></td>
			</tr>
			
			<%
		}
	}
%>
	
</table>

</body>
</html>
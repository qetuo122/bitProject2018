<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#wrap{
		width : 1000px;	
	}
	h1 {
		border-bottom : 1px solid #8e8e8e;
		text-align : center;
		padding : 10px;
	}
	#menuWrap {
		text-align : center;
	}
	#menuWrap div{
		display : inline-block;
	}
	#content{
		text-align : center;	
	}
	#newsWrap{
		float : left;
	}]
	#shoppingWrap{
		float : right;
	}
</style>
</head>
<body>
<div id = "wrap">
	<div id = "header">
	<h1>include 지시어 테스트</h1>
	</div>
	<div id = "content">
	<%@ include file = "menu.jsp" %>
	<%@ include file = "news.jsp" %>
	<%@ include file = "shopping.jsp" %>
	</div>
	</div>
</body>
</html>
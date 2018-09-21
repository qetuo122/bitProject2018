<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>날짜 포멧</h1>
<c:set var = "now" value = "<%= new java.util.Date() %>"/>
<fmt:formatDate value = "${now}" type = "date" dateStyle = "full"/><br> <!--날짜  -->
<fmt:formatDate value = "${now}" type = "date" dateStyle = "short"/><br>

<fmt:formatDate value = "${now }" type = "time" timeStyle = "full"/><br> <!-- 시간 -->
<fmt:formatDate value = "${now }" type = "time" timeStyle = "short"/><br>

<fmt:formatDate value = "${now }" type = "both" dateStyle = "full"/><br> <!-- 날짜, 시간 둘다 -->
<fmt:formatDate value = "${now }" pattern = "z a h:mm"/><br> <!-- a는 오전, 오후 표현, h:mm은 시간 -->
<fmt:formatDate value = "${now }" pattern = "yyyy-MM-dd"/><br>
<fmt:formatDate value = "${now }" pattern = "yyyy-MM-dd. h:mm"/><br>



<hr>

<h1>숫자포멧</h1>
<c:set var = "price" value = "10000"/>
<fmt:formatNumber value="${price}" type = "number" var = "numberType"/> <!--var속성을 쓰면 var값을 입력해 줘야 출력가능  -->
${numberType}
<br>

통화 : <fmt:formatNumber value = "${price}" type = "currency" currencySymbol="$"/>
<br>
퍼센트 : <fmt:formatNumber value = "${price / 10000}" type = "percent" groupingUsed="false"/>
<br>
패턴 : <fmt:formatNumber value = "${price}" pattern="00000000"/>

</body>
</html>
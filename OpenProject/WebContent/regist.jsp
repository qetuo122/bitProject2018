<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class = "member.model.MemberInfo" scope = "request"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<jsp:useBean id="savedMem" class = "java.util.ArrayList" scope = "application"></jsp:useBean>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
	<c:when test = "${savedMem != null}">
		<c:forEach var = "mem" items = "${savedMem}">
			<c:if test=""></c:if>
		</c:forEach>
		<c:when test="${member.userId} != ${savedMem.userId}">
			<jsp:setProperty property="*" name="savedMem"/>
			<c:redirect url = "loginform.jsp"/>		
		</c:when>
		<c:otherwise>
			<script>
				alert("이미 등록된 아이디입니다.")
				location.href = "memberRegFrom.jsp"
			</script>
		</c:otherwise>
	</c:when>
	<c:otherwise>
		<jsp:setProperty property="*" name="savedMem"/>
		<c:redirect url = "lofinform.jsp"/>
	</c:otherwise>
	
</c:choose>

<%--  <%
	request.setCharacterEncoding("utf-8");
 	// 회원아이디,비밀번호,이름 ,사진을 받아옴
	String id = request.getParameter("userId");
	String pwd = request.getParameter("password");
	String name = request.getParameter("userName");	
	String photo = request.getParameter("photoFile");
	//멤버객체를 담을 리스트를 만듦
	List<MemberInfo> memList = new ArrayList<MemberInfo>();
	
	MemberInfo members = new MemberInfo(id, pwd, name, photo);
	
	//어플리케이션에 저장된 정보가 있다면
	if(application.getAttribute("members") != null){
		//리스트에 기존에 저장된 멤버정보를 저장
		memList = (ArrayList) application.getAttribute("members");
		
		//list에 저장된 정보들 다 가져옴
		for(int i = 0; i < memList.size(); i++){
		
			MemberInfo savedMem = (MemberInfo)memList.get(i);
			
			//입력한 아이디와 저장된 아이디가 같다면
			if(members.getUserId().equals(savedMem.getUserId())){

				%>
				<script>
					alert("기존에 가입하신 아이디입니다")
					location.href = 'memberRegForm.jsp';
				</script>
				<%
				
			} else{
				//리스트에 멤버객체를 담음
				memList.add(members);
	
				//담은 리스트를 어플리케이션에 새로저장
				application.setAttribute("members", memList);
				response.sendRedirect("loginform.jsp");
			}
		}
		
		} else{
		
		memList.add(members);
		application.setAttribute("members", memList);
		response.sendRedirect("loginform.jsp");
	}
	
 %> --%>

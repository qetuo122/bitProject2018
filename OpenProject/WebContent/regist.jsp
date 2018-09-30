<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "bean" class = "member.model.MemberInfo"/>

<%-- <%
 	
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
		//기존에 저장된 멤버 정보가 없다면
	} else{
		memList.add(members);
		application.setAttribute("members", memList);
		response.sendRedirect("loginform.jsp");
	}
	
 %> --%>
 <%-- <%
 	MemberInfo mem = (MemberInfo) request.getSession(false).getAttribute("members");
 	
 	if(mem != null){
 		%>
 		<script>
 			alert("로그아웃후 이용해주세요");
 			location.href("myPage.jsp");
 		</script>
 		<%
 	}else{
 %> --%>
 <%
 	MemberInfo member = new MemberInfo();
 	
 	//회원가입폼에서 넘어온 값이 있나 확인
 	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 	//파일을 업로드하기위해 생성
 	DiskFileItemFactory factory = new DiskFileItemFactory();
 	ServletFileUpload upload = new ServletFileUpload(factory);
 	//리퀘스트 받은 정보를 리스트객체 형식으로 저장
 	List<FileItem> items = upload.parseRequest(request);
 	//이터레이터로 불러오기 쉽게 한번에 저장
 	Iterator<FileItem> iter = items.iterator();
 	//반복문을 이용해서 이터레이터에 있는 데이터를 하나하나 불러옴
 	while (iter.hasNext()) {
 		FileItem item = iter.next();
 		//불러온 데이터가 텍스트형식인 경우
 		if(item.isFormField()){
			//item에서 가져온 필드네임과 회원가입폼에서 가져온 id필드이름이 같으면 member객체에 item에 있는 정보를각각 저장 			
 			if(item.getFieldName().equals("userid")){
 				member.setUserId(item.getString("utf-8"));
 			} else if (item.getFieldName().equals("password")){
 				member.setPassword(item.getString("utf-8"));
 			} else if (item.getFieldName().equals("userName")){
 				member.setUserName(item.getString("utf-8"));
 			}
			
 		} else {
 			//불러온 데이터가 파일형식인 경우와 빈값이 아닐경우를 계산 			
 			if(item.getFieldName().equals("photoFile")
 					&& item.getSize() > 0
 					&& item.getName() != null
 					&& item.getName().length() > 0){
 				//파일이름을 저장할 변수 생성
 				String newFileName = "";
 				//item에 저장된 파일이름을 불러옴
 				String fileName = item.getName();
 				newFileName = System.currentTimeMillis() + "_" + fileName;
 				//이미지 파일을 저장할 파일경로를 지정
 				String uploadUri = "/uploadfile";
 				String dir = request.getSession().getServletContext().getRealPath(uploadUri);
 				
 				File file = new File(dir, newFileName);
 				//이터레이터에 파일을 저장
 				item.write(file);
 				//멤버객체에 파일 저장
 				member.setPhotoFile(newFileName);
 			}
 		}
 	}
 	
 %>
 <%
 	request.setCharacterEncoding("utf-8");
 
 	/* String id = request.getParameter("userId");
 	String pwd = request.getParameter("password");
 	String name = request.getParameter("userName");
 	String photo = request.getParameter("photoFile"); */
	
 	//드라이버에 연결
 	//Class.forName("oracle.jdbc.driver.OracleDriver");
 	//데이터로그인 정보 불러옴
 	/* String url = "jdbc:oracle:thin:@localhost:1522:orcl";
	String user = "scott";
	String pw = "tiger"; */ 
 	String jdbcUrl = "jdbc:apache:commons:dbcp:open";
 	
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	int cnt = -1;
 	try{
 		//데이터베이스에  로그인
 		conn = DriverManager.getConnection(jdbcUrl);
 		
 		String sql = "insert into openproject(userid, password, username, photofile) values (?,?,?,?)";
 		
 		//sql문 실행
 		pstmt = conn.prepareStatement(sql);
 		
 		//파라미터로 받아온 값을 쿼리문에 대입
 		pstmt.setString(1, member.getUserId());
 		pstmt.setString(2, member.getPassword());
 		pstmt.setString(3, member.getUserName());
 		pstmt.setString(4, member.getPhotoFile());
 		
 		//쿼리문 저장
 		pstmt.executeUpdate();
 		cnt = 1;
 	} catch(Exception e){
 		e.getStackTrace();
 		
 	} finally{
		pstmt.close();
		conn.close();
	}
 	if(cnt == -1){
 		 %>
 		<script>
 		alert("이미 가입하신 아이디입니다.");
 		location.href("memberRegForm.jsp");
 		</script>
 		<%
 	} else {
 		response.sendRedirect("loginform.jsp");
 	}
 %>

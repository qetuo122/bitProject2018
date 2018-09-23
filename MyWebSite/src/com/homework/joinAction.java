package com.homework;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/joinAction")
public class joinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public joinAction() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");
		  
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwdOk = request.getParameter("pwdOk");
		String privateNum = request.getParameter("privateNum");
		String homeNum = request.getParameter("homeNum");
		String address = request.getParameter("address");
		String job = request.getParameter("job");
		String hobby[] = request.getParameterValues("hobby");
		String self = request.getParameter("self");
		String hobby2 = "";
		
		for(int i = 0; i < hobby.length; i++) {
			hobby2 += hobby[i] + ",";
		}

		
		Connection conn = null;
		PreparedStatement pstmt = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				String jdbcDriver = "jdbc:mysql://localhost:3306/book_ex?useUnicode=true&characterEncoding=utf8";
				String dbUser = "zerock";
				String dbPassWord = "zerock";
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPassWord);

				String query = "insert into new_table(name, id, pwd, privateNum, homeNum, home, job, hobby, self)  values (?,?,?,?,?,?,?,?,?)";

				pstmt = conn.prepareStatement(query);

				pstmt.setString(1, name);
				pstmt.setString(2, id);
				pstmt.setString(3, pwd);
				pstmt.setString(4, privateNum);
				pstmt.setString(5, homeNum);
				pstmt.setString(6, address);
				pstmt.setString(7, job);
				pstmt.setString(8, hobby2);
				pstmt.setString(9, self);
				pstmt.executeUpdate();
				
				System.out.println("data가 생성되었습니다.");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException e) {
					}
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

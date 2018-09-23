package com.codechobo;

//[MVC패턴 연습5] user_id를 매개변수로 받아 user_info테이블에서 해당 사용자의 정보를 가져오는 selectUser메서드를 작성하시오.

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MVCTest5 {
	public static void main(String[] args) throws Exception {

		User u = selectUser("ff22f");

		System.out.println(u);

		System.out.println(deleteUser("ff22f")); // 객체 u에 저장된 user_id와 동일한 행의 정보를 delete하는 메서드

		u = selectUser("ff22f");

		System.out.println(u);

	}

	static int deleteUser(String userId) throws Exception {

		// 1.JDBC 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

		Connection conn = null; // null로 초기화 한다.

		PreparedStatement pstmt = null;

		int updateCount = 0;

		try {

			String jdbcDriver = "jdbc:mysql://localhost:3306/book_ex?useUnicode=true&characterEncoding=utf8";
			// 사용하려는 데이터베이스명을 포함한 URL 기술

			String dbUser = "zerock"; // 사용자 계정

			String dbPassWord = "1234"; // 사용자 계정의 패스워드

			// 2. 데이터베이스 커넥션 생성
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPassWord);
			// DriverManager 객체로부터 Connection 객체를 얻어온다.

			// 3.Statement 생성
			String query = "delete from user_info  where USER_ID=?";
			// sql 쿼리 범위 지정X
			// 연결된 테이블 안의 이름
			// prepareStatement에서 해당 sql을 미리 컴파일한다.
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userId);

			// 4.쿼리 실행
			// 5. 쿼리 실행 결과 출력
			updateCount = pstmt.executeUpdate();
			System.out.println("성공");

		} catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.

			ex.printStackTrace();
			System.out.println("member 테이블 호출에 실패했습니다.");

		} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)

			// 6. 사용한 Statement 종료
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				} // PreparedStatement 객체 해제
			// 7. 커넥션 종료
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				} // Connection 해제

		}
		return updateCount;

	}

	static User selectUser(String userid) throws Exception {

		// 1.JDBC 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

		Connection conn = null; // null로 초기화 한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 지역변수는초기화를 해줄것
		String rsID = "";
		String rsPWD = "";
		String rsNAME = "";
		String rsEMAIL = "";
		// 지역변수는초기화를 해줄것

		try {

			String jdbcDriver = "jdbc:mysql://localhost:3306/book_ex?useUnicode=true&characterEncoding=utf8";
			// 사용하려는 데이터베이스명을 포함한 URL 기술

			String dbUser = "zerock"; // 사용자 계정

			String dbPassWord = "1234"; // 사용자 계정의 패스워드

			// 2. 데이터베이스 커넥션 생성
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPassWord);
			// DriverManager 객체로부터 Connection 객체를 얻어온다.

			// 3.Statement 생성
			// prepareStatement 형식으로 쓸것
			String query = "select * from user_info where  USER_ID = ?";
			// sql 쿼리
			// 연결된 테이블 안의 이름

			// prepareStatement 형식으로 쓸것
			pstmt = conn.prepareStatement(query); // prepareStatement에서 해당 sql을 미리 컴파일한다.
			pstmt.setString(1, userid);
			// prepareStatement 형식으로 쓸것

			// 4.쿼리 실행
			// pstmt.executeUpdate();
			rs = pstmt.executeQuery(); // 쿼리를 실행한다.

			// 5. 쿼리 실행 결과 출력
			if (rs.next()) {

				rsID = rs.getString("USER_ID");
				rsPWD = rs.getString("PASSWORD");
				rsNAME = rs.getString("NAME");
				rsEMAIL = rs.getString("EMAIL");

			} else {
				System.out.println(userid + " 에 해당하는 정보가 존재하지 않습니다.");
			}

			System.out.println("성공");

		} catch (SQLException ex) { // 예외가 발생하면 예외 상황을 처리한다.

			ex.printStackTrace();
			System.out.println("member 테이블 호출에 실패했습니다.");

		} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)

			// 6. 사용한 Statement 종료
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				} // Resultset 객체 해제
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				} // PreparedStatement 객체 해제

			// 7. 커넥션 종료
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				} // Connection 해제

		}

		return new User(rsID, rsPWD, rsNAME, rsEMAIL);
		// 리턴타입 > 객체

	}
}
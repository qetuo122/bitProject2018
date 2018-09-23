package com.codechobo;

//[MVC패턴 연습3] User객체를 매개변수로 받아 user_info테이블에서 해당 사용자의 정보를 update하는 updateUser메서드를 작성하시오.
//(실제로 데이터가 잘저장되었는지 DB에서 확인하시오)

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MVCTest3 {
	public static void main(String[] args) throws Exception {
		User u = new User("ff22f", "이ㅇ섬", "1200", "bb@bb.com");

		System.out.println(u);
		System.out.println(updateUser(u)); // 객체 u에 저장된 user_id와 동일한 행의 정보를 update하는 메서드
		
	}

	static int updateUser(User u) throws Exception {

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
			String query = "update user_info  set PASSWORD=?, NAME=?, EMAIL=?  where USER_ID=?"; 
			//sql 쿼리 범위 지정X			
			// 연결된 테이블 안의 이름
			// prepareStatement에서 해당 sql을 미리 컴파일한다.
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, u.getPASSWORD());

			pstmt.setString(2, u.getNAME());

			pstmt.setString(3, u.getEMAIL());

			pstmt.setString(4, u.getID());

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

}

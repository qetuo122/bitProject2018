import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCtest4 {

	public static void main(String[] args) {
		Emp emp = new Emp();
		
		try {
			//1. DBMS(oracle) 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1522:orcl";
			String user = "scott";
			String pw = "tiger";
			
			//2.컨넥션 객체를 가져옴
			Connection conn = DriverManager.getConnection(url, user, pw);
			
			System.out.println("데이터베이스 연결 성공");
			
			//3.데이터 베이스 작업
			
			String sql = "SELECT * FROM EMP where ename = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "SCOTT");
			ResultSet rs = pstmt.executeQuery();
			
				while (rs.next()) {
					System.out.print("사원번호 : " + rs.getInt(1) + "\t");
					System.out.print("사원이름 : " + rs.getString(2) + "\t");
					System.out.print("업무 : " + rs.getString(3) + "\t");
					System.out.print("매니저번호 : " + rs.getInt(4) + "\t");
					System.out.print("고용날짜 : " + rs.getString(5) + "\t");
					System.out.print("급여 : " + rs.getInt(6) + "\t");
					System.out.print("커미션 : " + rs.getInt(7) + "\t");
					System.out.print("부서번호 : " + rs.getInt(8) + "\t");
					System.out.println("\n--------------------------------------------------------------------");
				}
				rs.close();
				pstmt.close();
			
			conn.close();
		} catch (ClassNotFoundException e) {
			
			System.out.println("해당 클래스를 찾을 수 없습니다");
			System.out.println("DBMS 드라이버 로드 실패");
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			System.out.println("데이터베이스 연결 실패!");
			
			e.printStackTrace();
		}
	}

}



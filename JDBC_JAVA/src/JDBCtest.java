import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class JDBCtest {

	public static void main(String[] args) {
		
		
		
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
			String sql1 = "INSERT INTO EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES(?,?,?,?,?,?,?,?)";
			Emp emp = new Emp();
			
			PreparedStatement pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, emp.getEMPNO());
				pstmt.setString(2, emp.getENAME());
				pstmt.setString(3, emp.getJOB());
				pstmt.setInt(4, emp.getMGR());
				pstmt.setString(5,emp.getHIREDATE());
				pstmt.setInt(6, emp.getSAL());
				pstmt.setInt(7, emp.getCOMM());
				pstmt.setInt(8, emp.getDEPTNO());
				
				int procNum = pstmt.executeUpdate();
				System.out.println(procNum + "개 행이 적용되었습니다.");
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



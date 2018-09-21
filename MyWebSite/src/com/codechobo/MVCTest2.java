package com.codechobo; //404

//2. User��ü�� �Ű������� �޾� DB�� user_info���̺� insert�ϴ� insertUser()�޼��带 �ۼ��Ͻÿ�.
//(������ �����Ͱ� ������Ǿ����� DB���� Ȯ���Ͻÿ�)

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MVCTest2 {
	public static void main(String[] args) throws ClassNotFoundException  {
		User u = new User("ff75a", "���ü�", "1234", "aaa@aaa.com");

		System.out.println(u);
//		insertUser(u);
		System.out.println(insertUser(u)); // ��ü u�� ����� ���� DB�� user_info���̺� insert�ϴ� �޼���

	}

	static int insertUser(User u) throws ClassNotFoundException {

		// 1.JDBC ����̹� �ε�
		Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.

		Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.

		PreparedStatement pstmt = null;		
		
//		ResultSet rs = null;
		int updateCount = 0;

		try {

			String jdbcDriver = "jdbc:mysql://localhost:3306/book_ex?useUnicode=true&characterEncoding=utf8";
			// ����Ϸ��� �����ͺ��̽����� ������ URL ���

			String dbUser = "zerock"; // ����� ����

			String dbPassWord = "1234"; // ����� ������ �н�����

			// 2. �����ͺ��̽� Ŀ�ؼ� ����
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPassWord);
			// DriverManager ��ü�κ��� Connection ��ü�� ���´�.

			// 3.Statement ����
			String query = "insert into user_info(USER_ID, PASSWORD, NAME, EMAIL)  values (?,?,?,?)"; // sql ����
			// �κ������ ���� �ʿ�
			// ����� ���̺� ���� �̸�

			pstmt = conn.prepareStatement(query); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.

			pstmt.setString(1, u.getID());

			pstmt.setString(2, u.getPASSWORD());

			pstmt.setString(3, u.getNAME());

			pstmt.setString(4, u.getEMAIL());

			// 4.���� ����
//			pstmt.executeUpdate();
			// 5. ���� ���� ��� ���
			updateCount = pstmt.executeUpdate();//�����
			System.out.println("����");

		} catch (SQLException ex) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.

			ex.printStackTrace();
			System.out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");

		} finally { // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�. (�����߿�)
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				} // PreparedStatement ��ü ����

			// 7. Ŀ�ؼ� ����
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				} // Connection ����

		}
		
		return updateCount;
	}

}

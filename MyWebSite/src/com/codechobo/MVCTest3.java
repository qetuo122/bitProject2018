package com.codechobo;

//[MVC���� ����3] User��ü�� �Ű������� �޾� user_info���̺��� �ش� ������� ������ update�ϴ� updateUser�޼��带 �ۼ��Ͻÿ�.
//(������ �����Ͱ� ������Ǿ����� DB���� Ȯ���Ͻÿ�)

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MVCTest3 {
	public static void main(String[] args) throws Exception {
		User u = new User("ff22f", "�̤���", "1200", "bb@bb.com");

		System.out.println(u);
		System.out.println(updateUser(u)); // ��ü u�� ����� user_id�� ������ ���� ������ update�ϴ� �޼���
		
	}

	static int updateUser(User u) throws Exception {

		// 1.JDBC ����̹� �ε�
		Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.

		Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.

		PreparedStatement pstmt = null;

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
			String query = "update user_info  set PASSWORD=?, NAME=?, EMAIL=?  where USER_ID=?"; 
			//sql ���� ���� ����X			
			// ����� ���̺� ���� �̸�
			// prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, u.getPASSWORD());

			pstmt.setString(2, u.getNAME());

			pstmt.setString(3, u.getEMAIL());

			pstmt.setString(4, u.getID());

			// 4.���� ����
			// 5. ���� ���� ��� ���
			updateCount = pstmt.executeUpdate();
			System.out.println("����");

		} catch (SQLException ex) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.

			ex.printStackTrace();
			System.out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");

		} finally { // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�. (�����߿�)

			// 6. ����� Statement ����
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

package com.codechobo;

//[MVC���� ����5] user_id�� �Ű������� �޾� user_info���̺��� �ش� ������� ������ �������� selectUser�޼��带 �ۼ��Ͻÿ�.

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MVCTest5 {
	public static void main(String[] args) throws Exception {

		User u = selectUser("ff22f");

		System.out.println(u);

		System.out.println(deleteUser("ff22f")); // ��ü u�� ����� user_id�� ������ ���� ������ delete�ϴ� �޼���

		u = selectUser("ff22f");

		System.out.println(u);

	}

	static int deleteUser(String userId) throws Exception {

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
			String query = "delete from user_info  where USER_ID=?";
			// sql ���� ���� ����X
			// ����� ���̺� ���� �̸�
			// prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userId);

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

	static User selectUser(String userid) throws Exception {

		// 1.JDBC ����̹� �ε�
		Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.

		Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// �����������ʱ�ȭ�� ���ٰ�
		String rsID = "";
		String rsPWD = "";
		String rsNAME = "";
		String rsEMAIL = "";
		// �����������ʱ�ȭ�� ���ٰ�

		try {

			String jdbcDriver = "jdbc:mysql://localhost:3306/book_ex?useUnicode=true&characterEncoding=utf8";
			// ����Ϸ��� �����ͺ��̽����� ������ URL ���

			String dbUser = "zerock"; // ����� ����

			String dbPassWord = "1234"; // ����� ������ �н�����

			// 2. �����ͺ��̽� Ŀ�ؼ� ����
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPassWord);
			// DriverManager ��ü�κ��� Connection ��ü�� ���´�.

			// 3.Statement ����
			// prepareStatement �������� ����
			String query = "select * from user_info where  USER_ID = ?";
			// sql ����
			// ����� ���̺� ���� �̸�

			// prepareStatement �������� ����
			pstmt = conn.prepareStatement(query); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
			pstmt.setString(1, userid);
			// prepareStatement �������� ����

			// 4.���� ����
			// pstmt.executeUpdate();
			rs = pstmt.executeQuery(); // ������ �����Ѵ�.

			// 5. ���� ���� ��� ���
			if (rs.next()) {

				rsID = rs.getString("USER_ID");
				rsPWD = rs.getString("PASSWORD");
				rsNAME = rs.getString("NAME");
				rsEMAIL = rs.getString("EMAIL");

			} else {
				System.out.println(userid + " �� �ش��ϴ� ������ �������� �ʽ��ϴ�.");
			}

			System.out.println("����");

		} catch (SQLException ex) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.

			ex.printStackTrace();
			System.out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");

		} finally { // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�. (�����߿�)

			// 6. ����� Statement ����
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				} // Resultset ��ü ����
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				} // PreparedStatement ��ü ����

			// 7. Ŀ�ؼ� ����
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				} // Connection ����

		}

		return new User(rsID, rsPWD, rsNAME, rsEMAIL);
		// ����Ÿ�� > ��ü

	}
}
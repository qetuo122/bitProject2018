package com.codechobo;

//[MVC���� ����6] user_info���̺� �ִ� ��� ���� ��ȯ�ϴ� selectAllUsers�޼��带 �ۼ��Ͻÿ�.

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MVCTest6 {
	public static void main(String[] args) throws Exception {

		List<User> list = selectAllUsers();

		System.out.println(list);

	}

	static List<User> selectAllUsers() throws Exception {

		// 1.JDBC ����̹� �ε�
		Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.

		Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<User> list = new ArrayList<User>();

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
			String query = "select * from user_info";
			// sql ����
			// ����� ���̺� ���� �̸�

			// prepareStatement �������� ����
			pstmt = conn.prepareStatement(query); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
			// prepareStatement �������� ����

			// 4.���� ����
			// pstmt.executeUpdate();
			rs = pstmt.executeQuery(); // ������ �����Ѵ�.

			// 5. ���� ���� ��� ���
			while (rs.next()) {

				rsID = rs.getString("USER_ID");
				rsPWD = rs.getString("PASSWORD");
				rsNAME = rs.getString("NAME");
				rsEMAIL = rs.getString("EMAIL");

				list.add(new User(rsID, rsPWD, rsNAME, rsEMAIL));
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

		return list;
		// ����Ÿ�� > ��ü

	}
}
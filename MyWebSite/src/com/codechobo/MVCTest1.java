package com.codechobo;

//[MVC���� ����1] user_info���̺� mappping�ϱ� ���� UserŬ������ �ۼ��Ͻÿ�.
//1. user_info���̺� mappping�ϱ� ���� UserŬ������ �ۼ����ϰ� �׽�Ʈ �Ͻÿ�.
//1.1 �����ڸ� ������ �ۼ��Ͻÿ�. - ��Ŭ������ ����̿�(�޴�Source > Generate Constructor using Fields...)
//1.2 toString()�� �������̵� �Ͻÿ� - ��Ŭ���� ����̿�
//1.3 getter�� setter�� �߰��Ͻÿ�. - ��Ŭ���� ����̿�

public class MVCTest1 {
	public static void main(String[] args) {
		User u = new User("ff22f", "���ü�", "1234", "aaa@aaa.com");

		System.out.println(u);

	}
}

class User {
	String ID = "";
	String NAME = "";
	String PASSWORD = "";
	String EMAIL;

	User() {
	}

	User(String ID, String NAME, String PASSWORD, String EMAIL) {
		super();
		this.ID = ID;
		this.NAME = NAME;
		this.PASSWORD = PASSWORD;
		this.EMAIL = EMAIL;
	}

	@Override
	public String toString() {
		return "User [ID=" + ID + ", NAME=" + NAME + ", PASSWORD=" + PASSWORD + ", EMAIL=" + EMAIL + "]";
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

}// end of class

package com.codechobo;

//[MVC패턴 연습1] user_info테이블에 mappping하기 위한 User클래스를 작성하시오.
//1. user_info테이블에 mappping하기 위한 User클래스를 작성하하고 테스트 하시오.
//1.1 생성자를 적절히 작성하시오. - 이클립스의 기능이용(메뉴Source > Generate Constructor using Fields...)
//1.2 toString()을 오버라이딩 하시오 - 이클립스 기능이용
//1.3 getter와 setter를 추가하시오. - 이클립스 기능이용

public class MVCTest1 {
	public static void main(String[] args) {
		User u = new User("ff22f", "남궁성", "1234", "aaa@aaa.com");

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

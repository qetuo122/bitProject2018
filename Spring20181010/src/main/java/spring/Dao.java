package spring;

public interface Dao {
	
	//인터페이스이므로 구현없이 추상메서드만
	Member selectByEmail(String email);

	void insert(Member newMember);
	
	
	
}

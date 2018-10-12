package spring;

import org.springframework.beans.factory.annotation.Autowired;

public class ChangePasswordService {
	
	//생성자, 세터등을 만들지 않고 오토와이어드 사용(같은타입)
	@Autowired
	private MemberDao memberDao;

	//private MemberDao memberDao = new MemberDao; 대신 생성자로 이용
	/*public ChangePasswordService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}*/
	
	//프로퍼티를 사용하기 위해 set메서드를 만듬
		/*public void setMemberDao(MemberDao memberDao) {
			this.memberDao = memberDao;
		}*/
	
	public void changePassword(String email, String oldPwd, String newPwd) throws IdPasswordNotMatchingException, MemberNotFoundException {
		Member member = memberDao.selectByEmail(email);
		if (member == null)
			throw new MemberNotFoundException();
		member.changePassword(oldPwd, newPwd);
		memberDao.update(member);
	}
}

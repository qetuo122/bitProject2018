package spring;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class MemberRegisterService {
	
	//(오토와이어드를 이용해 Dao타입을 찾음)
	// 아이디가 일치하는 dao가 없을경우 Dao의 결과가 2개가 나올 것이므로 qualifier로 찾을dao를 지정
	@Autowired 
	@Qualifier("select")
	Dao memberDao;
	
	//autowired를 사용하기 위해(같은타입) -- 생성자를 만들필요 없음
	/*@Autowired
	private MemberDao memberDao;*/
	
	
	//autowired사용 안할때
	/*public MemberRegisterService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}*/
	
	//프로퍼티를 사용하기 위해 set메서드를 만듬
	/*public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}*/

	public void regist(RegisterRequest req) throws AlreadyExistingMemberException {
		Member member = memberDao.selectByEmail(req.getEmail());
		if (member != null) {
			throw new AlreadyExistingMemberException("dup email " + req.getEmail());
		}
		Member newMember = new Member(req.getEmail(), req.getPassword(), req.getName(), new Date());
		memberDao.insert(newMember);
	}
}

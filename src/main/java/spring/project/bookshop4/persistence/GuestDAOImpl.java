package spring.project.bookshop4.persistence;

import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.project.bookshop4.vo.GuestVO;

@Repository
public class GuestDAOImpl implements GuestDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
    private JavaMailSender mailSender;
	
	@Override
	public Map<String, Object> selectUser(String userid) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.GuestDAO.selectUser", userid);
	}

	@Override
	public int addGuest(GuestVO guest) {
		return sqlSession.insert("spring.project.bookshop4.persistence.GuestDAO.addGuest", guest);
	}

	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.GuestDAO.idCheck", id);
	}

	@Override
	public String rememberId(Map<String, Object> map) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.GuestDAO.rememberId", map);
	}

	@Override
	public int rememberPwd(Map<String, Object> map) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.GuestDAO.rememberPwd", map);
	}

	@Override
	public int updatePwd(Map<String, Object> map) {
		return sqlSession.update("spring.project.bookshop4.persistence.GuestDAO.updatePwd", map);
	}

	@Override
	public int sendmail(String toEmail, String pwd) {
		int success = 0;
		
		 try{
           MimeMessage message = mailSender.createMimeMessage();
           String txt = "임시 비밀 번호가 발급되었습니다. 임시비밀번호 :  "+pwd.toString();
           message.setSubject("ㅅㅇ서점 - 임시 비밀번호 발급.");
           message.setText(txt, "UTF-8", "html");
           message.setFrom(new InternetAddress("haruhism1234@gmail.com"));
           message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
           mailSender.send(message);
           success = 1;
	       }catch(Exception e){
	           System.out.println("이메일 전송 실패");
	       }   
	
		 return success;
	}

	@Override
	public GuestVO searchGuest(String id) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.GuestDAO.searchGuest", id);
	}

	@Override
	public int guestListCnt() {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.GuestDAO.guestListCnt");
	}

	@Override
	public int searchGuestCnt(String search) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.GuestDAO.searchGuestCnt", search);
	}

	@Override
	public List<GuestVO> getGuestList(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.GuestDAO.getGuestList", map);
	}

	@Override
	public List<GuestVO> searchGuestList(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.GuestDAO.searchGuestList", map);
	}

	@Override
	public int updateGuset(GuestVO guest) {
		return sqlSession.update("spring.project.bookshop4.persistence.GuestDAO.updateGuset", guest);
	}

	@Override
	public int guestDeletePro(String id) {
		return sqlSession.delete("spring.project.bookshop4.persistence.GuestDAO.guestDeletePro", id);
	}
	
	
}

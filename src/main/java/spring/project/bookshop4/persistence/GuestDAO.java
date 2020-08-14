package spring.project.bookshop4.persistence;

import java.util.List;
import java.util.Map;

import spring.project.bookshop4.vo.GuestVO;

public interface GuestDAO {
	//로그인
	public Map<String, Object> selectUser(String userid);
	//회원가입
	public int addGuest(GuestVO guest);
	//회원 가입 - 아이디 중복체크
	public int idCheck(String id);
	
	//아이디 찾기
	public String rememberId(Map<String, Object> map);//String name, String email
	//비밀번호 찾기 - 회원정보 확인
	public int rememberPwd(Map<String, Object> map);//String id, String name, String email
	//임시비밀번호로 변경
	public int updatePwd(Map<String, Object> map);//String id, String pwd
	//비밀번호 메일로 전송
	public int sendmail(String toEmail, String pwd);
	//손님 정보 가져오기
	public GuestVO searchGuest(String id);
	
	//손님 숫자 가져오기
	public int guestListCnt();
	public int searchGuestCnt(String search);
	//손님 목록 가져오기
	public List<GuestVO> getGuestList(Map<String, Object> map);//int start, int end
	public List<GuestVO> searchGuestList(Map<String, Object> map);//int start, int end, String search
	
	//손님 정보 업데이트
	public int updateGuset(GuestVO guest);
	//손님 강제 탈퇴시키기
	public int guestDeletePro(String id);
}
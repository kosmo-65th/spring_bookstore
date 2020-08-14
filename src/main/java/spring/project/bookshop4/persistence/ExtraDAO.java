package spring.project.bookshop4.persistence;

import java.util.List;

import spring.project.bookshop4.vo.MessageVO;

public interface ExtraDAO {
	//메세지 추가
	public int addMessage(String message);
	//메세지 리스트
	public List<MessageVO> getMessage();
	//메세지 삭제
	public int deleteMessage(int num);
}

package spring.project.bookshop4.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.project.bookshop4.vo.MessageVO;

@Repository
public class ExtraDAOImpl implements ExtraDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int addMessage(String message) {
		return sqlSession.insert("spring.project.bookshop4.persistence.ExtraDAO.addMessage", message);
	}

	@Override
	public List<MessageVO> getMessage() {
		return sqlSession.selectList("spring.project.bookshop4.persistence.ExtraDAO.getMessage");
	}

	@Override
	public int deleteMessage(int num) {
		return sqlSession.delete("spring.project.bookshop4.persistence.ExtraDAO.deleteMessage", num);
	}
	
	
}

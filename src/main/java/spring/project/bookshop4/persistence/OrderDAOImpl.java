package spring.project.bookshop4.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.project.bookshop4.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int shoppingCartCheck(Map<String, Object> map) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.OrderDAO.shoppingCartCheck", map);
	}

	@Override
	public int shoppingCartAdd(Map<String, Object> map) {
		return sqlSession.insert("spring.project.bookshop4.persistence.OrderDAO.shoppingCartAdd", map);
	}

	@Override
	public int buyBookPro(Map<String, Object> map) {
		return sqlSession.insert("spring.project.bookshop4.persistence.OrderDAO.buyBookPro", map);
	}

	@Override
	public int deleteFromCart(Map<String, Object> map) {
		return sqlSession.delete("spring.project.bookshop4.persistence.OrderDAO.deleteFromCart", map);
	}

	@Override
	public List<OrderVO> getShoppingCartList(String id) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.OrderDAO.getShoppingCartList", id);
	}

	@Override
	public List<OrderVO> getOrderList(String id) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.OrderDAO.getOrderList", id);
	}

	@Override
	public int resultMonthly() {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.OrderDAO.resultMonthly");
	}

	@Override
	public int resultYearly() {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.OrderDAO.resultYearly");
	}

	@Override
	public int resultMonthlyCnt() {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.OrderDAO.resultMonthlyCnt");
	}

	@Override
	public int resultYearlyCnt() {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.OrderDAO.resultYearlyCnt");
	}

	@Override
	public int graphMonthly(String month) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.OrderDAO.graphMonthly", month);
	}

	@Override
	public int commonOrderCnt(String status) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.OrderDAO.commonOrderCnt", status);
	}

	@Override
	public int commonSearchOrderCnt(Map<String, Object> map) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.OrderDAO.commonSearchOrderCnt", map);
	}

	@Override
	public List<OrderVO> commonGetOrderList(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.OrderDAO.commonGetOrderList", map);
	}

	@Override
	public List<OrderVO> commonSearchOrderList(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.OrderDAO.commonSearchOrderList", map);
	}

	@Override
	public int commonOrderUpdate(Map<String, Object> map) {
		return sqlSession.update("spring.project.bookshop4.persistence.OrderDAO.commonOrderUpdate", map);
	}

	@Override
	public int deliverPro(Map<String, Object> map) {
		return sqlSession.update("spring.project.bookshop4.persistence.OrderDAO.deliverPro", map);
	}

	@Override
	public int changeOrdered(Map<String, Object> map) {
		return sqlSession.update("spring.project.bookshop4.persistence.OrderDAO.changeOrdered", map);
	}

	
}

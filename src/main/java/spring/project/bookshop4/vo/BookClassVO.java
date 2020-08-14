package spring.project.bookshop4.vo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.project.bookshop4.persistence.BookDAO;

@Component
public class BookClassVO {
	@Autowired
	BookDAO dao;
	
	HashMap<String, String> bookClass=new HashMap<String, String>();
	
	public BookClassVO() {
		bookClass.put("01009","기타");
		/*
		List<Map<String, String>> bookClassList = dao.getBookClass();
		for(Map<String, String> map: bookClassList) {
			bookClass.put(map.get("bookClass"), map.get("className"));
		}*/
	}
	
	public String getValue(String key) {
		return bookClass.get(key);
	}
	
	public Set<String> getKey() {
		return bookClass.keySet();
	}
}

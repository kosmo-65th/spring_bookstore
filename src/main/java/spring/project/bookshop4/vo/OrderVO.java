package spring.project.bookshop4.vo;

import java.sql.Timestamp;

public class OrderVO {
	//쇼핑카트도 같이 이용
	//CARTNUM, ISBN, ID, COUNT
	
	//ORDERNUM, ISBN ,ID ,COUNT, ORDERDATE, DELIVER, STATUS
	//orderNum, ISBN, id, count, orderDate, deliver, status
	private int orderNum;
	private String ISBN;
	private String id;
	private int count;
	private Timestamp orderDate;
	private Timestamp completeDate;
	private String deliver;
	private String status;
	private String status_kor;
	//같은 테이블에 없는값
	private int price;
	private int totalPrice;
	private int maxCount;
	
	//손님때매 추가한거
	private String bookName;
	private String bookWriter;
	private String bookPublisher;
	private String bookImage;
	
	
	
	public int getMaxCount() {
		return maxCount;
	}
	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getStatus_kor() {
		return status_kor;
	}
	public Timestamp getCompleteDate() {
		return completeDate;
	}
	public void setCompleteDate(Timestamp completeDate) {
		this.completeDate = completeDate;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public String getISBN() {
		return ISBN;
	}
	public String getId() {
		return id;
	}
	public int getCount() {
		return count;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public String getDeliver() {
		return deliver;
	}
	public String getStatus() {
		return status;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public void setDeliver(String deliver) {
		this.deliver = deliver;
	}
	public void setStatus(String status) {
		switch(status) { 
			case "1" : status_kor="주문요청"; break;
			case "2" : status_kor="배송중"; break;
			case "3" : status_kor="주문완료"; break;
			case "4" : status_kor="환불요청"; break;
			case "5" : status_kor="환불완료"; break;
			case "6" : status_kor="환불취소"; break;
			case "7" : status_kor="주문취소"; break;
		}
		this.status = status;
	}
}

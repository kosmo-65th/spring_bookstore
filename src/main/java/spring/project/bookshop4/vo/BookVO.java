package spring.project.bookshop4.vo;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public class BookVO {
	//ISBN, BOOKNAME, BOOKWRITER, BOOKPUBLISHER, PUBLISHDATE, BOOKCLASS, BOOKIMAGE, BOOKPRICE, SALE, PAGE, BOOKCOUNT, VISION
	//ISBN, bookName, bookWriter, bookPublisher, bookClass, bokkImage, bookImage, bookPrice, sale, page, bookCount, publishDate, vision
	
	@Autowired
	BookClassVO bookClassVO;
	
	private String ISBN;
	private String bookName;
	private String bookWriter;
	private String bookPublisher;
	private String bookClass;
	private String bookClassSet;
	private String bookClassKor;
	
	private String bookImage;
	private int bookPrice;
	private int sale;
	private int page;
	private int bookCount;
	private Timestamp publishDate;
	private int vision;
	
	
	public String getBookClassSet() {
		return bookClassSet;
	}
	public String getBookClassKor() {
		return bookClassKor;
	}
	public int getVision() {
		return vision;
	}
	public void setVision(int vision) {
		this.vision = vision;
	}
	public Timestamp getPublishDate() {
		return publishDate;
	}
	public String getPublishDateForString() {
		return publishDate.toString().substring(0, 10);
	}
	public void setPublishDate(Timestamp publishDate) {
		this.publishDate = publishDate;
	}
	public String getISBN() {
		return ISBN;
	}
	public String getBookName() {
		return bookName;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public String getBookClass() {
		return bookClass;
	}
	public String getBookImage() {
		return bookImage;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public int getSale() {
		return sale;
	}
	public int getPage() {
		return page;
	}
	public int getBookCount() {
		return bookCount;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public void setBookClass(String bookClass) {
		this.bookClass = bookClass;
		switch(bookClass.substring(0,2)) {
			case "01" : this.bookClassSet = "산업인력공단";break;
			case "02" : this.bookClassSet = "자격증";break;
			case "03" : this.bookClassSet = "어학";break;
			case "04" : this.bookClassSet = "컴퓨터/IT";break;
		}
		switch(bookClass) {
			case "01001" : this.bookClassKor = "토목";break;
			case "01002" : this.bookClassKor = "건설";break;
			case "01003" : this.bookClassKor = "환경";break;
			case "01004" : this.bookClassKor = "에너지";break;
			case "01005" : this.bookClassKor = "전기";break;
			case "01006" : this.bookClassKor = "기계";break;
			case "01007" : this.bookClassKor = "산업응용";break;
			case "01008" : this.bookClassKor = "위생";break;
			case "01009" : this.bookClassKor = "기타";break;
			case "02001" : this.bookClassKor = "조리/미용/패션";break;
			case "02002" : this.bookClassKor = "한국어능력시험";break;
			case "02003" : this.bookClassKor = "한국어능력검정시험";break;
			case "02004" : this.bookClassKor = "공인중개사/주택관리사";break;
			case "02005" : this.bookClassKor = "경제/금융/회계";break;
			case "02006" : this.bookClassKor = "운전/교통";break;
			case "03001" : this.bookClassKor = "TOEIC";break;
			case "03002" : this.bookClassKor = "TOFEL";break;
			case "03003" : this.bookClassKor = "TEPS";break;
			case "03004" : this.bookClassKor = "OPIC";break;
			case "03005" : this.bookClassKor = "중국어";break;
			case "03006" : this.bookClassKor = "일본어";break;
			case "03007" : this.bookClassKor = "프로그래밍언어";break;
			case "04002" : this.bookClassKor = "오피스(액셀/파워포인트)";break;
			case "04003" : this.bookClassKor = "웹디자인/홈페이지";break;
			case "04004" : this.bookClassKor = "그래픽/멀티그래픽";break;
			case "04005" : this.bookClassKor = "컴퓨터공학";break;	
			case "04006" : this.bookClassKor = "게임";break;		
		}
		
		
		//this.bookClassKor = bookClassVO.getValue(bookClass);
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}
	@Override
	public String toString() {
		StringBuilder str = new StringBuilder("");
		str.append("ISBN : " + ISBN +"/");
		str.append("bookName : " + bookName +"/");
		str.append("bookWriter : " + bookWriter +"/");
		str.append("bookPublisher : " + bookPublisher +"/");
		str.append("bookClass : " + bookClass +"/");
		str.append("bookImage : " + bookImage +"/");
		str.append("ISBN : " + ISBN +"/");
		str.append("bookPrice : "+ Integer.toString(bookPrice)+ "/");
		str.append("sale : "+ Integer.toString(sale)+ "/");
		str.append("page : "+ Integer.toString(page)+ "/");
		str.append("bookCount : "+ Integer.toString(bookCount)+ "/");
		str.append("publishDate : "+publishDate.toString()+ "/");
		str.append("vision :"+Integer.toString(vision));
		return str.toString();
	}
}

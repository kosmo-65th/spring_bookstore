package spring.project.bookshop4.vo;

import java.sql.Timestamp;

public class MessageVO {
	int num;
	String message;
	Timestamp time;
	
	
	public int getNum() {
		return num;
	}
	public String getMessage() {
		return message;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
}

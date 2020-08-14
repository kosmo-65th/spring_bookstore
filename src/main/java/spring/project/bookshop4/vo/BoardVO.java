package spring.project.bookshop4.vo;

import java.sql.Timestamp;

public class BoardVO {
	//BOARDNUM, WRITER, TITLE, CONTENT, LOCKB, RE, WRITEDATE, RE_CONTENT, RE_WRITEDATE
	//boardNum, writer, title, content, lockB, re, writeDate, re_content, re_writeDate
	private int boardNum;
	private String writer;
	private String title;
	private String content;
	private String lockB;
	private String re;
	private Timestamp writeDate;
	private int viewCount;

	private String re_content;
	private Timestamp re_writeDate;
	
	
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public String getWriter() {
		return writer;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getLockB() {
		return lockB;
	}
	public String getRe() {
		return re;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public String getRe_content() {
		return re_content;
	}
	public Timestamp getRe_writeDate() {
		return re_writeDate;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setLockB(String lockB) {
		this.lockB = lockB;
	}
	public void setRe(String re) {
		this.re = re;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public void setRe_writeDate(Timestamp re_writeDate) {
		this.re_writeDate = re_writeDate;
	}
}

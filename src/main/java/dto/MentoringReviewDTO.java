package dto;

import java.util.Date;

public class MentoringReviewDTO {

	private int mentoring_review_no;
	private int mentoring_no;
	private Date reg_date;
	private String content;
	private int grade;
	private String writer;
	
	public int getMentoring_review_no() {
		return mentoring_review_no;
	}
	public void setMentoring_review_no(int mentoring_review_no) {
		this.mentoring_review_no = mentoring_review_no;
	}
	public int getMentoring_no() {
		return mentoring_no;
	}
	public void setMentoring_no(int mentoring_no) {
		this.mentoring_no = mentoring_no;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
}

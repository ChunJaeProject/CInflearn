package dto;

import java.time.LocalDateTime;

public class MentoringReviewDTO {

	private int no;
	private int mentoring_no;
	private LocalDateTime reg_date;
	private String content;
	private int grade;
	private String mentoring_name;
	
	public MentoringReviewDTO(){}
	/**
	 * @return the no
	 */
	public int getNo() {
		return no;
	}
	/**
	 * @param no the no to set
	 */
	public void setNo(int no) {
		this.no = no;
	}
	/**
	 * @return the mentoring_no
	 */
	public int getMentoring_no() {
		return mentoring_no;
	}
	/**
	 * @param mentoring_no the mentoring_no to set
	 */
	public void setMentoring_no(int mentoring_no) {
		this.mentoring_no = mentoring_no;
	}
	/**
	 * @return the reg_date
	 */
	public LocalDateTime getReg_date() {
		return reg_date;
	}
	/**
	 * @param reg_date the reg_date to set
	 */
	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the grade
	 */
	public int getGrade() {
		return grade;
	}
	/**
	 * @param grade the grade to set
	 */
	public void setGrade(int grade) {
		this.grade = grade;
	}
	/**
	 * @return the mentoring_name
	 */
	public String getMentoring_name() {
		return mentoring_name;
	}
	/**
	 * @param mentoring_name the mentoring_name to set
	 */
	public void setMentoring_name(String mentoring_name) {
		this.mentoring_name = mentoring_name;
	}
}

package dto;

import java.time.LocalDateTime;

public class MentoringSignUpDTO {

	private int no;
	private String mentoring_name;
	private String member_name;
	private String member_email;
	private int member_tel;
	private String message;
	private int member_no;
	private int mentoring_no;
	private LocalDateTime reg_date;
	
	public MentoringSignUpDTO(){}
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
	/**
	 * @return the member_name
	 */
	public String getMember_name() {
		return member_name;
	}
	/**
	 * @param member_name the member_name to set
	 */
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	/**
	 * @return the member_email
	 */
	public String getMember_email() {
		return member_email;
	}
	/**
	 * @param member_email the member_email to set
	 */
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	/**
	 * @return the member_tel
	 */
	public int getMember_tel() {
		return member_tel;
	}
	/**
	 * @param member_tel the member_tel to set
	 */
	public void setMember_tel(int member_tel) {
		this.member_tel = member_tel;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @return the member_no
	 */
	public int getMember_no() {
		return member_no;
	}
	/**
	 * @param member_no the member_no to set
	 */
	public void setMember_no(int member_no) {
		this.member_no = member_no;
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
	public LocalDateTime getRegdate() {
		return reg_date;
	}
	/**
	 * @param reg_date the reg_date to set
	 */
	public void setRegdate(LocalDateTime regdate) {
		this.reg_date = regdate;
	}
	
	
}

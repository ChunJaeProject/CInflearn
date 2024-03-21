package dto;

import java.time.LocalDateTime;
import java.util.Date;

public class LectureReviewDTO {

	private int idx;
	private String writer;
	private Date reg_date;
	private String content;
	private int star;
	private int lecture_no;
	private int member_no;
	
	public LectureReviewDTO(){}
	/**
	 * @return the no
	 */
	public int getNo() {
		return idx;
	}
	/**
	 * @param no the no to set
	 */
	public void setNo(int idx) {
		this.idx = idx;
	}
	/**
	 * @return the writer
	 */
	public String getWriter() {
		return writer;
	}
	/**
	 * @param writer the writer to set
	 */
	public void setWriter(String writer) {
		this.writer = writer;
	}
	/**
	 * @return the reg_date
	 */
	public Date getReg_date() {
		return reg_date;
	}
	/**
	 * @param reg_date the reg_date to set
	 */
	public void setReg_date(Date reg_date) {
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
	 * @return the star
	 */
	public int getStar() {
		return star;
	}
	/**
	 * @param star the star to set
	 */
	public void setStar(int star) {
		this.star = star;
	}
	/**
	 * @return the lecture_no
	 */
	public int getLecture_no() {
		return lecture_no;
	}
	/**
	 * @param lecture_no the lecture_no to set
	 */
	public void setLecture_no(int lecture_no) {
		this.lecture_no = lecture_no;
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
	
}

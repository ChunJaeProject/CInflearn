package dto;

import java.sql.Date;
import java.time.LocalDateTime;

public class LectureDTO {

	private int lecture_no;
	private String lecture_title;
	private String image;
	private String professor;
	private String category1;
	private String category2;
	private String technology_tag;
	private String lecture_detail;
	private String lecture_period;
	private String certificate_yn;
	private String difficulty_grade;
	private int star;
	private String comment;
	private String writer;
	private int curriculum_no;
	private String curriculum_name;
	private String curriculum_time;
	private LocalDateTime regist_date;
	private Date review_reg_date;
	private String starCount;
	public LectureDTO(){}
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
	 * @return the lecture_title
	 */
	public String getLecture_title() {
		return lecture_title;
	}
	/**
	 * @param lecture_title the lecture_title to set
	 */
	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
	}
	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}
	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}
	/**
	 * @return the professor
	 */
	public String getProfessor() {
		return professor;
	}
	/**
	 * @param professor the professor to set
	 */
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	/**
	 * @return the category1
	 */
	public String getCategory1() {
		return category1;
	}
	/**
	 * @param category1 the category1 to set
	 */
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	/**
	 * @return the category2
	 */
	public String getCategory2() {
		return category2;
	}
	/**
	 * @param category2 the category2 to set
	 */
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	/**
	 * @return the technology_tag
	 */
	public String getTechnology_tag() {
		return technology_tag;
	}
	/**
	 * @param technology_tag the technology_tag to set
	 */
	public void setTechnology_tag(String technology_tag) {
		this.technology_tag = technology_tag;
	}
	/**
	 * @return the lecture_detail
	 */
	public String getLecture_detail() {
		return lecture_detail;
	}
	/**
	 * @param lecture_detail the lecture_detail to set
	 */
	public void setLecture_detail(String lecture_detail) {
		this.lecture_detail = lecture_detail;
	}
	/**
	 * @return the lecture_period
	 */
	public String getLecture_period() {
		return lecture_period;
	}
	/**
	 * @param lecture_period the lecture_period to set
	 */
	public void setLecture_period(String lecture_period) {
		this.lecture_period = lecture_period;
	}
	/**
	 * @return the certificate_yn
	 */
	public String isCertificate_yn() {
		return certificate_yn;
	}
	/**
	 * @param certificate_yn the certificate_yn to set
	 */
	public void setCertificate_yn(String certificate_yn) {
		this.certificate_yn = certificate_yn;
	}
	/**
	 * @return the difficulty_grade
	 */
	public String getDifficulty_grade() {
		return difficulty_grade;
	}
	/**
	 * @param difficulty_grade the difficulty_grade to set
	 */
	public void setDifficulty_grade(String difficulty_grade) {
		this.difficulty_grade = difficulty_grade;
	}
	/**
	 * @return the regist_date
	 */
	public LocalDateTime getRegist_date() {
		return regist_date;
	}
	/**
	 * @param regist_date the regist_date to set
	 */
	public void setRegist_date(LocalDateTime regist_date) {
		this.regist_date = regist_date;
	}
	/**
	 * @return the curriculum_no
	 */
	public int getCurriculum_no() {
		return curriculum_no;
	}
	/**
	 * @param curriculum_no the curriculum_no to set
	 */
	public void setCurriculum_no(int curriculum_no) {
		this.curriculum_no = curriculum_no;
	}
	/**
	 * @return the curriculum_name
	 */
	public String getCurriculum_name() {
		return curriculum_name;
	}
	/**
	 * @param curriculum_name the curriculum_name to set
	 */
	public void setCurriculum_name(String curriculum_name) {
		this.curriculum_name = curriculum_name;
	}
	/**
	 * @return the curriculum_time
	 */
	public String getCurriculum_time() {
		return curriculum_time;
	}
	/**
	 * @param curriculum_time the curriculum_time to set
	 */
	public void setCurriculum_time(String curriculum_time) {
		this.curriculum_time = curriculum_time;
	}
	/**
	 * @return the certificate_yn
	 */
	public String getCertificate_yn() {
		return certificate_yn;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(Date date) {
		this.review_reg_date = date;
	}
	public String getStarCount() {
		return starCount;
	}
	public void setStarCount(String starCount) {
		this.starCount = starCount;
	}
	
	
}

package dto;

import java.time.LocalDateTime;

public class QnADTO {

	private int no;
	private String question_title;
	private String question_content;
	private String question_hashtag;
	private String answer;
	private String solution_state;
	private int like;
	private LocalDateTime reg_date;
	private String email;
	
	public QnADTO(){}
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
	 * @return the question_title
	 */
	public String getQuestion_title() {
		return question_title;
	}
	/**
	 * @param question_title the question_title to set
	 */
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	/**
	 * @return the question_content
	 */
	public String getQuestion_content() {
		return question_content;
	}
	/**
	 * @param question_content the question_content to set
	 */
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	/**
	 * @return the question_hashtag
	 */
	public String getQuestion_hashtag() {
		return question_hashtag;
	}
	/**
	 * @param question_hashtag the question_hashtag to set
	 */
	public void setQuestion_hashtag(String question_hashtag) {
		this.question_hashtag = question_hashtag;
	}
	/**
	 * @return the answer
	 */
	public String getAnswer() {
		return answer;
	}
	/**
	 * @param answer the answer to set
	 */
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	/**
	 * @return the solution_state
	 */
	public String getSolution_state() {
		return solution_state;
	}
	/**
	 * @param solution_state the solution_state to set
	 */
	public void setSolution_state(String solution_state) {
		this.solution_state = solution_state;
	}
	/**
	 * @return the like
	 */
	public int getLike() {
		return like;
	}
	/**
	 * @param like the like to set
	 */
	public void setLike(int like) {
		this.like = like;
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
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
}

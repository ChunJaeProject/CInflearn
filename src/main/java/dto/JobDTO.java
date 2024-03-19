package dto;

public class JobDTO {

	private int job_code;
	private String job_title;
	
	public JobDTO(){}
	/**
	 * @return the job_code
	 */
	public int getJob_code() {
		return job_code;
	}
	/**
	 * @param job_code the job_code to set
	 */
	public void setJob_code(int job_code) {
		this.job_code = job_code;
	}
	/**
	 * @return the job_title
	 */
	public String getJob_title() {
		return job_title;
	}
	/**
	 * @param job_title the job_title to set
	 */
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
}

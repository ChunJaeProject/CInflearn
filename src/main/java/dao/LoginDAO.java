package dao;

import common.JDBConnect;
import jakarta.servlet.ServletContext;



public class LoginDAO extends JDBConnect {

	public LoginDAO() {
		
	}
	public LoginDAO(ServletContext application) {
		super(application);
	
	}
}

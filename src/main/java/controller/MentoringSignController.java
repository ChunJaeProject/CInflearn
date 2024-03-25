package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import dao.MentoringDAO;
import dao.MentoringSignUpDAO;
import dto.MentoringDTO;
import dto.MentoringSignUpDTO;

@WebServlet("/mentor/mentoringSign.do")
public class MentoringSignController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String id = req.getParameter("ap_name");
		String email = req.getParameter("ap_email");
		int tel = Integer.parseInt(req.getParameter("ap_tel"));
		String msg = req.getParameter("ap_msg");
		String date = req.getParameter("endDate");
		

		MentoringSignUpDTO dto = new MentoringSignUpDTO();
		dto.setMessage(msg);
		dto.setMentoring_no(2);
		dto.setMember_no((int)session.getAttribute("memberNo"));
		dto.setMentoring_name("채종윤");
		dto.setMember_name(id);
		dto.setMember_email(email);
		dto.setMember_tel(tel);
		dto.setRegdate(date);
		
		
		
		MentoringSignUpDAO dao = new MentoringSignUpDAO();
		
		int result = dao.getMentoringSignUpInfo(dto);
		if(result==1) {
			
			resp.sendRedirect("/ChunjaeProject/mentor/mentor.do");
		}
		else {
			
			resp.sendRedirect("/ChunjaeProject/mentor/mentor.do");
	}

}
}

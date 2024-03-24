package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.LectureDetailDAO;
import dao.MentoringDAO;
import dao.MentoringSignUpDAO;
import dto.LectureDTO;
import dto.MentoringSignUpDTO;

@WebServlet("/mentor/mentoringSignUp.do")
public class MentoringSignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MentoringSignUpController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("123");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		java.sql.Date reg_date = Date.parse((req.getParameter("reg_date")));
//		String member_name = req.getParameter("member_name");
//		String member_email = req.getParameter("member_email");
//		int member_tel = Integer.parseInt(req.getParameter("member_tel"));
//		String message = req.getParameter("message");
//		
//		MentoringSignUpDTO dto = new MentoringSignUpDTO();
//
//		dto.setRegdate(reg_date);
//		dto.setMember_name(member_name);
//		dto.setMember_email(member_email);
//		dto.setMember_tel(member_tel);
//		dto.setMessage(message);
//		
		
		int mentoring_no = 1;
		mentoring_no = ((req.getParameter("no")) != null ? Integer.parseInt(req.getParameter("no")) : 1);
		MentoringSignUpDAO dao = new MentoringSignUpDAO();
		
		List<MentoringSignUpDTO> mentoring_list = dao.getMentoringSignUpInfo(mentoring_no);
			
		req.setAttribute("mentoring_list", mentoring_list);
		resp.sendRedirect("/ChunjaeProject/mentor/mentor.do");
	}

}

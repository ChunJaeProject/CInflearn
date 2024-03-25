package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.MentoringDAO;
import dto.MentoringDTO;

@WebServlet("/mentor/mentoringRegist.do")
public class MentoringRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("123");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		
		String career = req.getParameter("career");
		String job = req.getParameter("job");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		int phone = Integer.parseInt(req.getParameter("phone"));
		String cate = req.getParameter("cate");
		String StartDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String mentoringName = req.getParameter("mentoringName");
		String mentoringInfo = req.getParameter("mentoringInfo");
		int memberNo = (int)session.getAttribute("memberNo");
		System.out.println("memberNo"  +memberNo);
		
		MentoringDTO dto = new MentoringDTO();
		
		dto.setCareer(career);
		dto.setJob(job);
		dto.setMember_email(email);
		dto.setMember_name(name);
		dto.setMember_tel(phone);
		dto.setJob_code(cate);
		dto.setStart_date(StartDate);
		dto.setEnd_date(endDate);
		dto.setMentoring_name(mentoringName);
		dto.setMentoring_intro(mentoringInfo);
		dto.setMember_no(memberNo);
		
		MentoringDAO dao = new MentoringDAO();
		
		int result = dao.mentoringRegist(dto);
		System.out.println(result);
		resp.sendRedirect("/ChunjaeProject/mentor/mentor.do");
		System.out.println("req after");
	}

}

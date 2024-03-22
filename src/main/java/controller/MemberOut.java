package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.LoginDAO;
import dto.LoginDTO;

//회원탈퇴
@WebServlet("/login/memberOut.do")
public class MemberOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String email =(String) session.getAttribute("userId");
		String password = req.getParameter("password");
	
		
		LoginDTO dto = new LoginDTO();

		LoginDAO dao =  new LoginDAO();
		int result = dao.memberDelete(email,password);
		try {
		if(result>0  ){
			session.removeAttribute("userId");
			req.setAttribute("message", "삭제완료");
			resp.sendRedirect("../mainPage/Main.jsp");
		
			dao.close();
		
		}
		}catch(Exception e) {
			req.setAttribute("message", "삭제실패");
			req.getRequestDispatcher("/login/LeaveMemberComplete.jsp").forward(req, resp);
		}
	}

}

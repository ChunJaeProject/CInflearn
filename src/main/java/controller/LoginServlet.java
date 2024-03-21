package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import dao.LoginDAO;
import dto.LoginDTO;

//회원등록
@WebServlet("/login/regist.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("./SignUp.jsp").forward(req, resp);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		
		String password = req.getParameter("password");
		
		LoginDTO dto = new LoginDTO();

		dto.setEmail(email);
		dto.setPassword(password);
		LoginDAO dao =  new LoginDAO();
		int result = dao.LoginRegist(dto);
		req.setAttribute("result" ,result);
		req.setAttribute("email", email);
		
		if(result==1) {
			req.getRequestDispatcher("./SignComplete.do").forward(req, resp);
		}
		else {
			System.out.println("글쓰기에 실패하였습니다.");
			resp.sendRedirect("./SignUp.jsp");
	}

		
	}

}

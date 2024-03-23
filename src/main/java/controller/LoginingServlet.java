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

//로그인
@WebServlet("/login/loging.do")
public class LoginingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String id = req.getParameter("email");
		String pwd = req.getParameter("password");
		


		LoginDAO dao = new LoginDAO() ;
		LoginDTO dto = dao.getMemberInfo(id,pwd);
		dao.close(); // super()로 호출한 메서드 안에 close()메서드가 존재하기때문에 사용가능

		//로그인 세션 저장
		if(dto != null && dto.getEmail() !=null){
			session.setAttribute("userId",dto.getEmail()); //성공한 변수를 모든 페이지에 사용하려고 session객체를 사용
			session.setAttribute("memberNo", dto.getNo()); //맴버 no 세션에 저장
			
			resp.sendRedirect("../mainPage/Main.do");
		}

		else{
			req.setAttribute("loginError", "아이디와 비밀번호가 맞지 않습니다.");
			req.getRequestDispatcher("../mainPage/Main.do").forward(req,resp);
		}
	}

}

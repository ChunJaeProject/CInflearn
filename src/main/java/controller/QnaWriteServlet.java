package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.QnADAO;
import dto.QnADTO;

@WebServlet("/qna/Write.do")
public class QnaWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("./Write.jsp").forward(req, resp);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//세션에서 맴버정보 가져오기
		HttpSession session = req.getSession();
		
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int member_no = (int)(session.getAttribute("memberNo"));
		
		

		QnADTO dto = new QnADTO ();
		dto.setQuestion_title(title);
		dto.setQuestion_content(content);
		dto.setMember_no(member_no);
		
		QnADAO dao =  new QnADAO();
		int result = dao.QnARegist(dto);
		req.setAttribute("result" ,result);
		
		if(result==1) {
			resp.sendRedirect("../qna/Qna.do");
		}
		else {
			System.out.println("글쓰기에 실패하였습니다.");
			resp.sendRedirect("../qna/Qna.do");
	}
	}

}

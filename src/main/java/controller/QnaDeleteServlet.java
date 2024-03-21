package controller;

import java.io.IOException;

import dao.QnADAO;
import dto.QnADTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/qna/delete.do")
public class QnaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int no = (req.getParameter("no")!= null ?Integer.parseInt(req.getParameter("no")):0);		
		QnADAO dao = new QnADAO();
		QnADTO QnADelete = new QnADTO();
		
		if(no > 0) {
			int result = dao.QnADelete(no);
			dao.close();
			
			if(result > 0) {
				resp.sendRedirect("Qna.do");
			} else {
				req.getRequestDispatcher("QnaDetail.do?no="+no).forward(req, resp);	
			}
		} else {
			//로그인 후 이용
			//resp.sendRedirect("");
		}
		req.setAttribute("QnADelete", QnADelete);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

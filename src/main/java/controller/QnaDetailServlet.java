package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import common.CommonUtil;
import dao.QnADAO;
import dto.QnADTO;

@WebServlet("/qna/QnaDetail.do")
public class QnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int no = CommonUtil.parseInt(req.getParameter("no"));
		QnADTO QnADetail = new QnADTO();
		
		if(no > 0) {
			QnADAO dao = new QnADAO();
			QnADetail = dao.QnADetail(no);
			dao.close();
		} else {
			resp.sendRedirect("Qna.do");
		}
		
		String question_title ="";
		String question_hashtag ="";
		String question_content ="";
		String solution_state = "";
		String answer="";
		
		if(QnADetail != null) {
			no = QnADetail.getNo();
			question_title = QnADetail.getQuestion_title();
			question_hashtag = QnADetail.getQuestion_hashtag();
			question_content = QnADetail.getQuestion_content();
			question_content = (question_content!=null ?question_content.replace("\n\r", "<br>") : "");
			question_content = (question_content!=null ?question_content.replace(" ", "&nbsp;") : "");
			answer = QnADetail.getAnswer();
		}
		
		
		req.setAttribute("QnADetail", QnADetail);
		req.getRequestDispatcher("/qna/QnaDetail.jsp").forward(req, resp);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

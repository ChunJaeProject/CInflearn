package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.CommonUtil;
import dao.CommentDAO;
import dao.QnADAO;
import dto.CommentDTO;
import dto.QnADTO;

@WebServlet("/qna/QnaDetail.do")
public class QnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int no = CommonUtil.parseInt(req.getParameter("no"));
		QnADTO QnADetail = new QnADTO();
		CommentDAO cdao = new CommentDAO();
		Map<String, Object> params = new HashMap<String,Object>();

		Map<String, Object> cparams = new HashMap<String,Object>(); //댓글파람
		List<CommentDTO> commList = cdao.commentList(cparams,no);
	
		int total_count = cdao.commentCount(params,no); //댓글 수
		
		
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
		String answer="";
		int member_no =1;
		
		if(QnADetail != null) {
			no = QnADetail.getNo();
			question_title = QnADetail.getQuestion_title();
			question_hashtag = QnADetail.getQuestion_hashtag();
			question_content = QnADetail.getQuestion_content();
			question_content = (question_content!=null ?question_content.replace("\n\r", "<br>") : "");
			question_content = (question_content!=null ?question_content.replace(" ", "&nbsp;") : "");
			answer = QnADetail.getAnswer();
			member_no = QnADetail.getMember_no();
		}
		
		params.put("idx",no);
		System.out.println("params.idx 값 : " +params.get("idx"));
		params.put("question_title",question_title);
		params.put("question_hashtag",question_hashtag);
		params.put("question_content",question_content);
		params.put("answer",answer);
		params.put("total_count", total_count);
		params.put("memberNo", member_no);
			
		req.setAttribute("commList", commList);
		req.setAttribute("params", params);
		req.setAttribute("QnADetail", QnADetail);
		req.getRequestDispatcher("/qna/QnaDetail.jsp").forward(req, resp);


		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

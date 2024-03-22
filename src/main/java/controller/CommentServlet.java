package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.CommentDAO;
import dao.QnADAO;
import dto.CommentDTO;
import dto.QnADTO;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/qna/comment.do")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int qna_no  = Integer.parseInt(req.getParameter("no"));


		String content = req.getParameter("answerWrite");
		int member_no = 2;

		CommentDTO dto = new CommentDTO ();
		
		dto.setContent(content);
		dto.setMember_no(member_no);
		dto.setQna_no(qna_no);

		
		CommentDAO dao =  new CommentDAO();
		int result = dao.CommentRegist(dto);
		req.setAttribute("result" ,result);
		
		if(result==1) {
			resp.sendRedirect("../qna/QnaDetail.do?no="+qna_no);
		}
		else {
			System.out.println("글쓰기에 실패하였습니다.");
			resp.sendRedirect("../qna/QnaDetail.do?no="+qna_no);
	}

}
}

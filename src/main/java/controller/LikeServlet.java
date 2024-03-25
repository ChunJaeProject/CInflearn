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

@WebServlet("/qna/like.do")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		
		int like = Integer.parseInt(req.getParameter("like"));
		int no = Integer.parseInt(req.getParameter("no"));
		int state = Integer.parseInt(req.getParameter("state"));
		
		QnADTO dto = new QnADTO();
		dto.setLike(like);
		dto.setNo(no);
		
		
		QnADAO dao =  new QnADAO();
		int result = dao.likeUpdate(dto,state);
		System.out.println(" result:  + " +result );
		dao.close();
		
		try {
		if(result>0){
			System.out.println("반영성공");
			resp.sendRedirect("../qna/QnaDetail.do?no="+no);
			dao.close();
		}
		}catch(Exception e ) {
			e.printStackTrace();
		}
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

}
}

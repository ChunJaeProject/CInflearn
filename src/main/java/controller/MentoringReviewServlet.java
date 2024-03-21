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

import dao.MentoringReviewDAO;
import dao.ReviewDAO;
import dto.LectureReviewDTO;
import dto.MentoringReviewDTO;

@WebServlet("/qna/MentoringReview.do")
public class MentoringReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int total_count =0;
		
		Map<String, Object> maps = new HashMap<String, Object>();
		MentoringReviewDAO dao = new MentoringReviewDAO();
		total_count = dao.MentoringReviewTotalCount(maps);
		
		List<MentoringReviewDTO> MentoringReviewList = dao.MentoringReviewList(maps);
		
		dao.close();
		
		maps.put("total_count", total_count);
		
		req.setAttribute("MentoringReviewList", MentoringReviewList);
		req.setAttribute("maps", maps);
		
		req.getRequestDispatcher("/qna/MentoringReview.jsp").forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

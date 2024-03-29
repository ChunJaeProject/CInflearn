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

import dao.LectureDAO;
import dao.LectureDetailDAO;
import dto.LectureDTO;

@WebServlet("/lecture/lecture.do")
public class LectureDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LectureDetailController() {
        super();
    }
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int lecture_no = 1;
		

		lecture_no = Integer.parseInt(req.getParameter("no"));
		
		LectureDetailDAO dao = new LectureDetailDAO();
		
		List<LectureDTO> lectureList = dao.getLectureInfo(lecture_no);
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		List<LectureDTO> lectureReviewList = dao.getLectureReview(lecture_no);
//		lecture_no = (req.getParameter("lecture_no") != null ? Integer.parseInt(req.getParameter("lecture_no")) : 0);
//		lecture_title = req.getParameter("lecture_title");
//		image = req.getParameter("image");
//		professor = req.getParameter("professor");
//		category2 = req.getParameter("category2");
//		difficulty_grade = req.getParameter("difficulty_grade");
//		
//		params.put("lecture_no", lecture_no);
//		params.put("lecture_title", lecture_title);
//		params.put("image", image);
//		params.put("professor", professor);
//		params.put("category2", category2);
//		params.put("difficulty_grade", difficulty_grade);
//		params.put("technology_tag", technology_tag);
//		params.put("total_count", total_count);
//		params.put("technology_search_word", technology_search_word);
//		params.put("lecture_search_word", lecture_search_word);
//		params.put("total_count", total_count);
//		
//		List<LectureDTO> lectureList = dao.lectureList(params);
//		
//		dao.close();
//		
//		
		req.setAttribute("lectureList", lectureList);
		req.setAttribute("lectureReviewList", lectureReviewList);
		//req.setAttribute("params", params);
		
		req.getRequestDispatcher("/lecture/lecture.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("1234");
	}

}

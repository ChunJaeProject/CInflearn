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

import common.CommonPage;
import dao.LectureDAO;
import dto.LectureDTO;

@WebServlet("/mainPage/Main.do")
public class LectureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LectureController() {
        super();
    }
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int lecture_no = 1;
//		String lecture_title = "";
//		String image = "";
//		String professor = "";
//		String category2 = "";
//		String difficulty_grade = "";
//		String technology_tag = "";
//		String technology_search_word = "";
//		String lecture_search_word = "";
//		
//		
//		int total_count = 0;
//		
//		LectureDAO dao = new LectureDAO();
//		
//		
//		Map<String, Object> params = new HashMap<String, Object>();
//		
//		lecture_no = (req.getParameter("lecture_no") != null ? Integer.parseInt(req.getParameter("lecture_no")) : 0);
//		lecture_title = req.getParameter("lecture_title");
//		image = req.getParameter("image");
//		professor = req.getParameter("professor");
//		category2 = req.getParameter("category2");
//		difficulty_grade = req.getParameter("difficulty_grade");
//		technology_search_word = req.getParameter("technology_search_word");
//		lecture_search_word = req.getParameter("lecture_search_word");
//		
//		total_count = dao.lectureTotalCount(params);
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
////		for(int i=0; i<lectureCategoryFilterList.size(); i++) {
////		System.out.print(lectureCategoryFilterList.get(i)); }
		 
		int total_count = 0;
		int page_no = 1;
		int page_size = 10;
		int total_page = 1;
		int page_skip_cnt = 10;
		int page_block_size = 10;
		int page_block_start = 1;
		int page_block_end = 1;
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		page_no = (req.getParameter("page_no")!=null) ? Integer.parseInt(req.getParameter("page_no")) : 1;
		page_skip_cnt = (page_no-1)*page_size;
		
		params.put("pageNo", page_no);
		params.put("page_size", page_size);
		params.put("page_skip_cnt", page_skip_cnt);
		
		//DAO 생성
		LectureDAO dao = new LectureDAO();
		total_count = dao.lectureTotalCount(params);
		
		total_page = (int)Math.ceil(total_count/(double)page_size);
		
		page_block_size = 10;
		page_block_start = (int)Math.floor((page_no-1)/(double)page_size)*page_size +1;
		page_block_end = (int)Math.ceil(page_no/(double)page_size)*page_size;
		page_block_end = (page_block_end>total_page?total_page:page_block_end);
		
		params.put("total_count", total_count);
		params.put("total_page", total_page);
		params.put("page_block_size", page_block_size);
		params.put("page_block_start", page_block_start);
		params.put("page_block_end", page_block_end);
		
		List<LectureDTO> lectureList = dao.lectureList(params);
		dao.close();
		
		String pagingArea = "";
		String pageUri = "/ChunjaeProject/mainPage/Main.do?";
		
		pagingArea = CommonPage.pagingArea(total_page, page_no, page_block_start, page_block_end, pageUri );
		
		params.put("paging", pagingArea);
		
		req.setAttribute("lectureList", lectureList);
		req.setAttribute("params", params);
		
		req.getRequestDispatcher("/mainPage/Main.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("1234");
	}

}

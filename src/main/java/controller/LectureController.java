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

		 
		int all_count =0;
		int total_count = 0;
		int page_no = 1;
		int page_size = 16;
		int total_page = 1;
		int page_skip_cnt = 16;
		int page_block_size = 10;
		int page_block_start = 1;
		int page_block_end = 1;
		
		String category2 = null;
		String technology_search_word = null;
		String lecture_search_word = null;
		Map<String, Object> params = new HashMap<String, Object>();
		
		category2 = req.getParameter("category2");
		technology_search_word = req.getParameter("technology_search_word");
		lecture_search_word = req.getParameter("lecture_search_word");
		
		
		page_no = (req.getParameter("page_no")!=null) ? Integer.parseInt(req.getParameter("page_no")) : 1;
		page_skip_cnt = (page_no-1)*page_size;
		
		params.put("pageNo", page_no);
		params.put("page_size", page_size);
		params.put("page_skip_cnt", page_skip_cnt);
		
		//DAO 생성
		LectureDAO dao = new LectureDAO();
		
		
		
		if(category2!=null)
			params.put("category2", category2);
		if(technology_search_word !=null && technology_search_word!="") {
			params.put("technology_search_word", technology_search_word);
		}
		if(lecture_search_word!="") {
			params.put("lecture_search_word", lecture_search_word);
		}
		
		
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
		
		if(category2!= null && category2!="") {
			pageUri = pageUri + "category2=" + category2 + "&";
		}
		if(technology_search_word!= null && technology_search_word!="") {
			pageUri = pageUri + "technology_search_word=" + technology_search_word + "&";
		}
		if(lecture_search_word!= null && lecture_search_word!="") {
			pageUri = pageUri + "lecture_search_word=" + lecture_search_word + "&";
		}
		
		
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

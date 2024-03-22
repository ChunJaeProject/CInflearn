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
import dao.ReviewDAO;
import dto.LectureReviewDTO;

@WebServlet("/qna/Review.do")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int total_count = 0;
		int page_no = 1;
		int page_size = 5;
		int total_page = 1;
		int page_skip_cnt = 5;
		int page_block_size = 10;
		int page_block_start = 1;
		int page_block_end = 1;
		
		Map<String, Object> maps = new HashMap<String, Object>();
		
		page_no = (req.getParameter("page_no")!=null) ? Integer.parseInt(req.getParameter("page_no")) : 1;
		page_skip_cnt = (page_no-1)*page_size;
		
		maps.put("pageNo", page_no);
		maps.put("page_size", page_size);
		maps.put("page_skip_cnt", page_skip_cnt);
		
		//DAO 생성
		ReviewDAO dao = new ReviewDAO();
		total_count = dao.LectureReviewTotalCount(maps);		
		List<LectureReviewDTO> LectureReviewList = dao.LectureReviewList(maps);
		
		dao.close();

		
		total_page = (int)Math.ceil(total_count/(double)page_size);
		page_block_size = 10;
		page_block_start = (int)Math.floor((page_no-1)/(double)page_size)*page_size +1;
		page_block_end = (int)Math.ceil(page_no/(double)page_size)*page_size;
		page_block_end = (page_block_end>total_page?total_page:page_block_end);
		
		maps.put("total_count", total_count);
		maps.put("total_page", total_page);
		maps.put("page_block_size", page_block_size);
		maps.put("page_block_start", page_block_start);
		maps.put("page_block_end", page_block_end);
		
		
	
		String pagingArea = "";
		String pageUri = "/ChunjaeProject/qna/Review.do?";
		
		pagingArea = CommonPage.pagingArea(total_page, page_no, page_block_start, page_block_end, pageUri );
		maps.put("paging", pagingArea);
		
		req.setAttribute("LectureReviewList", LectureReviewList);
		req.setAttribute("maps", maps);
		
		req.getRequestDispatcher("/qna/Review.jsp").forward(req, resp);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

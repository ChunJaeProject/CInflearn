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
	
		int total_count =0;
		//페이징
		int total_page = 1;
		int pageNo = Integer.parseInt(req.getParameter("pageNo")==null ? "1":req.getParameter("pageNo"));
		int pageBlock = Integer.parseInt(req.getParameter("pageBlock")==null ? "1":req.getParameter("pageBlock"));
		int page_size = 10;
		int page_skip_cnt = 10;
		int page_block_size = 10;
		int page_block_start = 1;
		int page_block_end = 1;
		int page_start = (pageBlock-1)*10+1;
		int page_end = pageBlock*10;
		
		Map<String, Object> maps = new HashMap<String, Object>();
		page_skip_cnt = (pageNo-1)*page_size;
		maps.put("pageNo", pageNo);
		maps.put("page_size", page_size);
		maps.put("page_skip_cnt", page_skip_cnt);
		
		//DAO 생성
		ReviewDAO dao = new ReviewDAO();
		total_count = dao.LectureReviewTotalCount(maps);		
		List<LectureReviewDTO> LectureReviewList = dao.LectureReviewList(maps);
		
		dao.close();

		if(total_count%10 == 0){
			total_page = total_count/10;
		}else{
			total_page = total_count/10 + 1;
		}
		
		page_block_start = (int)(Math.ceil(pageNo / (double)page_block_size) -1 ) * 10 + 1;
		page_block_end = (int)Math.ceil(pageNo / (double)page_block_size) * 10;
		page_block_end = page_block_end > total_page ? total_page : page_block_end;
		
		maps.put("total_count", total_count);
		maps.put("total_page", total_page);
		maps.put("page_block_start", page_block_start);
		maps.put("page_block_size", page_block_size);
		maps.put("page_block_end", page_block_end);
		maps.put("page_start", page_start);
		maps.put("page_end", page_end);
		
		
	
		String pagingArea = CommonPage.pagingArea(total_page, pageNo, page_block_start, page_block_end, "Review.do");
		maps.put("paging", pagingArea);
		
		req.setAttribute("LectureReviewList", LectureReviewList);
		req.setAttribute("maps", maps);
		
		req.getRequestDispatcher("/qna/Review.jsp").forward(req, resp);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.CommonPage;
import dao.QnADAO;
import dto.QnADTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/qna/Qna.do")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int total_count = 0;
		int solve_count = 0;
		int unsolve_count = 0;
		int page_no = 1;
		int page_size = 5;
		int total_page = 1;
		int page_skip_cnt = 5;
		int page_block_size = 10;
		int page_block_start = 1;
		int page_block_end = 1;

		String solve = req.getParameter("solve");
		String search_word = req.getParameter("search_title");
		String like = req.getParameter("like");
		
		Map<String, Object> maps = new HashMap<String, Object>();
		/*
		 * String search_title = req.getParameter("search_title"); String search_hash =
		 * req.getParameter("search_hash"); if(search_title != null &&
		 * !search_title.isEmpty() && search_hash != null && !search_hash.isEmpty() ) {
		 * maps.put("search_category", search_title); maps.put("search_word",
		 * search_hash); }
		 */
		
		page_no = (req.getParameter("page_no")!=null) ? Integer.parseInt(req.getParameter("page_no")) : 1;
		page_skip_cnt = (page_no-1)*page_size;
		
		maps.put("pageNo", page_no);
		maps.put("page_size", page_size);
		maps.put("page_skip_cnt", page_skip_cnt);
		
		//DAO 생성
		QnADAO dao = new QnADAO();
		
		
		if(solve !=null && solve!= "") {
			System.out.println(solve);
			maps.put("solve", solve);
		}
		if(search_word != null && search_word !="") {
			maps.put("search_word", search_word);
		}
		if(like != null) {
			maps.put("like", like);
		}
		total_count = dao.QnATotalCount(maps);
		int real_total_count = dao.QnATotalCount(maps);

		//미해결 해결 페이지 카운트
		if(solve !=null) {	
			if(solve.equals("Y")) {
				total_count = dao.QnASolveCount(maps);
			} else if(solve.equals("N")) {
				total_count = dao.QnAUnsolveCount(maps);
			}
			
		}
		
		//서치 후 페이징 카운트...ㅠㅠ
		
		
		
		//페이지 수
		total_page = (int)Math.ceil(total_count/(double)page_size);
		
		page_block_size = 10;
		page_block_start = (int)Math.floor((page_no-1)/(double)page_size)*page_size +1;
		page_block_end = (int)Math.ceil(page_no/(double)page_size)*page_size;
		page_block_end = (page_block_end>total_page?total_page:page_block_end);
		
		
		maps.put("real_total_count", real_total_count);
		maps.put("total_count", total_count);
		maps.put("total_page", total_page);
		maps.put("page_block_size", page_block_size);
		maps.put("page_block_start", page_block_start);
		maps.put("page_block_end", page_block_end);
		
		//해결/미해결 카운트
		solve_count = dao.QnASolveCount(maps);
		unsolve_count = dao.QnAUnsolveCount(maps);
		maps.put("solve_count", solve_count);
		maps.put("unsolve_count", unsolve_count);
		
		
		List<QnADTO> QnAList = dao.QnAList(maps);
		dao.close();
		
		String pagingArea = "";
		String pageUri = "/ChunjaeProject/qna/Qna.do?";
		
		if(solve !=null) {
			pageUri = pageUri + "solve=" +solve + "&";
		}
		if(search_word !=null) {
			pageUri = pageUri + "search_title=" + search_word + "&";	
		}
		if(like != null) {
			pageUri = pageUri + "like=1" + "&";
		}
		
		pagingArea = CommonPage.pagingArea(total_page, page_no, page_block_start, page_block_end, pageUri );
		
		maps.put("paging", pagingArea);
		
		req.setAttribute("QnAList", QnAList);
		req.setAttribute("maps", maps);
		
		req.getRequestDispatcher("/qna/Qna.jsp").forward(req, resp);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

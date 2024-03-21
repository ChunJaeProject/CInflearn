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
import dao.MentoringDAO;
import dto.MentoringDTO;

/**
 * Servlet implementation class MentoringController
 */
@WebServlet("/mentor/mentor.do")
public class MentoringController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("123");
		int total_count = 0;
		int page_no = 1;
		int page_size = 12;
		int total_page = 1;
		int page_skip_cnt = 12;
		int page_block_size = 10;
		int page_block_start = 1;
		int page_block_end = 1;
		
		String[] category = null;
		
		
		category = req.getParameterValues("cate");
		if(category!=null)
			System.out.println(category.toString());
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		String search_word = req.getParameter("search_word");
		page_no = (req.getParameter("page_no")!=null) ? Integer.parseInt(req.getParameter("page_no")) : 1;
		page_skip_cnt = (page_no-1)*page_size;
		
		if(search_word != null) {
			params.put("search_word", search_word);
		}
		params.put("page_skip_cnt", page_skip_cnt);
		params.put("page_size", page_size);
		params.put("page_no",page_no);
		MentoringDAO dao = new MentoringDAO();
		total_count = dao.MentoringTotalCount(params);
		
		List<MentoringDTO> mentoringList = dao.mentoringList(params);
		dao.close();
		
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
		
		String pagingArea = "";
		if(search_word != null) {
			pagingArea = CommonPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "/ChunjaeProject/mentor/mentor.do?search_word="+search_word +"&" );
		}
		else {
			pagingArea = CommonPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "/ChunjaeProject/mentor/mentor.do?" );
		}
		params.put("paging", pagingArea);
		
		req.setAttribute("params", params);
		req.setAttribute("mentoringList", mentoringList);
		req.getRequestDispatcher("/mentor/mentor.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("456");
	}

}

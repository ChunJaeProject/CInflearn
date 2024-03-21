package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		Map<String, Object> maps = new HashMap<String, Object>();
		/*
		 * String search_title = req.getParameter("search_title"); String search_hash =
		 * req.getParameter("search_hash"); if(search_title != null &&
		 * !search_title.isEmpty() && search_hash != null && !search_hash.isEmpty() ) {
		 * maps.put("search_category", search_title); maps.put("search_word",
		 * search_hash); }
		 */
		
		//DAO 생성
		QnADAO dao = new QnADAO();
		total_count = dao.QnATotalCount(maps);
		solve_count = dao.QnASolveCount(maps);
		unsolve_count = dao.QnAUnsolveCount(maps);
		
		List<QnADTO> QnAList = dao.QnAList(maps);
		
		dao.close();
		
		maps.put("total_count", total_count);
		maps.put("solve_count", solve_count);
		maps.put("unsolve_count", unsolve_count);
		
		req.setAttribute("QnAList", QnAList);
		req.setAttribute("maps", maps);
		
		req.getRequestDispatcher("/qna/Qna.jsp").forward(req, resp);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

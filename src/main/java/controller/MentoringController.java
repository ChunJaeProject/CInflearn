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
		MentoringDAO mtDAO = new MentoringDAO();
		Map<String, Object> params = new HashMap<String, Object>();
		System.out.println(mtDAO.MentoringTotalCount(params));
		
		List<MentoringDTO> list = mtDAO.mentoringList(params);
		
		
		System.out.println(list);
		req.setAttribute("mentoringList", list);
		req.getRequestDispatcher("/mentor/mentor.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("456");
	}

}

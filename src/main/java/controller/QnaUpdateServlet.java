package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dao.QnADAO;
import dto.QnADTO;

@WebServlet("/qna/Modify.do")
public class QnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QnADAO dao = new QnADAO();
		//게시글 검색관련 param

		int idx =Integer.parseInt(req.getParameter("no"));
	
		Map<String, Object> params = new HashMap<String,Object>();
		QnADTO list = dao.qnaView(idx);
		dao.close(); // DB닫기
		
		String title ="";
		String content ="";
		
		// null과 imEmpty차이는?
		if(list != null ){
	
			title = list.getQuestion_title();
	
			content = list.getQuestion_content();
		
	}
		params.put("no", idx);
		params.put("title", title);
		params.put("content", content);
		

		
		req.setAttribute("params", params);
		
		req.getRequestDispatcher("/qna/Modify.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int no2 = Integer.parseInt(req.getParameter("idx"));
	
		

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
	

		QnADTO dto = new QnADTO();

		dto.setQuestion_title(title);
		dto.setQuestion_content(content);
		dto.setNo(no2);
	

		QnADAO dao =  new QnADAO();
		int result = dao.qnaUpdate(dto);
		dao.close();
		
		try {
		if(result>0){
			System.out.println("삽입성공");
			resp.sendRedirect("../qna/Qna.do");
			dao.close();
		}
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}

}

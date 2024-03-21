package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.QnADTO;
import jakarta.servlet.ServletContext;

public class QnADAO extends JDBConnect {

	public QnADAO() {}
	
	public QnADAO(ServletContext application) {
		super(application);
	}
	
	public int QnATotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_qna");
		
		if(map.get("btn_search") != null){
			sb.append(" LIKE '%"+map.get("btn_search") + "%'");
		}
		
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total_count = rs.getInt(1);			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.print("게시물 갯수 조회 에러");
		}
	
		return total_count;
	}
	
	public List<QnADTO> qnaList(Map<String, Object> map){
		List<QnADTO> list = new Vector<QnADTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT no, question_title, question_content, question_hashtag");
		sb.append(", answer, solution_state, like, reg_date, member_no");
		sb.append("	FROM tbl_qna");
		
		if(map.get("btn_search") != null){
			sb.append(" LIKE '%"+map.get("btn_search") + "%'");
		}
		sb.append(" ORDER BY no DESC");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				QnADTO dto = new QnADTO();
				dto.setNo(rs.getInt("no"));
				dto.setQuestion_title(rs.getString("question_title"));
				dto.setQuestion_content(rs.getString("question_content"));
				dto.setQuestion_hashtag(rs.getString("question_hashtag"));
				dto.setAnswer(rs.getString("answer"));
				dto.setSolution_state(rs.getString("solution_state"));
				dto.setLike(rs.getInt("like"));
				dto.setReg_date(rs.getDate("reg_date"));
				
				list.add(dto);
			}
		}
		catch(Exception e) {
			System.out.print("게시물 리스트 조회 에러");
			e.printStackTrace();
		}
		return list;	
	}
	
	 public QnADTO qnaDetail(int no) {
		 QnADTO dto = new QnADTO();
		 
		 StringBuilder sb = new StringBuilder();
		sb.append("SELECT no, question_title, question_content, question_hashtag");
		sb.append(", answer, solution_state, like, reg_date, member_no");
		sb.append("	FROM tbl_qna");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setQuestion_title(rs.getString("question_title"));
				dto.setQuestion_content(rs.getString("question_content"));
				dto.setQuestion_hashtag(rs.getString("question_hashtag"));
				dto.setAnswer(rs.getString("answer"));
				dto.setSolution_state(rs.getString("solution_state"));
				dto.setLike(rs.getInt("like"));


				dto.setReg_date(rs.getDate(null));

			}
		}
		catch(Exception e) {
			System.out.print("게시물 데이터 조회 에러");
			e.printStackTrace();
		}
		return dto;
	 }

	 
	 public void QnARegist(QnADTO dto) {
		 StringBuilder sb  = new StringBuilder();
		 sb.append("INSERT INTO tbl_qna(question_title, question_hashtag, question_content,reg_date) VALUES(?,?,?, NOW())");
		 
		 try {
			 psmt = conn.prepareStatement(sb.toString());
			 psmt.setString(1, dto.getQuestion_title());
			 psmt.setString(2, dto.getQuestion_hashtag());
			 psmt.setString(3, dto.getQuestion_content());
			 
			 psmt.executeUpdate();
		 } 
		 catch(Exception e) {
			 System.out.print("게시물 등록 에러");
			 e.printStackTrace();
		 }
	 }
	 public int QnADelete(int no) {
		 int result = 0;
		 StringBuilder sb = new StringBuilder();
		 sb.append("DELETE FROM tbl_qna WHREE no=");
		 
		 try {
			 psmt = conn.prepareStatement(sb.toString());
			 psmt.setInt(1, no);
			 
			 result = psmt.executeUpdate();
		 }
		 catch(Exception e) {
			 System.out.print("게시물 삭제 에러");
			 e.printStackTrace();
		 }
		 return result;
	 }
	 
	 public int QnAModify(QnADTO dto) {
		 int result = 0;
		 StringBuilder sb = new StringBuilder();
		 sb.append("UPDATE tbl_qna SET question_title=?, question_hashtag=?, question_content=?, reg_date= now()");
		 sb.append(" WHERE no=?");
		 
		 try {
			 psmt = conn.prepareStatement(sb.toString());
			 psmt.setString(1, dto.getQuestion_title());
			 psmt.setString(2, dto.getQuestion_hashtag());
			 psmt.setString(3, dto.getQuestion_content());
		 }
		 catch(Exception e) {
			 System.out.print("게시물 수정 에러");
			 e.printStackTrace();
		 }
		 return result;
	 }

}

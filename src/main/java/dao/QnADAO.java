package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.CommentDTO;
import dto.QnADTO;
import jakarta.servlet.ServletContext;


public class QnADAO extends JDBConnect {

	public QnADAO() {}
	
	public QnADAO(ServletContext application) {
		super(application);
	}
	
	//전체 게시물
	public int QnATotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_qna");
		sb.append(" WHERE 1 = 1");
		if(map.get("search_word")!=null) {
			sb.append(" AND question_title LIKE '%" + map.get("search_word") + "%'");
		}
		System.out.println(sb.toString());
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
	
	//미해결 게시물
	public int QnAUnsolveCount(Map<String, Object> map) {
		int unsolve_count=0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_qna"
				+ " WHERE 1 = 1 "
				+ " AND solution_state = 'N'");
		if(map.get("search_word")!=null) {
			sb.append(" AND question_title LIKE '%" + map.get("search_word") + "%'");
		}
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			unsolve_count = rs.getInt(1);			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.print("게시물 갯수 조회 에러");
		}
		
		return unsolve_count;
	}
	
	//해결 게시물
		public int QnASolveCount(Map<String, Object> map) {
			int solve_count=0;
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT COUNT(*) FROM tbl_qna"
					+ " WHERE 1 = 1 "
					+ " AND solution_state = 'Y'");
			if(map.get("search_word")!=null) {
				sb.append(" AND question_title LIKE '%" + map.get("search_word") + "%'");
			}
			try {
				String sql = sb.toString();
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				rs.next();
				solve_count = rs.getInt(1);			
			}
			catch(Exception e) {
				e.printStackTrace();
				System.out.print("게시물 갯수 조회 에러");
			}
			
			return solve_count;
		}
	
	
	//게시판 리스트
	public List<QnADTO> QnAList(Map<String, Object> map){
		List<QnADTO> list = new Vector<QnADTO>();
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT Q.no, Q.question_title, Q.question_content, Q.question_hashtag");
		sb.append(", Q.answer, Q.solution_state, Q.like, Q.reg_date, Q.member_no");
		sb.append(", SUBSTRING_INDEX(M.email, '@', 1) AS nickname, COUNT(tc.`no`) AS comment_count");
		sb.append("	FROM tbl_qna AS Q");
		sb.append(" INNER JOIN tbl_member AS M ON Q.member_no = M.member_no"
				+ " left JOIN tbl_comment AS tc ON Q.`no` = tc.qna_no");
		sb.append(" WHERE 1 = 1");
		
		if(map.get("solve")!=null) {
			sb.append(" AND solution_state = " + "'" + map.get("solve") +"'");
		}
		if(map.get("search_word")!=null) {
			sb.append(" AND question_title LIKE '%" + map.get("search_word") + "%'");
		}
		sb.append(" GROUP BY Q.`no`");
		if(map.get("like") != null) {
		    sb.append(" ORDER BY Q.like DESC");
		} else {
		    sb.append(" ORDER BY Q.reg_date DESC");
		}
		
		sb.append(" limit " + map.get("page_skip_cnt") + ", " + map.get("page_size"));
		
		System.out.println(sb.toString());

		
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
				dto.setMember_no(rs.getInt("member_no"));
				dto.setNickname(rs.getString("nickname"));
				dto.setComment_count(rs.getInt("comment_count"));
				
				list.add(dto);
			}
		}
		catch(Exception e) {
			System.out.print("게시물 리스트 조회 에러");
			e.printStackTrace();
		}
		return list;	
	}
	
	//게시판 게시글,댓글조회
	public QnADTO QnADetail(int no) {
		QnADTO dto = new QnADTO();
		 
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT Q.no, Q.question_title, Q.question_content, Q.question_hashtag");
		sb.append(", Q.answer, Q.solution_state, Q.like, Q.reg_date, Q.member_no");
		sb.append(", SUBSTRING_INDEX(M.email, '@', 1) AS nickname");
		sb.append("	FROM tbl_qna AS Q");
		sb.append(" INNER JOIN tbl_member AS M ON Q.member_no = M.member_no");
		sb.append(" WHERE no = ?");
		System.out.println(sb.toString());
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, no);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setQuestion_title(rs.getString("question_title"));
				dto.setQuestion_content(rs.getString("question_content"));
				dto.setQuestion_hashtag(rs.getString("question_hashtag"));
				dto.setAnswer(rs.getString("answer"));
				dto.setSolution_state(rs.getString("solution_state"));
				dto.setLike(rs.getInt("like"));
				dto.setMember_no(rs.getInt("member_no"));
				dto.setNickname(rs.getString("nickname"));
				dto.setReg_date(rs.getDate("reg_date"));

			}
		}
		catch(Exception e) {
			System.out.print("게시물 데이터 조회 에러");
			e.printStackTrace();
		}
		return dto;
	 }
	 //작성한 게시글 수
	public int QuestionTotalCount(int no) {
		int q_total_count = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_qna");
		sb.append(" WHERE member_no = ?");
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			rs.next();
			q_total_count = rs.getInt(1);			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.print("작성한 게시글 수 조회 에러");
		}
	
		return q_total_count;
	}
	
	

	 //게시글 등록
	 public int QnARegist(QnADTO dto) {
		 int result=0;
		 StringBuilder sb  = new StringBuilder();
		 sb.append("INSERT INTO tbl_qna(question_title, question_content, reg_date, member_no) VALUES(?,?, NOW(),?)");
		 
		 try {
			 psmt = conn.prepareStatement(sb.toString());
			 psmt.setString(1, dto.getQuestion_title());
			 psmt.setString(2, dto.getQuestion_content());
			 psmt.setInt(3, dto.getMember_no());
			 
			 result = psmt.executeUpdate();
		
		 } 
		 catch(Exception e) {
			 System.out.print("게시물 등록 에러");
			 e.printStackTrace();
		 }
		 return result;
	 }
	 
	 //게시글 삭제
	 public int QnADelete(int no) {
		 int result = 0;
		 StringBuilder sb = new StringBuilder();
		 sb.append("DELETE FROM tbl_qna WHERE no=?");
		 
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
	 
	 //게시글 수정
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

	public QnADTO qnaView(int idx) {
		QnADTO dto = new QnADTO();
		//1. 쿼리문 만들기
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT *");
		sb.append(" FROM tbl_qna");
		sb.append(" WHERE no = ?");
		//2. 커넥션 만들기
		try {
			psmt =conn.prepareStatement(sb.toString()); //DB 커넥션에 맺기-
			psmt.setInt(1, idx); // ? 에 값 동적처리
			
			rs = psmt.executeQuery();
			// 칼럼이 존재한다면
			if(rs.next()) {
				dto.setQuestion_title(rs.getString("question_title"));
				dto.setQuestion_content(rs.getString("question_content"));
				dto.setMember_no(rs.getInt("member_no"));

			}
		}catch(Exception e) {
			System.out.println(" 게시판 데이터 조회 오류");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int qnaUpdate(QnADTO dto) {
		int result =0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_qna SET question_title = ?, question_content =?,reg_date = now()");
		sb.append(" WHERE no = ? ");
		
		
		try {
		psmt =conn.prepareStatement(sb.toString());
		
		psmt.setString(1,  dto.getQuestion_title());
		psmt.setString(2,  dto.getQuestion_content());
		psmt.setInt(3,  dto.getNo());
		result = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("result : "+ result);
		return result;
		}
	//좋아요 수정
	public int likeUpdate(QnADTO dto ,int state) {
		int result =0;
		int updateValue = state;
		
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_qna SET `like` = `like` + ?");
		sb.append(" WHERE `no` = ? ");
		
		
		try {
		psmt =conn.prepareStatement(sb.toString());
		psmt.setInt(1, updateValue);
		psmt.setInt(2,  dto.getNo());
		result = psmt.executeUpdate();
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("result : "+ result);
		return result;
		}
	

}

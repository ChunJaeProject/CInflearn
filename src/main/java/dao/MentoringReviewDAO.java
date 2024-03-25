package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.MentoringReviewDTO;
import jakarta.servlet.ServletContext;

public class MentoringReviewDAO extends JDBConnect {

	public MentoringReviewDAO() {}
	public MentoringReviewDAO(ServletContext application) {
		super(application);
	}
	
	//전체 게시물 수
	public int MentoringReviewTotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_mentoring_review");

		
		try {
			String sql = sb.toString();
			System.out.println(sb.toString());
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
	
	//게시판 리스트
	public List<MentoringReviewDTO> MentoringReviewList(Map<String, Object> map){
		List<MentoringReviewDTO> list = new Vector<MentoringReviewDTO>();
		
		StringBuilder sb = new StringBuilder();

		sb.append("SELECT writer, reg_date, content, grade");
		sb.append(" from tbl_mentoring_review");
		sb.append(" ORDER BY reg_date DESC");
		sb.append(" LIMIT "+map.get("page_skip_cnt")+ ", "+map.get("page_size"));
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MentoringReviewDTO dto = new MentoringReviewDTO();
				//dto.setMentoring_review_no(rs.getInt("mentoring_review_no"));
				dto.setWriter(rs.getString("writer"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setContent(rs.getString("content"));
				dto.setGrade(rs.getInt("grade"));
				//dto.setMentoring_no(rs.getInt("mentoring_no"));
	
				list.add(dto);
			}
		}
		catch(Exception e) {
			System.out.print("게시물 리스트 조회 에러");
			e.printStackTrace();
		}
		return list;	
	}
}

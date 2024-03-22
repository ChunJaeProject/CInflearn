package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.LectureReviewDTO;
import jakarta.servlet.ServletContext;

public class ReviewDAO extends JDBConnect {

	public ReviewDAO() {}
	public ReviewDAO(ServletContext application) {
		super(application);
	}
	
	//전체 게시물 수
	public int LectureReviewTotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_review");

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
	
	//게시판 리스트
	public List<LectureReviewDTO> LectureReviewList(Map<String, Object> map){
		List<LectureReviewDTO> list = new Vector<LectureReviewDTO>();
		
		StringBuilder sb = new StringBuilder();

		sb.append("SELECT * ");
		sb.append("	FROM tbl_review");
		sb.append(" ORDER BY lecture_no DESC ");
		sb.append(" limit " + map.get("page_skip_cnt") + ", " + map.get("page_size"));

		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				LectureReviewDTO dto = new LectureReviewDTO();
				dto.setNo(rs.getInt("lecture_no"));
				dto.setWriter(rs.getString("writer"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setContent(rs.getString("content"));
				dto.setStar(rs.getInt("star"));
				dto.setImage(rs.getString("image"));
				dto.setLecture_title(rs.getString("lecture_title"));
				//dto.setLecture_no(rs.getInt("lecture_no"));
				//dto.setMember_no(rs.getInt("member_no"));
			
				
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

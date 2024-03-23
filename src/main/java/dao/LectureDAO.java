package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.LectureDTO;
import jakarta.servlet.ServletContext;

public class LectureDAO extends JDBConnect {
	public LectureDAO() {}
	
	public LectureDAO(ServletContext application) {
		super(application);
	}
	
	
	public int lectureTotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_lecture");
		
		if ( map.get("technology_search_word") != null ) {
			sb.append(" WHERE " + map.get("technology_tag"));
			sb.append(" LIKE '%" + map.get("technology_search_word") + "%'");
		}
		if ( map.get("lecture_search_word") != null ) {
			sb.append(" WHERE " + map.get("title"));
			sb.append(" LIKE '%" + map.get("lecture_search_word") + "%'");
			sb.append(" AND " + map.get("professor"));
			sb.append(" LIKE '%" + map.get("lecture_search_word") + "%'");
		}
		
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total_count = rs.getInt(1);
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 갯수 조회 에러");
		}
	
		return total_count;
	}
	
	
	public List<LectureDTO> lectureList(Map<String, Object> map) {
		List<LectureDTO> lecture_list = new Vector<LectureDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT tl.lecture_no, lecture_title, image, professor, category2, difficulty_grade, technology_tag, ifNULL(avg(tr.star), 0) AS star");
		sb.append(" FROM tbl_lecture AS tl LEFT OUTER JOIN tbl_review AS tr");
		sb.append(" on tl.lecture_no = tr.lecture_no");
		if ( map.get("technology_search_word") != "" && map.get("technology_search_word") != null ) {
			sb.append(" WHERE technology_tag ");
			sb.append(" LIKE '%" + map.get("technology_search_word") + "%'");
		}
		if ( map.get("lecture_search_word") != "" && map.get("lecture_search_word") != null ) {
			sb.append(" WHERE lecture_title ");
			sb.append(" LIKE '%" + map.get("lecture_search_word") + "%'");
			sb.append(" OR professor ");
			sb.append(" LIKE '%" + map.get("lecture_search_word") + "%'");
		}
		
		if ( map.get("category2") != "" && map.get("category2") != null) {
			sb.append(" WHERE category2 =" + "'" + map.get("category2") + "'"); 
		}
		sb.append(" GROUP BY lecture_no");
		sb.append(" ORDER BY lecture_no DESC");
		sb.append(" LIMIT "+map.get("page_skip_cnt")+ ", "+map.get("page_size"));
		System.out.println(sb.toString());
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				LectureDTO dto = new LectureDTO();
				dto.setLecture_no(rs.getInt("lecture_no"));
				dto.setLecture_title(rs.getString("lecture_title"));
				dto.setImage(rs.getString("image"));
				dto.setProfessor(rs.getString("professor"));
				dto.setDifficulty_grade(rs.getString("difficulty_grade"));
				dto.setTechnology_tag(rs.getString("technology_tag"));
				dto.setCategory2(rs.getString("category2"));
				dto.setStar(rs.getInt("star"));
				lecture_list.add(dto);
			}
		}
		catch (Exception e) {
			
			System.out.println("강의 리스트 조회 에러 :" + e.getMessage());
		}
		return lecture_list;
	}
	public List<LectureDTO> getLectureInfo(int no) {
		
		List<LectureDTO> lecture_list = new Vector<LectureDTO>();
		
		StringBuilder sb = new StringBuilder();
//		sb.append("SELECT lecture_no, lecture_title, image, professor, category2, difficulty_grade, technology_tag,"
//				+ " tc.curriculum_no, tc.curriculum_name, curriculum_time");
//		sb.append(" FROM tbl_lecture as tl INNER JOIN tbl_curriculum as tc");
//		sb.append(" ON tl.lecture_no = tc.lecture_no");
//		sb.append(" WHERE tl.lecture_no = " + no);
		
		sb.append("SELECT lecture_no, lecture_title, image, professor, category2, difficulty_grade, technology_tag");
		sb.append(" FROM tbl_lecture");
		sb.append(" WHERE lecture_no = " + no);
		System.out.println(sb.toString());
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				LectureDTO dto = new LectureDTO();
				dto.setLecture_no(rs.getInt("lecture_no"));
				dto.setLecture_title(rs.getString("lecture_title"));
				dto.setImage(rs.getString("image"));
				dto.setProfessor(rs.getString("professor"));
				dto.setDifficulty_grade(rs.getString("difficulty_grade"));
				dto.setTechnology_tag(rs.getString("technology_tag"));
				dto.setCategory2(rs.getString("category2"));
//				dto.setCurriculum_no(rs.getInt("curriculum_no"));
//				dto.setCurriculum_name(rs.getString("curriculum_name"));
//				dto.setCurriculum_time(rs.getString("curriculum_time"));
				
				lecture_list.add(dto);
			}
		}catch(Exception e) {
			System.out.println("555");
			System.out.println("강의 리스트 조회 에러 :" + e.getMessage());
		}
		
		
		return lecture_list;
		
	}
}

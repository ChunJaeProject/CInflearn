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
		sb.append("SELECT lecture_no, lecture_title, image, professor, category2, difficulty_grade, technology_tag");
		sb.append(" FROM tbl_lecture");
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
		
		sb.append(" ORDER BY lecture_no DESC");
		
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
				lecture_list.add(dto);
			}
		}
		catch (Exception e) {
			
			System.out.println("강의 리스트 조회 에러 :" + e.getMessage());
		}
		return lecture_list;
	}
}

package dao;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.LectureDTO;
import jakarta.servlet.ServletContext;

public class LectureDetailDAO extends JDBConnect {
	public LectureDetailDAO() {}
	
	public LectureDetailDAO(ServletContext application) {
		super(application);
	}
	
	public List<LectureDTO> getLectureInfo(int no) {
			
		List<LectureDTO> lecture_list = new Vector<LectureDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT tl.lecture_no, lecture_title, lecture_detail, image,"
				+ " professor, difficulty_grade, technology_tag,"
				+ " category1, category2, certificate_yn, lecture_period,"
				+ " tc.curriculum_no, tc.curriculum_name, curriculum_time");
		sb.append(" FROM tbl_lecture as tl INNER JOIN tbl_curriculum as tc");
		sb.append(" ON tl.lecture_no = tc.lecture_no");
		sb.append(" WHERE tl.lecture_no = ?");
		System.out.println(sb.toString());
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				LectureDTO dto = new LectureDTO();
				dto.setLecture_no(rs.getInt("lecture_no"));
				dto.setLecture_title(rs.getString("lecture_title"));
				dto.setLecture_detail(rs.getString("lecture_detail"));
				dto.setImage(rs.getString("image"));
				dto.setProfessor(rs.getString("professor"));
				dto.setCertificate_yn(rs.getString("certificate_yn"));
				dto.setDifficulty_grade(rs.getString("difficulty_grade"));
				dto.setTechnology_tag(rs.getString("technology_tag"));
				dto.setCategory1(rs.getString("category1"));
				dto.setCategory2(rs.getString("category2"));
				dto.setCurriculum_no(rs.getInt("curriculum_no"));
				dto.setCurriculum_name(rs.getString("curriculum_name"));
				dto.setCurriculum_time(rs.getString("curriculum_time"));
				dto.setLecture_period(rs.getString("lecture_period"));
				
				lecture_list.add(dto);
			}
		}catch(Exception e) {
			
			System.out.println("강의 리스트 조회 에러 :" + e.getMessage());
		}
		
		
		return lecture_list;
		
	}
	public List<LectureDTO> getLectureReview(int no){
		List<LectureDTO> lecture_list = new Vector<LectureDTO>();
		StringBuilder sb = new StringBuilder();
		
		int[] starCount = new int[6];
		
		sb.append("SELECT tl.lecture_no, tr.star, tr.content, tr.writer, tr.reg_date");
		sb.append(" FROM tbl_lecture as tl INNER JOIN tbl_review as tr");
		sb.append(" ON tl.lecture_no = tr.lecture_no");
		sb.append(" WHERE tl.lecture_no = ?");
		
		System.out.println(sb.toString());
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				starCount[rs.getInt("star")]++;
			}
			rs.beforeFirst();
			while(rs.next()) {
				LectureDTO dto = new LectureDTO();
				dto.setLecture_no(rs.getInt("lecture_no"));
				dto.setStar(rs.getInt("star"));
				dto.setStarCount((Arrays.toString(starCount)).substring(4, 17));
				dto.setComment(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setReview_reg_date(rs.getDate("reg_date"));
				lecture_list.add(dto);
			}
		}catch(Exception e) {
			System.out.println("수강평 불러오기 중 에러 발생");
			e.printStackTrace();
		}
		
		return lecture_list;
	}

}


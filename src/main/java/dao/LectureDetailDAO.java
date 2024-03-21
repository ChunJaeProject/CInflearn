package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.LectureDTO;
import jakarta.servlet.ServletContext;
import model2.bbs.BbsDTO;

public class LectureDetailDAO extends JDBConnect {
	public LectureDetailDAO() {}
	
	public LectureDetailDAO(ServletContext application) {
		super(application);
	}
	
	public LectureDTO lectureDetailView(int idx) {
		LectureDTO dto = new LectureDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT lecture_no, lecture_title, image, professor, category1, category2");
		sb.append(", technology_tag, lecture_detail, lecture_period");
		sb.append(", certificate_yn, difficulty_grade, regist_date");
		sb.append(" FROM tbl_lecture");
		sb.append(" WHERE idx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setLecture_no(rs.getInt("lecture_no"));
				dto.setLecture_title(rs.getString("lecture_title"));
				dto.setImage(rs.getString("image"));
				dto.setProfessor(rs.getString("professor"));
				dto.setCategory1(rs.getString("category1"));
				dto.setCategory2(rs.getString("category2"));
				dto.setTechnology_tag(rs.getString("technology_tag"));
				dto.setLecture_detail(rs.getString("lecture_detail"));
				dto.setLecture_period(rs.getString("lecture_period"));
				dto.setCertificate_yn(rs.getBoolean("certificate_yn"));
				dto.setDifficulty_grade(rs.getString("difficulty_grade"));
//				dto.setRegist_date(rs.getDate("regist_date"));
			}
		}
		catch (Exception e) {
			System.out.println("게시판 데이터 조회 오류");
			e.printStackTrace();
		}
		
		return dto;
		}

		
		
	}
		

		
	}
}

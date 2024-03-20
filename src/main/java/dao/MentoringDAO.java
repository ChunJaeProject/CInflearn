package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.MentoringDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;

public class MentoringDAO extends JDBConnect {
	public MentoringDAO(){}
	public MentoringDAO(ServletContext application) {
		super(application);
	}
	
	public int MentoringTotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT COUNT(*) FROM tbl_mentoring");
		
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total_count = rs.getInt(1);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 갯수 조회 에러");
		}
		
		return total_count;
	}
	public List<MentoringDTO> mentoringList(Map<String, Object> map){
		List<MentoringDTO> list = new Vector<MentoringDTO>();
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT mentoring_no, member_email, member_name, ");
		sb.append("member_tel, career, now_job, start_date, end_date, ");
		sb.append("mentoring_name, metoring_intro, job_code, member_no ");
		sb.append("from tbl_mentoring ");
		
		System.out.println(sb.toString());
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				MentoringDTO dto = new MentoringDTO();
				
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}















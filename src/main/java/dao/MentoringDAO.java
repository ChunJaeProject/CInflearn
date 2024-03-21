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
		sb.append("mentoring_name, metoring_intro, tj.job_title, member_no ");
		sb.append("from tbl_mentoring as tm inner join tbl_job as tj ");
		sb.append("on tm.job_code = tj.job_code ");
		
		
		if(map.get("search_category") != null && map.get("search_word") != null ) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
		}
		sb.append(" ORDER BY mentoring_no DESC");
		sb.append(" LIMIT "+map.get("page_skip_cnt")+ ", "+map.get("page_size"));
		System.out.println(sb.toString());
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				MentoringDTO dto = new MentoringDTO();
				
				dto.setMentoring_no(rs.getInt("mentoring_no"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_tel(rs.getInt("member_tel"));
				dto.setCareer(rs.getString("career"));
				dto.setJob(rs.getString("now_job"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setMentoring_name(rs.getString("mentoring_name"));
				dto.setMentoring_intro(rs.getString("metoring_intro"));
				dto.setJob_title(rs.getString("tj.job_title"));
				dto.setMember_no(rs.getInt("member_no"));
				list.add(dto);
			}
		
		}catch(Exception e) {
			System.out.println("게시물 리스트 조회 에러");
			e.printStackTrace();
		}
		return list;
	}
	public int mentoringRegist(MentoringDTO dto) {
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_mentoring (`member_email`, `member_name`, `member_tel`,"
				+ " `career`, `now_job`, `start_date`, `end_date`, `mentoring_name`,"
				+ " `metoring_intro`, `job_code`, `member_no`)"
				+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getMember_email());
			psmt.setString(2, dto.getMember_name());
			psmt.setInt(3, dto.getMember_tel());
			psmt.setString(4, dto.getCareer());
			psmt.setString(5, dto.getJob());
			psmt.setString(6, dto.getStart_date());
			psmt.setString(7, dto.getEnd_date());
			psmt.setString(8, dto.getMentoring_name());
			psmt.setString(9, dto.getMentoring_intro());
			psmt.setString(10, dto.getJob_code());
			//psmt.setInt(11, dto.getMember_no());
			
			System.out.println(sb.toString());
			int result = psmt.executeUpdate();
			
			return result;
		}catch(Exception e) {
			System.out.println("멘토링 등록에서 에러 발생" + e.getMessage());
			e.printStackTrace();
			return 0;
		}
		
		
		
		
	}
}















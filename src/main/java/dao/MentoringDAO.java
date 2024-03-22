package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.MentoringDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import model2.bbs.BbsDTO;

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
		sb.append("WHERE 1 = 1 ");
		
		if(map.get("search_word") != null && map.get("search_word")!="") {
			sb.append(" AND " + "mentoring_name");
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
			sb.append(" or member_name LIKE '%" + map.get("search_word") + "%'");
		}
		if(map.get("append_category") != null) {
			sb.append(" AND " + "tm.job_code");
			sb.append(" IN( " + map.get("append_category") + ")");
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
		
		public MentoringDTO mentoringView(int idx) {
			MentoringDTO dto = new MentoringDTO();
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT idx, ref_idx, level_idx, sort_order");
			sb.append(", user_id, title, content, read_cnt");
			sb.append(", display_date, reg_date, modify_date");
			/* sb.append(", file_path, file_name, file_ext, file_size"); */
			sb.append(" FROM tbl_bbs");
			sb.append(" WHERE idx = ?");
			
			try {
				psmt = conn.prepareStatement(sb.toString());
				psmt.setInt(1, idx); // WHERE idx = ?에 매개변수로 받은 idx를 넣으라는 것
				rs = psmt.executeQuery();
				if (rs.next()) {
					dto.setIdx(rs.getInt("idx"));
					dto.setRef_idx(rs.getInt("ref_idx"));
					dto.setLevel_idx(rs.getInt("level_idx"));
					dto.setSort_order(rs.getInt("sort_order"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setRead_cnt(rs.getInt("read_cnt"));
					dto.setDisplay_date(rs.getString("display_date"));
					dto.setReg_date(rs.getDate("reg_date"));
					dto.setModify_date(rs.getDate("modify_date"));
				}
			}
			catch (Exception e) {
				System.out.println("게시판 데이터 조회 오류");
				e.printStackTrace();
			}
			
			return dto;
		
		
		
		
	}
}















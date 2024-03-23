package dao;

import java.util.List;
import java.util.Vector;

import common.JDBConnect;
import dto.MentoringSignUpDTO;
import jakarta.servlet.ServletContext;

public class MentoringSignUpDAO extends JDBConnect {
	public MentoringSignUpDAO() {}
	
	public MentoringSignUpDAO(ServletContext application) {
		super(application);
	}
	
	public List<MentoringSignUpDTO> getMentoringSignUpInfo(int no) {
			List<MentoringSignUpDTO> mentoring_list = new Vector<MentoringSignUpDTO>();
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT tmr.reg_date, tmr.member_name, tmr.member_email, tmr.member_tel, tmr.message");
			sb.append(" FROM tbl_mentoring_regist AS tmr");
			sb.append(" INNER JOIN tbl_member AS tmm ON tmr.member_no = tmm.member_no");
			sb.append(" INNER JOIN tbl_mentoring AS tmt ON tmr.mentoring_no = tmt.mentoring_no");
			sb.append(" WHERE no = ?");
			System.out.println(sb.toString());		

		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				MentoringSignUpDTO dto = new MentoringSignUpDTO();
				dto.setRegdate(rs.getDate("reg_date"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_tel(rs.getInt("member_tel"));
				dto.setMessage(rs.getString("message"));
				mentoring_list.add(dto);
			}
		}catch(Exception e) {
			
			System.out.println("멘토링 신청 리스트 조회 에러 :" + e.getMessage());
		}
		
		return mentoring_list;
	}
}


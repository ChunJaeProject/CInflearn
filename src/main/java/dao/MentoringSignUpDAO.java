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
	
	public int  getMentoringSignUpInfo(MentoringSignUpDTO dto) {
		int result =0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_mentoring_regist (mentoring_name, member_name, member_email, member_tel, message, member_no, mentoring_no,regdate)");
		sb.append(" VALUES (?, ?, ?, ?,?,?,?,?)");
		try {
		psmt =conn.prepareStatement(sb.toString());
		psmt.setString(1, dto.getMentoring_name());
		psmt.setString(2,  dto.getMember_name());
		psmt.setString(3, dto.getMember_email());
		psmt.setInt(4,dto.getMember_tel()  );
		psmt.setString(5, dto.getMessage());
		psmt.setInt(6, dto.getMember_no() );
		psmt.setInt(7,dto.getMentoring_no()  );
		psmt.setString(8,dto.getRegdate()  );
		result = psmt.executeUpdate();
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
}


package dao;


import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import dto.LoginDTO;
import jakarta.servlet.ServletContext;



public class LoginDAO extends JDBConnect {

	public LoginDAO() {
		
	}
	public LoginDAO(ServletContext application) {
		super(application);
	
}
	public int LoginRegist(LoginDTO dto) {
		int result =0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO inflearn (email,password)");
		sb.append(" VALUES (?, ?, now())");
		try {
		psmt =conn.prepareStatement(sb.toString());
		
		psmt.setString(1,  dto.getEmail());
		psmt.setString(2,  dto.getPassword());
		result = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
		}
	//회원 일시
	public List<LoginDTO> LoginList(Map<String,Object> map){
		List<LoginDTO> list = new Vector<LoginDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT member_no, email, password");

		/* sb.append(", file_path, file_name, file_ext, file_size"); */
		sb.append(" FROM tbl_member");
		//검색 결과가 일치할 경우 조건에 맞는 게시글만 출력 (where절 실행)
	
			sb.append(" WHERE = " + map.get("email"));
			sb.append(" WHERE = " +map.get("password") );
	
		try {
			String sql = sb.toString();
			psmt =conn.prepareStatement(sql); //DB 커넥션에 맺기
			rs = psmt.executeQuery();
			while(rs.next()) {
				LoginDTO dto = new LoginDTO();
				dto.setNo(rs.getInt("member_no"));
				dto.setEmail(rs.getString("email"));
				dto.setPassword(rs.getString("password"));
			
				list.add(dto);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 조회 ");
		}
	

		return list;
	}
}

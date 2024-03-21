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
		sb.append("INSERT INTO tbl_member (email,password)");
		sb.append(" VALUES (?, ?)");
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
	//로그인 확인
	public LoginDTO getMemberInfo(String id, String pwd) {
		
		LoginDTO dto = new LoginDTO();
	
		String sql = "SELECT * FROM tbl_member WHERE `email` = ? "; //pwd는 넣으면 안됨 (하이재킹 당할 수 있음)
	System.out.println(sql);
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
		
			rs = psmt.executeQuery(); //select는 query
		
			if(rs.next()) {
				if(rs.getString("password").equals(pwd)) {  //DB pwd와 입력한 pwd가 다르면 dto에 set을 안하니 null이 return
					dto.setEmail(rs.getString("email"));
					dto.setPassword(rs.getString("password"));
				}

				}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	
	
}

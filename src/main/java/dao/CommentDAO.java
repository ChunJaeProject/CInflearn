package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;

import dto.CommentDTO;
import jakarta.servlet.ServletContext;

public class CommentDAO extends JDBConnect {

		public CommentDAO() {}
		
		public CommentDAO(ServletContext application) {
			super(application);
		}

		//댓글 등록
		public int CommentRegist(CommentDTO dto) {
			 int result=0;
			 StringBuilder sb  = new StringBuilder();
			 sb.append("INSERT INTO tbl_comment(reg_date, content, member_no, qna_no)");
			 sb.append("VALUES(now(), ?,?,?)");	
			 
			 
			 try {
				 psmt = conn.prepareStatement(sb.toString());
				 psmt.setString(1, dto.getContent());
				 psmt.setInt(2, dto.getMember_no());
				 psmt.setInt(3, dto.getQna_no());
				 
				 result = psmt.executeUpdate();
			
			 } 
			 catch(Exception e) {
				 System.out.print("댓글 등록 에러");
				 e.printStackTrace();
			 }
			 return result;
		}

		// 댓글 리스트 가져오기
		public List<CommentDTO> commentList(Map<String, Object> params ,int no) {
			List<CommentDTO> list = new Vector<CommentDTO>();
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT A.no, A.reg_date, A.content, A.member_no, A.qna_no, B.email");
			sb.append(" FROM tbl_comment AS A	");
			sb.append(" INNER JOIN tbl_member AS B ON A.member_no = B.member_no");
			sb.append(" INNER JOIN tbl_qna AS C ON A.qna_no = C.no");
			sb.append(" WHERE A.qna_no = ?");
			sb.append(" ORDER BY A.no DESC");
			
			System.out.println(sb.toString());

			try {
				String sql = sb.toString();
				psmt =conn.prepareStatement(sql); //DB 커넥션에 맺기
				psmt.setInt(1,no);
				rs = psmt.executeQuery();
				while(rs.next()) {
					CommentDTO dto = new CommentDTO();
					
					dto.setContent(rs.getString("content"));
					dto.setMember_no(rs.getInt("member_no"));
					dto.setReg_date(rs.getDate("reg_date"));
					dto.setEmail(rs.getString("email"));
	  
					list.add(dto);
				}
				
			}catch(Exception e) {
				System.out.println("게시물 조회 ");
			}
		
			return list;
		}
		//댓글 수 가져오기
		
		public int commentCount(Map<String,Object> map,int no) {
			int total_count  =0;
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT COUNT(*) FROM tbl_comment");
			sb.append(" WHERE qna_no =?");
	
			try {
				String sql = sb.toString();
				psmt =conn.prepareStatement(sql);
				psmt.setInt(1, no);
				rs = psmt.executeQuery(); // rs =전체 개수
				// select count(*) from board
				rs.next(); // 커서를 첫번째로 이동
				total_count = rs.getInt(1); // 513.. 제목513 , 512..제목512 에서 첫번째 칼럼의 인덱스(스택순으로 쌓임)
				
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시물 갯수 조회 에러");	
			}
			return total_count;
		}
		
		
}

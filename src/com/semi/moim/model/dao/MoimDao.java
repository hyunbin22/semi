package com.semi.moim.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.member.model.dao.MemberDao;
import com.semi.moim.model.vo.Moim;


public class MoimDao {
	
	private Properties prop = new Properties();

	public MoimDao() {
		String path=MoimDao.class.getResource("/sql/semi/moim-query.properties").getPath();
		try {
			prop.load(new FileReader(path));

		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	//모임게시판 리스트
	public int count(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = "select count(*) from tb_moim";
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}


	//모임게시판 리스트
	public List<Moim> moimList(Connection conn, int cPage, int numPerPage) {

		
		List<Moim> list = new ArrayList();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("moimList");
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Moim moim = new Moim();
				moim.setMoimNum(rs.getInt("moim_num"));
				moim.setmNum(rs.getInt("mNum"));
				moim.setMoimKeyword(rs.getString("moim_keyword"));
				moim.setMoimTitle(rs.getString("moim_title").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				moim.setMoimText(rs.getString("moim_text").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				moim.setMoimReadCount(rs.getInt("moim_readcount"));
				int moimTime = Integer.parseInt(rs.getString("moim_date").substring(11, 13));
				String timeType = "오전";
				if(moimTime > 12) {
					timeType="오후";
					moimTime -= 12;
				}
				moim.setMoimDate(rs.getString("moim_date").substring(0,11) + " " + timeType + " " + moimTime + ":" + rs.getString("moim_date").substring(14, 16));
				moim.setMember(new MemberDao().selectMemberMnum(conn, rs.getInt("mNum")));
				moim.setMoimUpload(new MoimUploadDao().selectUpload(conn, rs.getInt("moim_num")));
				list.add(moim);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} 
		return list;
		
	}

	//모임게시물 작성
	public int moimEnroll(Connection conn, Moim moim) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into tb_moim values(seq_moim.nextval,?,?,?,?,default,default)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, moim.getmNum());
			pstmt.setString(2, moim.getMoimKeyword());
			pstmt.setString(3, moim.getMoimTitle());
			pstmt.setString(4, moim.getMoimText());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectSeqMoim(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql = "select seq_moim.currval from dual";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}


	//모임상세보기
	public Moim moinView(Connection conn, int moimNum) {
		PreparedStatement pstmt = null;
		Moim moim = null;
		String sql = "select * from tb_moim where moim_num=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, moimNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				moim = new Moim();
				moim.setMoimNum(rs.getInt("moim_num"));
				moim.setmNum(rs.getInt("mnum"));
				moim.setMoimTitle(rs.getString("moim_title").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				moim.setMoimText(rs.getString("moim_text").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				moim.setMoimKeyword(rs.getString("moim_keyword"));
				int moimTime = Integer.parseInt(rs.getString("moim_date").substring(11, 13));
				String timeType = "오전";
				if(moimTime > 12) {
					timeType="오후";
					moimTime -= 12;
				}
				moim.setMoimDate(rs.getString("moim_date").substring(0,11) + " " + timeType + " " + moimTime + ":" + rs.getString("moim_date").substring(14, 16));
				moim.setMoimReadCount(rs.getInt("moim_readcount"));
				moim.setMoimUpload(new MoimUploadDao().selectUpload(conn, rs.getInt("moim_num")));
				moim.setMember(new MemberDao().selectMemberMnum(conn, rs.getInt("mnum")));
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return moim;
		
	}

	//조회수 올리기
	public int addReadCount(Connection conn, int moimNum) {
		PreparedStatement pstmt = null;
		String sql = "update tb_moim set moim_readcount=moim_readcount+1 where moim_num=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, moimNum);
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	//모임게시판 검색
	public int moimFindCount(Connection conn, String type, String data) {
		Statement stmt = null;
		String sql = "select count(*) as cnt from tb_moim join tb_member using(mnum) where " + type + " like '%" + data + "%'";
		ResultSet rs = null;
		int result = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	//모임게시판 검색
	public List<Moim> moimFindList(Connection conn, String type, String data, int cPage, int numPerPage) {

		List<Moim> list = new ArrayList();
		Statement stmt = null;
		int start = (cPage-1)*numPerPage+1;
		int end = cPage*numPerPage;
		String sql = "select * from ("
				+ "select rownum as rnum, a.* from("
				+ "select * "
				+ "from tb_moim join tb_member using (mnum)"
				+ " where " + type + " like '%" + data + "%' "
				+ "order by moim_date)a) where rnum between "+ start + " and " + end;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while(rs.next()) {
				Moim moim = new Moim();
				moim.setMoimNum(rs.getInt("moim_num"));
				moim.setmNum(rs.getInt("mNum"));
				moim.setMoimKeyword(rs.getString("moim_keyword"));
				moim.setMoimTitle(rs.getString("moim_title").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				moim.setMoimText(rs.getString("moim_text").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				moim.setMoimReadCount(rs.getInt("moim_readcount"));
				int moimTime = Integer.parseInt(rs.getString("moim_date").substring(11, 13));
				String timeType = "오전";
				if(moimTime > 12) {
					timeType="오후";
					moimTime -= 12;
				}
				moim.setMoimDate(rs.getString("moim_date").substring(0,11) + " " + timeType + " " + moimTime + ":" + rs.getString("moim_date").substring(14, 16));
				
				moim.setMember(new MemberDao().selectMemberMnum(conn, rs.getInt("mNum")));
				moim.setMoimUpload(new MoimUploadDao().selectUpload(conn, rs.getInt("moim_num")));
				list.add(moim);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} 
		return list;
	}

	//모임 게시물 삭제
	public int deleteMoim(Connection conn, int moimNum) {
		PreparedStatement pstmt = null;
		String sql = "delete from tb_moim where moim_num=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, moimNum);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	//모임 게시물 수정
	public int updateMoim(Connection conn, int moimNum, String title, String text, String keyword) {
		PreparedStatement pstmt = null;
		String sql = "update tb_moim set moim_title=?, moim_keyword=?, moim_text=? where moim_num=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, keyword);
			pstmt.setString(3, text);
			pstmt.setInt(4, moimNum);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}

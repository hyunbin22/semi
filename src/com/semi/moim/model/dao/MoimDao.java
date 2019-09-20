package com.semi.moim.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.member.model.dao.MemberDao;
import com.semi.moim.model.vo.Moim;
import com.semi.moim.model.vo.MoimUpload;


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
				Moim m = new Moim();
				m.setMoimNum(rs.getInt("moim_num"));
				m.setmNum(rs.getInt("mNum"));
				m.setMoimKeyword(rs.getString("moim_keyword"));
				m.setMoimTitle(rs.getString("moim_title"));
				m.setMoimText(rs.getString("moim_text"));
				m.setMoimReadCount(rs.getInt("moim_readcount"));
				m.setMoimDate(rs.getDate("moim_date"));
				
				m.setMember(new MemberDao().selectMemberMnum(conn, rs.getInt("mNum")));
				m.setMoimUpload(new MoimUploadDao().selectUpload(conn, rs.getInt("moim_num")));
				list.add(m);
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
				moim.setMoimDate(rs.getDate("moim_date"));
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

}

package com.semi.notice.model.dao;

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
import com.semi.notice.model.dao.NoticeDao;
import com.semi.notice.model.vo.Notice;
import com.semi.notice.model.vo.NoticeUpload;
import com.semi.qna.model.vo.QnaUpload;
public class NoticeDao {
	
	private Properties prop=new Properties();
	
	public NoticeDao() {
		String path=NoticeDao.class.getResource("/sql/semi/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectNoticeCount(Connection conn) {
		Statement stmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="select count(*) from tb_notice";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return result;
	}
	
	public List<Notice> selectNoticeList(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list=new ArrayList();
		String sql=prop.getProperty("selectNoticeList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Notice n=new Notice();
				//NoticeUpload np = new NoticeUpload();
				n.setnNum(rs.getInt("nnum"));
				n.setAidNum(rs.getInt("ADMINNUM"));
				n.setnName(rs.getString("nname"));
				n.setnText(rs.getString("ntext"));
				n.setnDate(rs.getDate("ndate"));
				//np.setFileOriName(rs.getString("ori"));
				list.add(n);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	//noticeform등록
	public int enrollNotice(Connection conn, Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("enrollNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, n.getAidNum());
			pstmt.setString(2, n.getnName());
			pstmt.setString(3, n.getnText());
			result=pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int selectSeqNotice(Connection conn) {
		Statement stmt=null;
		ResultSet rs=null;
		int result = 0;
		String sql="select seq_notice.currval from dual";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	}
	
	public int enrollNoticeImg(Connection conn, NoticeUpload up, int seqNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("enrollNoticeImg");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, seqNo);
			pstmt.setString(2, up.getFileOriName());
			pstmt.setString(3, up.getFileReNmae());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Notice selectNotice(Connection conn,String nNum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice n=null;
		String sql=prop.getProperty("selectNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n=new Notice();
				n.setnNum(rs.getInt("nnum"));
				n.setAidNum(rs.getInt("adminnum"));
				n.setnName(rs.getString("nname"));
				n.setnText(rs.getString("ntext"));
				n.setnDate(rs.getDate("ndate"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
	}
	
	/* 파일불러오기 */
	public NoticeUpload selectQnaUpload(Connection conn, String nNum) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		NoticeUpload nu=null;
		String sql=prop.getProperty("selectNoticeUpload");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nu=new NoticeUpload();
				nu.setFileOriName(rs.getString("UP_NOTICE_ORG_FILENAME"));
				nu.setFileReNmae(rs.getString("UP_NOTICE_RE_FILENAME"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return nu;
	}
}

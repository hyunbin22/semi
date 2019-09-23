package com.semi.qna.model.dao;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

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
import com.semi.member.model.vo.Member;
import com.semi.notice.model.dao.NoticeDao;
import com.semi.notice.model.vo.Notice;
import com.semi.qna.model.vo.Qna;
import com.semi.qna.model.vo.QnaComment;
import com.semi.qna.model.vo.QnaUpload;

public class QnaDao {

	private Properties prop=new Properties();

	public QnaDao() {
		String path=NoticeDao.class.getResource("/sql/semi/qna-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int selectCountQna(Connection conn) {
		Statement stmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="select count(*) from tb_qna";
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

	public List<Qna> selectListPage(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Qna> list=new ArrayList();
		MemberDao dao = new MemberDao();
		String sql=prop.getProperty("selectListPageQna");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,(cPage-1)*numPerPage+1);
			pstmt.setInt(2,cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Qna q=new Qna();
				q.setqNum(rs.getInt("qnum"));
				q.setqTitle(rs.getString("qtitle"));
				q.setmNum(rs.getInt("mNum"));
				q.setqContent(rs.getString("qcontent"));
				q.setqDate(rs.getDate("qdate"));
				q.setMember(dao.selectMemberMnum(conn, rs.getInt("mnum")));

				list.add(q);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;

	}


	public int enrollQna(Connection conn, String mId, String title , String content) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("enrollQna");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, mId);
			pstmt.setString(3, content);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public int selectSeqQna(Connection conn) {
		Statement stmt=null;
		ResultSet rs=null;
		int result = 0;
		String sql="select seq_qna_num.currval from dual";
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

	public int enrollQnaImg(Connection conn, String qnaOriName, String qnaReName, int result) {
		PreparedStatement pstmt=null;
		int result2=0;
		String sql=prop.getProperty("enrollQnaImg");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, result);
			pstmt.setString(2, qnaOriName);
			pstmt.setString(3, qnaReName);
			result2=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result2;
	}


	public Qna selectQna(Connection conn, int qNum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Qna q=null;
		Member m = new Member();
		MemberDao dao = new MemberDao();
		String sql=prop.getProperty("selectQna");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				q=new Qna();
				q.setqNum(rs.getInt("qnum"));
				q.setqTitle(rs.getString("qtitle"));
				q.setmNum(rs.getInt("mnum"));
				q.setqContent(rs.getString("qcontent"));
				q.setqDate(rs.getDate("qdate"));
				q.setMember(dao.selectMemberMnum(conn, rs.getInt("mnum")));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return q;
	}
	public QnaComment selectQnaQref(Connection conn, int qRef) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		QnaComment qc=null;
		String sql=prop.getProperty("selectQnaQnum");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qRef);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qc = new QnaComment();
				qc.setMnum(rs.getInt("mnum"));
				qc.setQcContent(rs.getString("qcconntent"));
				qc.setQcDate(rs.getDate("qcdate"));
				qc.setQcNum(rs.getInt("qcnum"));
				qc.setqRef(rs.getInt("qref"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return qc;
	}

	/* 댓글------------------------------------------------------------*/
	public int insertComment(Connection conn, QnaComment qc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qc.getMnum());
			pstmt.setString(2, qc.getQcContent());
			pstmt.setInt(3, qc.getqRef());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public QnaComment selectQnaComment(Connection conn, int qRef) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		QnaComment qc=null;
		String sql=prop.getProperty("selectQnaComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qRef);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qc=new QnaComment();
				qc.setQcNum(rs.getInt("qcnum"));
				qc.setMnum(rs.getInt("mnum"));
				qc.setQcContent(rs.getString("QCCONTENT"));
				qc.setqRef(rs.getInt("qref"));
				qc.setQcDate(rs.getDate("qcdate"));
			}
		}catch (NullPointerException e){
			e.printStackTrace(	);
		}catch (Exception e) {

		}finally {
			close(rs);
			close(pstmt);
		}return qc;
	}

	// 댓글 시퀀스 번호
	public int selectSeqQnaComment(Connection conn) {
		Statement stmt=null;
		ResultSet rs=null;
		int result = 0;
		String sql="select SEQ_QNA_COMMENT.currval from dual";
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

	//댓글삭제하기
	public int deleteComment(Connection conn, int qcNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteComment");
		try {
			pstmt=conn.prepareStatement(sql);
			//			pstmt.setInt(1,qnaNo);
			pstmt.setInt(1, qcNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	/* 파일불러오기--------------------------------------*/
	public QnaUpload selectQnaUpload(Connection conn, int qNum) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		QnaUpload qu=null;
		String sql=prop.getProperty("selectQnaUpload");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qu=new QnaUpload();
				qu.setUpQnaOrgName(rs.getString("UP_QNA_ORI_FILENAME"));
				qu.setUpQnaReName(rs.getString("UP_QNA_RE_FILENAME"));
			}
		}catch(NullPointerException e){
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return qu;
	}

	/* Qna글 수정 */
	public Qna QnaUpdate(Connection conn, int qNum) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		Qna q=null;
		Member m = new Member();
		MemberDao dao = new MemberDao();
		String sql=prop.getProperty("selectQna");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				q=new Qna();
				q.setqNum(rs.getInt("qnum"));
				q.setqTitle(rs.getString("qtitle"));
				q.setmNum(rs.getInt("mnum"));
				q.setqContent(rs.getString("qcontent"));
				q.setqDate(rs.getDate("qdate"));
				q.setMember(dao.selectMemberMnum(conn, rs.getInt("mnum")));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return q;
	}

	//DAO
	public int updateQna(Connection conn, String title, String content, int qNum) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateQna");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, qNum);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
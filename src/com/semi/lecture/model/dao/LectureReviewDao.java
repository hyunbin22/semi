package com.semi.lecture.model.dao;

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

import com.semi.lecture.model.vo.LectureReview;
import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;

public class LectureReviewDao {

	private Properties prop=new Properties();

	public LectureReviewDao() {
		String path=LectureDao.class.getResource("/sql/semi/lecture-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	// select * from tb_order where lecNum=?
	//rNum, lecnum, mNum, rTitle, rText, rDate
	public List<LectureReview> lectureReview(Connection conn, int lecNo) {
		List<LectureReview> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("lectureReview");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lecNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LectureReview rv = new LectureReview();
				rv.setrNum(rs.getInt("rNum"));
				rv.setLecnum(lecNo);
				rv.setmNum(rs.getInt("mNum"));
				rv.setrTitle(rs.getString("rTitle").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				rv.setrText(rs.getString("rText").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				rv.setrDate(rs.getDate("rDate"));
				Member m = new MemberDao().selectMemberMnum(conn, rs.getInt("mNum"));
				rv.setMember(m);
				list.add(rv);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
}

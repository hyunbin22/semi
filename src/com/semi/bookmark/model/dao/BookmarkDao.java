package com.semi.bookmark.model.dao;

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

import com.semi.bookmark.model.vo.Bookmark;
import com.semi.lecture.model.dao.LectureDao;
import com.semi.lecture.model.vo.Lecture;
import com.semi.member.model.dao.MemberDao;
import com.semi.order.model.vo.Order;

public class BookmarkDao {
	private Properties prop = new Properties();

	public BookmarkDao() {
		String path = BookmarkDao.class.getResource("/sql/semi/bookmark-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		Statement stmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="select count(*) from tb_bookmark";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next())
			{
				result=rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return result;
				
	}

	public List<Bookmark> selectList(Connection conn, int cPage, int numPerPage, int mNum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Bookmark> list=new ArrayList();
		Lecture l = new Lecture();
		LectureDao dao = new LectureDao();
		String sql=prop.getProperty("selectBookmarkList");
		try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1,mNum);
	         pstmt.setInt(2,(cPage-1)*numPerPage+1);
	         pstmt.setInt(3,cPage*numPerPage);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 Bookmark bk = new Bookmark();
	        	 bk.setbNum(rs.getInt("bnum"));
	        	 bk.setLecNum(rs.getInt("mnum"));
	        	 bk.setLecture(dao.selectLectureName(conn, rs.getInt("lecnum")));
	        	 list.add(bk);
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	      }return list;
	}

}

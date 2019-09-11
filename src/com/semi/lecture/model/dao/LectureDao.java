package com.semi.lecture.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureUpload;

public class LectureDao {
	
	private Properties prop=new Properties();
	
	public LectureDao() {
		String path=LectureDao.class.getResource("/sql/semi/lecture-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int insertLecture(Connection conn, Lecture l , int mtNum) {

		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertLecture");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mtNum);
			pstmt.setInt(2, l.getSubNum());
			pstmt.setInt(3, l.getLocalSubNum());
			pstmt.setString(4, l.getLecName());
			pstmt.setString(5, l.getLecType());
			pstmt.setInt(6, l.getLecMaxCount());
			pstmt.setInt(7, l.getLecPrice());
			pstmt.setInt(8, l.getLecTime());
			pstmt.setInt(9, l.getLecCount());
			pstmt.setString(10, l.getLecWeek());
			pstmt.setString(11, l.getLecMeet());
			pstmt.setString(12, l.getLecTot());
			pstmt.setString(13, l.getLecTot2());
			pstmt.setDate(14, l.getLecOpenDate());
			pstmt.setDate(15, l.getLecOpenDate2());
			pstmt.setString(16, l.getLecLocalContent());
			pstmt.setString(17, l.getLecMentoContent());
			pstmt.setString(18, l.getLecLectureContent());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	 public int insertLectureImage(Connection conn, LectureUpload ltu, int lecNum) {
	      PreparedStatement pstmt=null;
	      System.out.println("lecNum : "+lecNum);
	      int result=0;
	      String sql=prop.getProperty("insertLectureImage");
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1, lecNum);
	         pstmt.setString(2, ltu.getUpLectureOrgCover());
	         pstmt.setString(3, ltu.getUpLectureReCover());
	         pstmt.setString(4, ltu.getUpLectureOrgLecImg());
	         pstmt.setString(5, ltu.getUpLectureReLecImg());
	         result=pstmt.executeUpdate();
	         
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return result;
	   }

	public int selectSeqLecNum(Connection conn, int mtNum) {
		
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select lecnum from tb_lecture where mtnum = " + mtNum;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	

}

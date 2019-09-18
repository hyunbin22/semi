package com.semi.lecture.model.dao;

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

import com.semi.lecture.model.vo.LectureUpload;
import static common.template.JDBCTemplate.*;

public class LectureUploadDao {
	
	private Properties prop=new Properties();
		
		public LectureUploadDao() {
			String path=LectureDao.class.getResource("/sql/semi/lecture-query.properties").getPath();
			try {
				prop.load(new FileReader(path));
			}catch(IOException e) {
				e.printStackTrace();
			}
		}

	public int insertLectureImage(Connection conn, LectureUpload lecup, int lecNum, String category) {

		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertLectureImage");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			pstmt.setString(2, category);
			pstmt.setString(3, lecup.getLectureOrgName());
			pstmt.setString(4, lecup.getLectureReName());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}

	public int updateLectureImage(Connection conn, LectureUpload lecup1, int result, String category) {
		PreparedStatement pstmt = null;
		int result1=0;
		String sql=prop.getProperty("updateLectureImage");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, lecup1.getLectureOrgName());
			pstmt.setString(3, lecup1.getLectureReName());
			pstmt.setInt(4, result);

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result1;
	}

	public int deleteLectureImg(Connection conn, int lecNum) {
		PreparedStatement pstmt = null;
		int result1=0;
		String sql=prop.getProperty("deleteLectureImg");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			result1=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result1;
	}
	
	   public List<LectureUpload> lectureUpList(Connection conn, int lecNum) {
		      Statement stmt = null;
		      List<LectureUpload> list = new ArrayList();
		      ResultSet rs = null;
		      String sql = "select * from tb_upload_lecture where lecNum="+lecNum;
		      try {
		         stmt = conn.createStatement();
		         rs = stmt.executeQuery(sql);
		         while(rs.next()) {
		            LectureUpload lecUp = new LectureUpload();
		            lecUp = new LectureUpload();
		            lecUp.setUpLectureNum(rs.getInt("up_lecturenum"));
		            lecUp.setLecNum(rs.getInt("lecnum"));
		            lecUp.setUpLectureCategory(rs.getString("up_Lecture_Category"));
		            lecUp.setLectureOrgName(rs.getString("up_Lecture_Org_Name"));
		            lecUp.setLectureReName(rs.getString("up_lecture_re_name"));
		            list.add(lecUp);
		         }
		         
		      } catch(Exception e) {
		         e.printStackTrace();
		      } finally {
		         close(rs);
		         close(stmt);
		      } return list;
		   }

}

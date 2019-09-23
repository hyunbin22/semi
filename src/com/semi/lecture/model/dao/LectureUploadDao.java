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
	
	//강의번호에 맞는 커버사진 불러오기
		public List<LectureUpload> lectureUpCover(Connection conn, int lecNum) {
			Statement stmt = null;
			List<LectureUpload> list = new ArrayList();
			LectureUpload lecUp = null;
			ResultSet rs = null;
			String sql = "select * from tb_upload_lecture where up_lecture_category='cover' and lecNum="+lecNum;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					lecUp = new LectureUpload();
					lecUp.setUpLectureNum(rs.getInt("up_lecturenum"));
					lecUp.setLecNum(rs.getInt("lecnum"));
					lecUp.setUpLectureCategory(rs.getString("up_Lecture_Category"));
					lecUp.setUpLectureOrgName(rs.getString("up_Lecture_Org_Name"));
					lecUp.setUpLectureReName(rs.getString("up_lecture_re_name"));
					list.add(lecUp);
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(stmt);
			} return list;
			
		}
		
		// 강의번호에 맞는 커버사진 불러오기 (LectulectureUpCover2reUpload) 하나
	   public LectureUpload lectureUpCover2(Connection conn, int lecNum) {
	      Statement stmt = null;
	      ResultSet rs = null;
	      LectureUpload lecUp = null;
	      String sql = "select * from tb_upload_lecture where up_lecture_category='cover' and lecNum="+lecNum;
	      try {
	         stmt = conn.createStatement();
	         rs=stmt.executeQuery(sql);
	         while(rs.next()) {
	            lecUp = new LectureUpload();
	            lecUp.setUpLectureNum(rs.getInt("up_lecturenum"));
	            lecUp.setLecNum(rs.getInt("lecnum"));
	            lecUp.setUpLectureCategory(rs.getString("up_Lecture_Category"));
	            lecUp.setUpLectureOrgName(rs.getString("up_Lecture_Org_Name"));
	            lecUp.setUpLectureReName(rs.getString("up_lecture_re_name"));
	            
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(stmt);
	      }
	      
	      return lecUp;
	   }
		
		// 강의번호에 맞는 이미지 넣기(다중)
		public List<LectureUpload> lectureUpImgList(Connection conn, int lecNum) {
			Statement stmt = null;
			List<LectureUpload> list = new ArrayList();
			ResultSet rs = null;
			String sql = "select up_lectureNum, lecnum, up_lecture_org_lecimg, up_lecture_re_lecimg from tb_upload_lecture where lecNum="+lecNum;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					LectureUpload lecUp = new LectureUpload();
					lecUp = new LectureUpload();
					lecUp.setUpLectureNum(rs.getInt("up_lecturenum"));
					lecUp.setLecNum(rs.getInt("lecnum"));
					lecUp.setUpLectureCategory("up_Lecture_Category");
					lecUp.setUpLectureOrgName("up_Lecture_Org_Name");
					lecUp.setUpLectureReName(rs.getString("up_lecture_re_name"));
					list.add(lecUp);
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(stmt);
			} return list;
		}

	public int insertLectureImage(Connection conn, LectureUpload lecup, int lecNum, String category) {

		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertLectureImage");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			pstmt.setString(2, category);
			pstmt.setString(3, lecup.getUpLectureOrgName());
			pstmt.setString(4, lecup.getUpLectureReName());
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
			pstmt.setString(2, lecup1.getUpLectureOrgName());
			pstmt.setString(3, lecup1.getUpLectureReName());
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
				lecUp.setUpLectureOrgName(rs.getString("up_Lecture_Org_Name"));
				lecUp.setUpLectureReName(rs.getString("up_lecture_re_name"));
				list.add(lecUp);
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return list;
	}

	public LectureUpload searchLectureImg(Connection conn, int lecNum) {
		  Statement stmt = null;
	      ResultSet rs = null;
	      LectureUpload lecUp = null;
	      String sql = "select * from tb_upload_lecture where lecNum="+lecNum;
	      try {
	         stmt = conn.createStatement();
	         rs=stmt.executeQuery(sql);
	         while(rs.next()) {
	            lecUp = new LectureUpload();
	            lecUp.setUpLectureNum(rs.getInt("up_lecturenum"));
	            lecUp.setLecNum(rs.getInt("lecnum"));
	            lecUp.setUpLectureCategory(rs.getString("up_Lecture_Category"));
	            lecUp.setUpLectureOrgName(rs.getString("up_Lecture_Org_Name"));
	            lecUp.setUpLectureReName(rs.getString("up_lecture_re_name"));
	            
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(stmt);
	      }
	      
	      return lecUp;
	}

}

package com.semi.lecture.model.dao;

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

import com.semi.category.model.vo.Category;
import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureUpload;
import com.semi.mento.model.vo.MentoUpload;

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

	public List<Lecture> lectureListByMtNum(Connection conn, int mtnum) {
		Statement stmt=null;
		ResultSet rs=null;
		List<Lecture> list=new ArrayList();
		String sql="select * from tb_lecture";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Lecture l=new Lecture();
				l.setLecName(rs.getString("lecName"));
				l.setLecNum(rs.getInt("lecNum"));
				list.add(l);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public Lecture lectureListByLecNum(Connection conn, int lecNum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Lecture lt = null;
		String sql=prop.getProperty("lectureListByLecNum");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				lt = new Lecture();
				lt.setMtNum(rs.getInt("mtNum"));
				lt.setLecNum(rs.getInt("lecNum"));
				lt.setSubNum(rs.getInt("subNum"));
				lt.setLocalSubNum(rs.getInt("sublocalNum"));
				lt.setLecName(rs.getString("lecName"));
				lt.setLecType(rs.getString("lecType"));
				lt.setLecMaxCount(rs.getInt("lecMaxCount"));
				lt.setLecPrice(rs.getInt("lecPrice"));
				lt.setLecTime(rs.getInt("lecTime"));
				lt.setLecCount(rs.getInt("lecCount"));
				lt.setLecWeek(rs.getString("lecWeek"));
				lt.setLecMeet(rs.getString("lecMeet"));
				lt.setLecTot(rs.getString("lecTot"));
				lt.setLecTot2(rs.getString("lecTot2"));
				lt.setLecOpenDate(rs.getDate("lecOpenDate"));
				lt.setLecOpenDate2(rs.getDate("lecOpenDate2"));
				lt.setLecLocalContent(rs.getString("lecLocalContent"));
				lt.setLecMentoContent(rs.getString("lecMentoContent"));
				lt.setLecLectureContent(rs.getString("lecLectureContent"));
				lt.setLectureUpList(new LectureUploadDao().lectureUpList(conn, lecNum));
				System.out.println(new LectureUploadDao().lectureUpList(conn, lecNum));
				
			}	
				
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return lt;
	}

	public int updateLecture(Connection conn, Lecture l, int lecNum) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("updateLecture");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, l.getSubNum());
			pstmt.setInt(2, l.getLocalSubNum());
			pstmt.setString(3, l.getLecName());
			pstmt.setString(4, l.getLecType());
			pstmt.setInt(5, l.getLecMaxCount());
			pstmt.setInt(6, l.getLecPrice());
			pstmt.setInt(7, l.getLecTime());
			pstmt.setInt(8, l.getLecCount());
			pstmt.setString(9, l.getLecWeek());
			pstmt.setString(10, l.getLecMeet());
			pstmt.setString(11, l.getLecTot());
			pstmt.setString(12, l.getLecTot2());
			pstmt.setDate(13, l.getLecOpenDate());
			pstmt.setDate(14, l.getLecOpenDate2());
			pstmt.setString(15, l.getLecLocalContent());
			pstmt.setString(16, l.getLecMentoContent());
			pstmt.setString(17, l.getLecLectureContent());
			pstmt.setInt(18, lecNum);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


}

package com.semi.lecture.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureReview;

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

//	public LectureReview lectureReview(Connection conn, int lecNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = prop.getProperty("lectureReview");
//		Lecture lec = null;
//		try {
//			psmt=conn.prepareStatement(sql);
//			pstmt.setInt(1, x);
//		}
//	}
	
}

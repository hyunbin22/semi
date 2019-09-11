package com.semi.lecture.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.lecture.model.dao.LectureDao;
import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureUpload;


public class LectureService {
	
	LectureDao dao = new LectureDao();

	public int insertLecture(Lecture l , int mtNum) {
		
		Connection conn= getConnection();
		int result=dao.insertLecture(conn, l , mtNum);
		
		if(result>0) {
			commit(conn);
			result = dao.selectSeqLecNum(conn, l.getMtNum());
		}else {
			rollback(conn);
		}
		return result;
	}
	
	   public int insertLectureImage(LectureUpload ltu, int mtNum) {
		      Connection conn=getConnection();
		      int result=dao.insertLectureImage(conn, ltu, mtNum);
		      
		      if(result>0) {
		         commit(conn);
		         
		      }else {
		         rollback(conn);
		      }
		      close(conn);
		      return result;
		   }

}

package com.semi.lecture.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.semi.category.model.vo.Category;
import com.semi.lecture.model.dao.LectureDao;
import com.semi.lecture.model.dao.LectureUploadDao;
import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureUpload;
import com.semi.mento.model.vo.MentoUpload;

import common.template.JDBCTemplate;


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
		close(conn);
		return result;
	}

	public List<Lecture> lectureListByMtNum(int mtnum) {
		Connection conn= getConnection();
		List<Lecture> list=dao.lectureListByMtNum(conn, mtnum);
		close(conn);
		return list;
	}


	public Lecture lectureListByLecNum(int lecNum) {
		Connection conn= getConnection();
		Lecture lt=dao.lectureListByLecNum(conn, lecNum);
		close(conn);
		return lt;
	}

	public int updateLecture(Lecture l, int lecNum) {
		Connection conn = getConnection();
		int result=dao.updateLecture(conn, l, lecNum);
		if(result>0) {
			
			commit(conn);

		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


}

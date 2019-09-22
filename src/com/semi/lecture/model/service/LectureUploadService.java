package com.semi.lecture.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.lecture.model.dao.LectureUploadDao;
import com.semi.lecture.model.vo.LectureUpload;

import common.template.JDBCTemplate;

public class LectureUploadService {
	
	private LectureUploadDao dao = new LectureUploadDao();

	public int insertLectureImage(LectureUpload lecup, int lecNum, String category) {
		Connection conn = getConnection();
		int result=dao.insertLectureImage(conn,lecup,lecNum,category);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateLectureImage(LectureUpload lecup1, int result, String category) {
		Connection conn = getConnection();
		int result1=dao.updateLectureImage(conn, lecup1, result, category);
		
		if(result>0) {
			commit(conn);

		}else {
			rollback(conn);
		}
		close(conn);
		return result1;
	}
	
	public List<LectureUpload> lectureUpList(int lecNum) {
		Connection conn= JDBCTemplate.getConnection();
		List<LectureUpload> list = dao.lectureUpList(conn,lecNum);
		close(conn);
		return list;
	}

	public int deleteLectureImg(int lecNum) {
		Connection conn = getConnection();
		int result=dao.deleteLectureImg(conn, lecNum);
		
		close(conn);
		return result;
	}

	public LectureUpload searchLectureImg(int lecNum) {
		Connection conn = getConnection();
		LectureUpload lu = dao.searchLectureImg(conn,lecNum);
		close(conn);
		return lu;
	}

}

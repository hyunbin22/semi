package com.semi.lecture.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.semi.lecture.model.dao.LectureReviewDao;
import com.semi.lecture.model.vo.LectureReview;

public class LectureReviewService {
	
	LectureReviewDao dao = new LectureReviewDao();

	public LectureReview selectReview(String lectureNo) {
		Connection conn = getConnection();
		LectureReview rv = dao.lectureReview(conn, Integer.parseInt(lectureNo));

		close(conn);
		return rv;
	}

}

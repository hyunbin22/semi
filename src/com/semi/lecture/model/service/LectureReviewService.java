package com.semi.lecture.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.lecture.model.dao.LectureReviewDao;
import com.semi.lecture.model.vo.LectureReview;

public class LectureReviewService {
	
	LectureReviewDao dao = new LectureReviewDao();

	public List<LectureReview> selectReview(String lectureNo) {
		Connection conn = getConnection();
		List<LectureReview> list= dao.lectureReview(conn, Integer.parseInt(lectureNo));

		close(conn);
		return list;
	}

}

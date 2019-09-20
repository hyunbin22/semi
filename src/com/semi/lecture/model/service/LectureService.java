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

	//승인카운트
	public int countLectureApproval() {
		Connection conn = getConnection();
		int result = dao.countLectureApproval(conn);
		close(conn);
		return result;
	}

	//강의승인리스트
	public List<Lecture> lectureApproList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Lecture> list = dao.lectureApproList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	//강의승인목록 검색
	public List<Lecture> lectureApproFindList(String type, String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Lecture> list = dao.lectureApproList(conn, type, data, cPage, numPerPage);
		close(conn);
		return list;
	}

	//강의 한개 보기
	public Lecture lectureView(int lecNum) {
		Connection conn = getConnection();
		Lecture lec = dao.lectureView(conn, lecNum);
		close(conn);
		return lec;
	}

	//강의 신청 거절사유 등록
	public int updateRefusalLecture(int lecNum, String reason) {
		Connection conn = getConnection();
		int result = dao.updateRefusalLecture(conn, lecNum, reason);
		if(result > 0) {
			commit(conn);
		} else rollback(conn);
		close(conn);

		return result;
	}

	//강의 승인
	public int updateCheckLecture(int lecNum) {
		Connection conn = getConnection();
		int result = dao.updateCheckLecture(conn, lecNum);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	//멘토가 강의 등록신청
	public int insertLecture(Lecture l , int mtNum) {

		Connection conn= getConnection();
		int result=dao.insertLecture(conn, l , mtNum);

		if(result>0) {
			commit(conn);
			result = dao.selectSeqLecNum(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	// 강의 전체 갯수!(승인된것)
	public int selectLectureCount() {
		Connection conn=getConnection();
		int result=dao.selectLectureCount(conn);
		close(conn);
		return result;
	}

	// lectureList 페이징
	public List<Lecture> selectLectureList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Lecture> list=dao.selectLectureList(conn, cPage, numPerPage);
		close(conn);

		return list;
	}

	//강의 선택
	public Lecture selectLecture(String lectureNo) {
		Connection conn = getConnection();
		Lecture lec = dao.lectureView(conn, Integer.parseInt(lectureNo));

		close(conn);
		return lec;
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

	//결제 완료시 강의 누적 수강인원 증가
	public int updateStudentCount(int oNum) {
		Connection conn = getConnection();
		int result = dao.updateStudentCount(conn, oNum);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

		public List<Lecture> lectureAllListByLecNum(int lecNum) {
		Connection conn= getConnection();
		List<Lecture> list=dao.lectureAllListByLecNum(conn, lecNum);
		close(conn);
		return list;
	}

		public List<LectureUpload> selectLectureUpload(int lecNum) {
			Connection conn= getConnection();
			List<LectureUpload> list=dao.selectLectureUpload(conn, lecNum);
			close(conn);
			return list;
		}


}

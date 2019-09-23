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
	public int countLectureApproval(String type, String data) {
		Connection conn = getConnection();
		int result = dao.countLectureApproval(conn, type, data);
		close(conn);
		return result;
	}

	//관리자 강의 검색
	public List<Lecture> lectureApproFindList(String type, String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Lecture> list = dao.lectureApproList(conn, type, data, cPage, numPerPage);
		close(conn);
		return list;
	}

	//멘토의 강의정보 리스트 받기
	public List<Lecture> lectureMentoList(int cPage, int numPerPage,int mtnum) {
		Connection conn= getConnection();
		List<Lecture> list=dao.lectureMentoList(conn, cPage, numPerPage,mtnum);
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

	//멘토번호로 강의조회
	public List<Lecture> lectureListByMtNum(int mtnum) {
		Connection conn= getConnection();
		List<Lecture> list=dao.lectureListByMtNum(conn, mtnum);
		close(conn);
		return list;
	}

	//강의번호로 강의조회
	public Lecture lectureListByLecNum(int lecNum) {
		Connection conn= getConnection();
		Lecture lt=dao.lectureListByLecNum(conn, lecNum);
		close(conn);
		return lt;
	}

	//강의 수정
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
	public int updateStudentCount(int oNum, String type) {
		Connection conn = getConnection();
		int result = dao.updateStudentCount(conn, oNum, type);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	//강의번호로 강의전체리스트 검색
	public List<Lecture> lectureAllListByLecNum(int lecNum) {
		Connection conn= getConnection();
		List<Lecture> list=dao.lectureAllListByLecNum(conn, lecNum);
		close(conn);
		return list;
	}

	//강의갯수
	public int countLectureList() {
		Connection conn = getConnection();
		int result = dao.countLectureList(conn);
		close(conn);
		return result;
	}

	//강의모든리스트(status Y)
	public List<Lecture> lectureAllList(int cPage, int numPerPage) {
		Connection conn= getConnection();
		List<Lecture> list=dao.lectureAllList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	//status(N)
	public int countLectureNoList() {
		Connection conn = getConnection();
		int result = dao.countLectureNoList(conn);
		close(conn);
		return result;
	}

	//status(N)
	public List<Lecture> lectureNoList(int cPage, int numPerPage) {
		Connection conn= getConnection();
		List<Lecture> list=dao.lectureNoList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	//status(N)로 바꾸기
	public int lectureOff(int lecNum) {
		Connection conn = getConnection();
		int result = dao.lectureOff(conn, lecNum);
		close(conn);
		return result;
	}

	//status(Y)로 바꾸기
	public int lectureOn(int lecNum) {
		Connection conn = getConnection();
		int result = dao.lectureOn(conn, lecNum);
		close(conn);
		return result;
	}

	public List<Lecture> lectureApproFindList2(String type, String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Lecture> list = dao.lectureApproList2(conn, type, data, cPage, numPerPage);
		close(conn);
		return list;
	}

	public List<Lecture> lectureApproFindList3(String type, String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Lecture> list = dao.lectureApproList3(conn, type, data, cPage, numPerPage);
		close(conn);
		return list;
	}

	public List<Lecture> lectureApproFindList4(String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Lecture> list = dao.lectureApproList4(conn, data, cPage, numPerPage);
		close(conn);
		return list;
	}

	public List<Lecture> lectureApproFindList5(String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Lecture> list = dao.lectureApproList5(conn, data, cPage, numPerPage);
		close(conn);
		return list;
	}


	//서브 카테고리 검색
	public List<Lecture> selectLectureListSubNum(int cPage, int numPerPage, int subNum) {
		Connection conn = getConnection();
		List<Lecture> list= dao.selectLectureListSubNum(conn, cPage, numPerPage, subNum);
		close(conn);
		return list;
	}

	//리뷰삭제
	public int deleteReview(int lecNum, int rNum) {
		Connection conn=getConnection();
		int result=dao.deleteComment(conn, lecNum, rNum);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}

	//리뷰등록
	public int insertReview(int lecNum, int mNum, String rTitle, String rText) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn,lecNum,mNum,rTitle,rText);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}



}

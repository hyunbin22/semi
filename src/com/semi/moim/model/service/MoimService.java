package com.semi.moim.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.moim.model.dao.MoimDao;
import com.semi.moim.model.vo.Moim;
import com.semi.moim.model.vo.MoimUpload;

public class MoimService {

	MoimDao dao = new MoimDao();
	
	//모임리스트
	public int countMoimList() {
		Connection conn = getConnection();
		int result = dao.count(conn);
		close(conn);
		return result;
		
		
	}
	
	//모임리스트
	public List<Moim> moimList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Moim> list = dao.moimList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	//모임게시물 작성
	public int moimEnroll(Moim moim) {
		
		Connection conn = getConnection();
		int result = dao.moimEnroll(conn, moim);
		if(result > 0) {
			commit(conn);
			result = dao.selectSeqMoim(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	//모임게시물 보기
	public Moim moimView(int moimNum, boolean hasRead) {
		Connection conn = getConnection();
		Moim moim = dao.moinView(conn, moimNum);
		if(!hasRead) {	//조회수 증가
			if(moim!=null) {	
				int result = dao.addReadCount(conn, moimNum);
				if(result > 0) {
					commit(conn);
				} else rollback(conn);
			}
		}
		close(conn);
		return moim;
	}

	//모임게시물 검색
	public int moimFindCount(String type, String data) {
		Connection conn = getConnection();
		int result = dao.moimFindCount(conn, type, data);
		close(conn);
		return result;
	}

	public List<Moim> moimFindList(String type, String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Moim> list = dao.moimFindList(conn, type, data, cPage, numPerPage);
		close(conn);
		return list;
	}


	//모임 게시물 삭제
	public int deleteMoim(int moimNum) {
		Connection conn = getConnection();
		int result = dao.deleteMoim(conn, moimNum);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//모임 데이터 가져오기(모임게시물 수정시 필요)
	public Moim moimView(int moimNum) {
		Connection conn = getConnection();
		Moim moim = dao.moinView(conn, moimNum);
		
		close(conn);
		return moim;
	}

	//모임게시물 수정
	public int updateMoim(int moimNum, String title, String text, String keyword) {
		Connection conn = getConnection();
		int result = dao.updateMoim(conn, moimNum, title, text, keyword);
		if(result > 0) {
			result = moimNum;
		} else rollback(conn);
		close(conn);
		return result;
	}



}

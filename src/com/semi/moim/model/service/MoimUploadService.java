package com.semi.moim.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.moim.model.dao.MoimUploadDao;
import com.semi.moim.model.vo.MoimUpload;

public class MoimUploadService {
	
	private MoimUploadDao dao = new MoimUploadDao();
	
	
	//모임 이미지 등록O
	public int moimFileInsert(MoimUpload mu, int moimNum) {
		Connection conn = getConnection();
		int result = dao.moimFileInsert(conn, mu, moimNum);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}

	
	//게시글 수정시 원래있던 파일 지웠을때
	public int deleteUpload(int upMoimNum) {
		Connection conn = getConnection();
		int result = dao.deleteUpload(conn, upMoimNum);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//원래있던파일 다지웠을때
	public int allDeleteUpload(int moimNum) {
		Connection conn = getConnection();
		int result = dao.allDeleteUpload(conn, moimNum);
		if(result > 0) {
			commit(conn);
		} else rollback(conn);
		close(conn);
		return result;
	}

}

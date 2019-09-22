package com.semi.mento.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.mento.model.dao.MentoUploadDao;
import com.semi.mento.model.vo.MentoUpload;

public class MentoUploadService {
	
	private MentoUploadDao dao = new MentoUploadDao();

	// 멘토신청이미지
	public int registerMentoImage(MentoUpload mtu, int mtnum, String category) {
		Connection conn=getConnection();
		int result=dao.registerMentoImage(conn, mtu, mtnum, category);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateMentoImage(MentoUpload mtu1, int result, String category) {

		Connection conn = getConnection();
		int result1=dao.updateMentoImage(conn, mtu1, result, category);

		if(result>0) {
			commit(conn);

		}else {
			rollback(conn);
		}
		close(conn);
		return result1;

	}


	public List<MentoUpload> mentoUpList(int getMtNum) {
		Connection conn= getConnection();
		List<MentoUpload> list=dao.mentoUpList(conn, getMtNum);
		close(conn);
		return list;
	}


	public int deleteMentoImg(int mtNum) {
		Connection conn = getConnection();
		int result=dao.deleteMentoImg(conn, mtNum);

		close(conn);
		return result;
	}

}

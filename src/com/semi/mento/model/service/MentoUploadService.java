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
}

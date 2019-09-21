package com.semi.mento.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.mento.model.dao.MentoUploadDao;
import com.semi.mento.model.vo.MentoUpload;

import common.template.JDBCTemplate;

public class MentoUploadService {
	
	private MentoUploadDao dao = new MentoUploadDao();


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


}

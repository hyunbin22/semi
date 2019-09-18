package com.semi.bookmark.model.service;

import java.sql.Connection;
import java.util.List;

import com.semi.bookmark.model.dao.BookmarkDao;
import com.semi.bookmark.model.vo.Bookmark;

import common.template.JDBCTemplate;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;



public class BookmarkService {
	
	private BookmarkDao dao = new BookmarkDao();

	public int selectBookmarkListCount() {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectListCount(conn);
		close(conn);
		return result;
		
	}

	public List<Bookmark> selectBookMarkList(int cPage, int numPerPage, int mNum) {
		Connection conn = JDBCTemplate.getConnection();
		List<Bookmark> list = dao.selectList(conn, cPage, numPerPage, mNum);
		return list;
	}

}

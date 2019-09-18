package com.semi.category.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.category.model.dao.CategoryDao;
import com.semi.category.model.vo.Category;

public class CategoryService {
	
	private CategoryDao dao=new CategoryDao();
	
	public int enrollCategory(Category c) {
		Connection conn=getConnection();
		int result=dao.enrollCategory(conn,c);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;

	}
	
	public List<Category> selectCategory()
	{
		Connection conn = getConnection();
		List<Category> list=dao.selectCategory(conn);
		close(conn);
		return list;
	}

	
	
	public int updateCategory(int selectbank, String inputcategory) {
		Connection conn=getConnection();
		int result=dao.updateCategory(conn,selectbank,inputcategory);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteCategory(int selectbank) {
		Connection conn=getConnection();
		int result=dao.deleteCategory(conn,selectbank);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int enrollCategory(String inputcategory) {
		Connection conn=getConnection();
		int result=dao.enrollCategory(conn,inputcategory);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}

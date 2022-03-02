package com.on.myown.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.on.myown.post.model.Todo;

@Repository
public interface PostDAO {

	
	public int insertTodo(
			@Param("userId")int userId,
			
			
			@Param("content")String content
			);
	
	
	
}

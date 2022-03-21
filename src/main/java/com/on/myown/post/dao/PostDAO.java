package com.on.myown.post.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.on.myown.post.model.Todo;


@Repository
public interface PostDAO {

	
	public int insertTodo(
			@Param("userId")int userId,
			@Param("state")String state,
			@Param("day")String day,
			@Param("content")String content);
	
	public List<Todo> selectTodoList(@Param("day")String day);
	
	
	
	
}

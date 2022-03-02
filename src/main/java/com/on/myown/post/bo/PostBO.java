package com.on.myown.post.bo;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.on.myown.post.dao.PostDAO;
import com.on.myown.post.model.Todo;



@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	
	public int addTodo(int userId,String state, String day,String content) {
		return postDAO.insertTodo(userId,  "todo",day, content);
	}
	
	public List<Todo> getTodoList(String day){
		List<Todo> todoList = postDAO.selectTodoList();
		return todoList;
	}
	
}

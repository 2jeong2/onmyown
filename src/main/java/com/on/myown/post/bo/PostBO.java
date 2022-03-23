package com.on.myown.post.bo;


import java.text.SimpleDateFormat;
import java.util.Date;
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
		return postDAO.insertTodo(userId, "todo",day, content);
	}
	
	public List<Todo> getTodoList(String day){
		
		if(day == null) {
			Date date = new Date();
			
			SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd");
			
			day = formatter.format(date);
			
		}
		
		return postDAO.selectTodoList(day);
		
		
		
	}
	
	public int deleteTodo(int id, int userId) {
		
		
		return postDAO.deleteTodo(id);
	}
	
	public int updateTodo(String content, int id) {
		return postDAO.updateTodo(content, id);
	}
}

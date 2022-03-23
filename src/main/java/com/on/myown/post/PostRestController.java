package com.on.myown.post;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.on.myown.post.bo.PostBO;



@RestController
@RequestMapping("/post/todo")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String,String>todolist(
			
			@RequestParam(value="state", required=false)String state,
			@RequestParam("day")String day,
			@RequestParam("content")String content,
			HttpServletRequest request
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.addTodo(userId,state,day,content);
		Map<String,String>result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
		
		
	}
	
	@GetMapping("/delete")
	public Map<String,String> delete(@RequestParam("id")int id, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId=(Integer)session.getAttribute("userId");
		
		int count = postBO.deleteTodo(id, userId);
		
		Map<String, String > result = new HashMap<>();
		
		if(count == 1) {
			result.put("result","success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@GetMapping("/update")
	public Map<String,String> updateTodo(
			@RequestParam("content")String content, 
			@RequestParam("id")int id,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.updateTodo(content, id);
		
		Map<String,String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	
	
	

}

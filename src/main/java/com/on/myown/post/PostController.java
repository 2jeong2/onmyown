package com.on.myown.post;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.on.myown.post.bo.PostBO;
import com.on.myown.post.model.Todo;

@Controller
@RequestMapping("/post")
public class PostController {

	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/myown_view")
	public String myown(@RequestParam(value="day", required=false)String day,HttpServletRequest request ,Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Todo> todoList = postBO.getTodoList(day);
		model.addAttribute("todoList",todoList);
		
		return "post/myown";
	}
	
	@GetMapping("proud_view")
	public String proud(Model model) {
		
		
		return "/post/proud";
	}
	
	@GetMapping("/anotherUser_view")
	public String anotherUserView() {
		
		return "/post/anotherUser";
	}
	
}

package com.on.myown.post;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.on.myown.post.bo.PostBO;

@Controller
@RequestMapping("/post")
public class PostController {

	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/myown_view")
	public String myown(Model model) {
		
		
		
		return "post/myown";
	}
	
	@GetMapping("proud_view")
	public String proud(Model model) {
		
		
		return "/post/proud";
	}
	
}

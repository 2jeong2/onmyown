package com.on.myown.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.on.myown.user.bo.UserBO;
import com.on.myown.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	
	@Autowired
	private UserBO userBO;
	@PostMapping("/sign_up")
	public Map<String , String >singUp (
			@RequestParam("loginId")String loginId,
			@RequestParam("password")String password,
			@RequestParam("userName")String userName,
			@RequestParam("phoneNumber")String phoneNumber,
			@RequestParam("email")String email
			) {
		int count = userBO.getUser(loginId, password, userName, phoneNumber, email);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1 ) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String ,String> signIn(
			@RequestParam("loginId")String loginId,
			@RequestParam("password")String password,
			HttpServletRequest request){
		
		User user =  userBO.selectUSer(loginId, password);
		
		Map<String ,String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getUserName());
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
}

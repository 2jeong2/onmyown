package com.on.myown.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.on.myown.user.bo.UserBO;

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
	
}

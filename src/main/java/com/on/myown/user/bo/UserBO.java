package com.on.myown.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.on.myown.common.EncryptUtils;
import com.on.myown.user.dao.UserDAO;
import com.on.myown.user.model.User;

@Service
public class UserBO {

	
	@Autowired
	private UserDAO userDAO;
	
	public int getUser(String loginId, String password, String userName, String phoneNumber, String email) {
		
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encPassword, userName, phoneNumber, email);
	}
	
	public User selectUSer(String loginId, String password) {
		return userDAO.selectUser(loginId,EncryptUtils.md5(password));
	}
	
}

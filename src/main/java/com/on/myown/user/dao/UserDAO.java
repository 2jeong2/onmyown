package com.on.myown.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.on.myown.user.model.User;

@Repository
public interface UserDAO {

	
	public int insertUser(
			@Param("loginId")String loginId,
			@Param("password")String password,
			@Param("userName")String userName,
			@Param("phoneNumber")String phoneNumber,
			@Param("email")String email);
	
	public User selectUser(
			@Param("loginId")String loginId,
			@Param("password")String password);
	
}

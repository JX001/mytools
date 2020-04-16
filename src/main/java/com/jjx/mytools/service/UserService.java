package com.jjx.mytools.service;

import com.jjx.mytools.entity.User;
import com.jjx.mytools.utils.Message;

public interface UserService {

	Message queryUserList();
	void saveUser(User user);
	
	Message loginByUserPassword(String userName,String userPassword);
}

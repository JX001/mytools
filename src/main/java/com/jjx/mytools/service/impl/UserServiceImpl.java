package com.jjx.mytools.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjx.mytools.dao.UserDao;
import com.jjx.mytools.entity.User;
import com.jjx.mytools.entity.UserExample;
import com.jjx.mytools.service.UserService;
import com.jjx.mytools.utils.MD5Util;
import com.jjx.mytools.utils.Message;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;

	public Message queryUserList() {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		UserExample example = new UserExample();
		List<User> listMenu = userDao.selectByExample(example);
		data.put("data", listMenu);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	public void saveUser(User user) {
		int userId = user.getUserId();
		User u = userDao.selectByPrimaryKey(userId);
		user.setUserUpdatedate(new Date());
		if (u != null) {
			user.setUserCreatedate(u.getUserCreatedate());
			String _userPassword = user.getUserPassword();
			if (!u.getUserPassword().equals(_userPassword)) {
				String userPassword = MD5Util.getMD5(_userPassword);
				user.setUserPassword(userPassword);
			}
			userDao.updateByPrimaryKey(user);
		} else {
			user.setUserCreatedate(new Date());
			String _userPassword = user.getUserPassword();
			String userPassword = MD5Util.getMD5(_userPassword);
			user.setUserPassword(userPassword);
			userDao.insert(user);
		}

	}

	public Message loginByUserPassword(String userName, String userPassword) {

		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		User u = new User();
		u.setUserName(userName);
		String _userPassword = MD5Util.getMD5(userPassword);
		u.setUserPassword(_userPassword);
		User resUser = userDao.selectByUserPassword(u);
		if (resUser != null) {
			data.put("data", resUser);
			message.setData(data);
			message.setOk(true);
		} else {
			message.setData(data);
			message.setOk(false);
		}

		return message;
	}

}

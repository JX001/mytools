package com.jjx.mytools.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjx.mytools.entity.User;
import com.jjx.mytools.service.UserService;
import com.jjx.mytools.utils.Message;

@Controller
@RequestMapping("/admin")
public class ToolsLoginController {

	@Autowired
	private UserService userService;

	/**
	 * Login
	 */
	@RequestMapping("/login")
	public String login() {
		return "admin/login";
	}

	@RequestMapping("/submitLogin")
	@ResponseBody
	public Message submitLogin(HttpSession session, @RequestBody User user) {
		String userName = user.getUserName();
		String userPassword = user.getUserPassword();
		Message message = new Message();
		if (!StringUtils.isEmpty(userName) && !StringUtils.isEmpty(userPassword)) {
			message = userService.loginByUserPassword(userName, userPassword);
			if (message.isOk()) {
				session.setAttribute("USER_SESSION", (User) message.getData().get("data"));
			}
		} else {
			message.setOk(false);
		}

		return message;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		// 清除session
		session.invalidate();
		// 重定向到登录页面的跳转方法
		return "redirect:login";
	}
}

package com.yzq.stp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yzq.stp.model.User;
import com.yzq.stp.service.UserServiceImpl;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/stp/")
public class UserController {

	@Autowired
	private UserServiceImpl userServiceImpl;

	/**
	 * 注册
	 * 
	 * @param user
	 * @param messageMap
	 * @return
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(User user, ModelMap messageMap) {
		boolean flag = userServiceImpl.reqister(user);
		if (!flag) {
			messageMap.addAttribute("message", "<font color='red'>用户名已存在</font>");
			return "register";
		}
		messageMap.addAttribute("message", "<font color='red'>注册成功，请登入</font>");
		return "login";
	}

	/**
	 * 登录
	 * 
	 * @param user
	 * @param messageMap
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(User user, ModelMap messageMap, HttpSession httpSession) {
		User dbUser = userServiceImpl.login(user);
		if (dbUser == null) {
			messageMap.addAttribute("message", "<font color='red'>用户名或密码错误</font>");
			return "login";
		}

		httpSession.setAttribute("u", dbUser);
		// 接包方
		if (user.getType() == 0) {
			return "acceptInfo";
		}
		// 发包方
		return "sendInfo";
	}

	/**
	 * 接受方退出
	 * 
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("logout")
	public String acceptLogout(HttpSession httpSession) {
		httpSession.invalidate();
		return "login";
	}

	/**
	 * 加载信息
	 * 
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("loadUserInfo")
	public String loadUserInfo(int id, int type, ModelMap modelMap) {
		User user = userServiceImpl.loadUserInfo(id);
		System.out.println("user" + user);
		modelMap.addAttribute("u", user);
		if (type == 0) {
			return "acceptInfo";
		}
		return "sendInfo";
	}

	
	@RequestMapping("toUpdateUserInfo")
	public String toUpdateUserInfo(int id, int type, ModelMap modelMap) {
		User user = userServiceImpl.loadUserInfo(id);
		System.out.println("user" + user);
		modelMap.addAttribute("u", user);
		if (type == 0) {
			return "acceptUpdate";
		}
		return "sendUpdate";
	}

	/**
	 * 更新信息
	 * 
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("updateUserInfo")
	public String updateUserInfo(User user, ModelMap modelMap) {
		System.out.println(user);
		userServiceImpl.updateUserInfo(user);
		User dbUser = userServiceImpl.loadUserInfo(user.getId());
		modelMap.addAttribute("u", dbUser);
		modelMap.addAttribute("message", "更新成功");
		if (user.getType() == 0) {
			return "acceptUpdate";
		}
		return "sendUpdate";
	}

}

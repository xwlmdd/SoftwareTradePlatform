package com.yzq.stp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.stp.mapper.UserMapper;
import com.yzq.stp.model.User;

@Service
public class UserServiceImpl {
	
	@Autowired
	private UserMapper userMapper;

	/**
	 * 注册0是需求方1发包方
	 * @param user
	 * @return
	 */
	public boolean reqister(User user) {
		User dbUser = userMapper.queryUserByName(user.getName());
		if(dbUser!=null){
			return false;
		}
		userMapper.insert(user);
		return true;
	}

	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public User login(User user) {
		User dbUser = userMapper.queryUser(user);
		if(dbUser!=null){
			return dbUser;
		}
		return null;
	}

	public User loadUserInfo(int id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public void updateUserInfo(User user) {
		userMapper.updateByPrimaryKey(user);
	}

}

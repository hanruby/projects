package com.eatifying.server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eatifying.dao.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;

	public int addCustomerDetials() {

		return -1;
	}

	public int login(String userName, String password) {
		String passwd = userMapper.getPassword(userName);
		if (passwd.equals(password))
			return 1;
		return -1;
	}
}

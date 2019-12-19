package com.wintech.datacenter.trafficcabinet.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wintech.datacenter.trafficcabinet.mapper.UserMapper;
import com.wintech.datacenter.trafficcabinet.pojo.User;
import com.wintech.datacenter.trafficcabinet.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper mapper;

	@Override
	public User login(User user) {
		return mapper.login(user);
	}

	@Override
	public int addUser(User user) {
		return mapper.addUser(user);
	}

	@Override
	public String phone(String phone) {
		return mapper.phone(phone);
	}

	@Override
	public String phoneshow(User user) {
		return mapper.phoneshow(user);
	}

	@Override
	public List<User> getAllPageUser(Integer rowNum, int pagecount, String userid) {
		return mapper.getAllPageUser(rowNum, pagecount, userid);
	}

	@Override
	public int totalCount(String userid) {
		return mapper.totalCount(userid);
	}

	@Override
	public int deleteUser(String userid) {
		return mapper.deleteUser(userid);
	}

	@Override
	public int delSelected(String[] id) {
		return mapper.delSelected(id);
	}

	@Override
	public int updateStateLogin(User user) {
		return mapper.updateStateLogin(user);
	}

	@Override
	public int updateStateLogout(User user) {
		return mapper.updateStateLogout(user);
	}

	@Override
	public List<User> getUsers(String[] id) {
		return mapper.getUsers(id);
	}

	@Override
	public int getRoleByUser(User user) {
		return 0;
	}

	@Override
	public int updateTime(String logintime, String userid, String password) {
		return mapper.updateTime(logintime, userid, password);
	}

	@Override
	public int updateTimes(String logouttime, String userid) {
		return mapper.updateTimes(logouttime, userid);
	}

	@Override
	public User verift(String userid) {
		return mapper.verift(userid);
	}

	@Override
	public int updatePass(String password, String userid) {
		return mapper.updatePass(password, userid);
	}
}

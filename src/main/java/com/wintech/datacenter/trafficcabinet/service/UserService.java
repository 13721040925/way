package com.wintech.datacenter.trafficcabinet.service;

import java.util.List;

import com.wintech.datacenter.trafficcabinet.pojo.User;

public interface UserService {

	// 登录
	User login(User user);

	// 获取手机号
	String phoneshow(User user);

	// 手机号加密
	String phone(String phone);

	// 添加用户
	int addUser(User user);

	// 模糊分页查询用户信息
	List<User> getAllPageUser(Integer rowNum, int pagecount, String userid);

	// 用户总条数
	int totalCount(String userid);

	// 用户删除
	int deleteUser(String userid);

	// 批量删除
	int delSelected(String[] id);

	// 用户登录时修改状态
	int updateStateLogin(User user);

	// 用户退出时修改状态
	int updateStateLogout(User user);

	// 根据id获得所有的用户
	List<User> getUsers(String[] id);

	// 获取role
	int getRoleByUser(User user);

	// 修改成当前时间-登录
	int updateTime(String logintime, String userid, String password);

	// 修改当前时间-退出
	int updateTimes(String logouttime, String userid);

	// 通过账号验证码是否存在
	User verift(String userid);

	// 修改密码
	int updatePass(String password, String userid);
}

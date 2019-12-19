package com.wintech.datacenter.trafficcabinet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wintech.datacenter.trafficcabinet.pojo.User;

public interface UserMapper {

	// 登录
	@Select("select * from user where userid=#{userid} and password=#{password};")
	User login(User user);

	// 添加用户
	@Insert("insert into user(userid,password,role,state,phone)values(#{userid},#{password},2,2,#{phone})")
	int addUser(User user);

	// 手机号加密
	@Select("")
	String phone(@Param("phone") String phone);

	// 获取手机号
	@Select("select phone from user where userid=#{userid} and password=#{password}")
	String phoneshow(User user);

	// 模糊分页查询用户信息
	List<User> getAllPageUser(@Param("rowNum") Integer rowNum, @Param("pagecount") int pagecount,
			@Param("userid") String userid);

	// 用户总条数
	int totalCount(@Param("userid") String userid);

	// 用户删除
	@Delete("delete from user where userid=#{userid}")
	int deleteUser(@Param("userid") String userid);

	// 批量删除
	int delSelected(String[] id);

	// 修改用户在线状态
	@Update("update user set state=1 where userid=#{userid} and password=#{password}")
	int updateStateLogin(User user);

	// 用户退出时修改状态
	@Update("update user set state=2 where userid=#{userid} and password=#{password}")
	int updateStateLogout(User user);

	// 根据id获得所有的用户
	List<User> getUsers(String[] id);

	// 获取role
	@Select("select role from user where userid=#{userid} and password=#{password}")
	int getRoleByUser(User user);

	// 修改成当前时间-登录
	@Update("update user set logintime=#{logintime} where userid=#{userid} and password=#{password}")
	int updateTime(@Param("logintime") String logintime, @Param("userid") String userid,
			@Param("password") String password);

	// 修改当前时间-退出
	@Update("update user set logouttime=#{logouttime} where userid=#{userid}")
	int updateTimes(@Param("logouttime") String logouttime, @Param("userid") String userid);

	// 通过账号验证码是否存在
	@Select("select * from user where userid=#{userid}")
	User verift(@Param("userid") String userid);

	// 修改密码
	@Update("update user set password=#{password} where userid=#{userid}")
	int updatePass(@Param("password") String password, @Param("userid") String userid);
}

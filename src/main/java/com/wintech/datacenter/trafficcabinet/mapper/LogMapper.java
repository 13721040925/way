package com.wintech.datacenter.trafficcabinet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.wintech.datacenter.trafficcabinet.pojo.Useractionlog;

public interface LogMapper {
	// 添加操作日志
	@Insert("Insert into useractionlog(userid,message,time)values(#{userid},#{message},#{time})")
	int addLog(Useractionlog log);

	// 模糊分页显示所有的日志信息
	List<Useractionlog> getAllPageLog(@Param("rowNum") Integer rowNum, @Param("pagecount") int pagecount,
			@Param("timemin") String timemin, @Param("timemax") String timemax, @Param("userid") String userid);

	// 获得所有日志
	@Select("select * from useractionlog")
	List<Useractionlog> getAlllog();

	// 总条数
	int totalCount(Integer id);

	// 获得最大的id数
	@Select("select MAX(id) from useractionlog")
	int getMaxId();
}

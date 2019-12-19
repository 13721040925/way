package com.wintech.datacenter.trafficcabinet.service;

import java.util.List;

import com.wintech.datacenter.trafficcabinet.pojo.Useractionlog;

public interface LogService {

	// 添加操作日志
	int addLog(Useractionlog log);

	// 获得所有日志
	List<Useractionlog> getAlllog();

	// 模糊分页显示所有的日志信息
	List<Useractionlog> getAllPageLog(Integer rowNum, int pagecount, String timemin, String timemax, String userid);//

	// 总条数
	int totalCount(Integer id);

	// 获得最大id数
	int getMaxId();
}

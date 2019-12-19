package com.wintech.datacenter.trafficcabinet.service;

import java.util.List;

import com.wintech.datacenter.trafficcabinet.pojo.Alarmdata;

public interface AlarmdataService {
	int addAlarmdata(Alarmdata alarmdata);

	// 分页显示报警信息
	List<Alarmdata> gePageAlarmdata(Integer rowNum, int pagecount, String timemin, String timemax, String deviceid);

	// 报警信息总数
	int totalCount(Integer id);

	// 报警信息总数(id自增长)
	int getMaxId();
}

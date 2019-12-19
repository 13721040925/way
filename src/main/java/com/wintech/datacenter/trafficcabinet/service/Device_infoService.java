package com.wintech.datacenter.trafficcabinet.service;

import java.util.List;

import com.wintech.datacenter.trafficcabinet.pojo.Device_info;

public interface Device_infoService {

	// 获取机柜信息的集合
	List<Device_info> getDevice();

	// 根据机柜id 查找机柜总数
	int totalCount(String deviceId);

	// 根据机柜id 模糊分页
	List<Device_info> getPageDevice(Integer rowNum, int pageCount, String deviceId);

	// 通过deviceId来查找机柜
	Device_info getDevice_info(String deviceId);

	// 修改设备信息
	int updateDevice(Device_info device_info);

	// 添加机柜
	int addDevice(Device_info device_info);
}

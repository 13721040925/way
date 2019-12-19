package com.wintech.datacenter.trafficcabinet.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wintech.datacenter.trafficcabinet.mapper.Device_infoMapper;
import com.wintech.datacenter.trafficcabinet.pojo.Device_info;
import com.wintech.datacenter.trafficcabinet.service.Device_infoService;

@Service("Device_infoService")
public class Device_infoServiceImpl implements Device_infoService {

	@Resource
	private Device_infoMapper mapper;

	@Override
	public List<Device_info> getDevice() {
		return mapper.getDevice();
	}

	@Override
	public int totalCount(String deviceId) {
		return mapper.totalCount(deviceId);
	}

	@Override
	public List<Device_info> getPageDevice(Integer rowNum, int pageCount, String deviceId) {
		return mapper.getPageDevice(rowNum, pageCount, deviceId);
	}

	@Override
	public Device_info getDevice_info(String deviceId) {
		System.out.println("Device_info=" + mapper.getDevice_info(deviceId));
		return mapper.getDevice_info(deviceId);
	}

	@Override
	public int updateDevice(Device_info device_info) {
		return mapper.updateDevice(device_info);
	}

	@Override
	public int addDevice(Device_info device_info) {
		return mapper.addDevice(device_info);
	}
}

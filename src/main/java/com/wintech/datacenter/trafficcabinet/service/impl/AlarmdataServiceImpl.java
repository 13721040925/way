package com.wintech.datacenter.trafficcabinet.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wintech.datacenter.trafficcabinet.mapper.AlarmdataMapper;
import com.wintech.datacenter.trafficcabinet.pojo.Alarmdata;
import com.wintech.datacenter.trafficcabinet.service.AlarmdataService;

@Service("alarmdataService")
public class AlarmdataServiceImpl implements AlarmdataService {
	@Resource
	private AlarmdataMapper mapper;

	@Override
	public int addAlarmdata(Alarmdata alarmdata) {
		System.out.println((mapper.addAlarmdata(alarmdata) > 0) ? mapper.addAlarmdata(alarmdata) : 0);
		return (mapper.addAlarmdata(alarmdata) > 0) ? mapper.addAlarmdata(alarmdata) : 0;
	}

	@Override
	public List<Alarmdata> gePageAlarmdata(Integer rowNum, int pagecount, String timemin, String timemax,
			String deviceid) {
		return mapper.gePageAlarmdata(rowNum, pagecount, timemin, timemax, deviceid);
	}

	@Override
	public int totalCount(Integer id) {
		return mapper.totalCount(id);
	}

	@Override
	public int getMaxId() {
		return mapper.getMaxId();
	}
}

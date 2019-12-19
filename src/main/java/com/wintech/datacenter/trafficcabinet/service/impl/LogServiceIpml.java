package com.wintech.datacenter.trafficcabinet.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wintech.datacenter.trafficcabinet.mapper.LogMapper;
import com.wintech.datacenter.trafficcabinet.pojo.Useractionlog;
import com.wintech.datacenter.trafficcabinet.service.LogService;

@Service("logService")
public class LogServiceIpml implements LogService {

	@Resource
	private LogMapper mapper;

	@Override
	public int addLog(Useractionlog log) {
		return mapper.addLog(log);
	}

	@Override
	public int totalCount(Integer id) {
		return mapper.totalCount(id);
	}

	@Override
	public int getMaxId() {
		return mapper.getMaxId();
	}

	@Override
	public List<Useractionlog> getAlllog() {
		return mapper.getAlllog();
	}

	@Override
	public List<Useractionlog> getAllPageLog(Integer rowNum, int pagecount, String timemin, String timemax,
			String userid) {
		return mapper.getAllPageLog(rowNum, pagecount, timemin, timemax, userid);
	}

}

package com.wintech.datacenter.trafficcabinet.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wintech.datacenter.trafficcabinet.mapper.HeartInfoMapper;
import com.wintech.datacenter.trafficcabinet.pojo.HeartInfo;
import com.wintech.datacenter.trafficcabinet.service.HeartInfoService;

@Service("heartInfoService")
public class HeartInfoServiceImpl implements HeartInfoService {
	@Resource
	private HeartInfoMapper mapper;

	@Override
	public int addHeartInfo(HeartInfo heartInfo) {
		// TODO 自动生成的方法存根
		return mapper.addHeartInfo(heartInfo);
	}

}

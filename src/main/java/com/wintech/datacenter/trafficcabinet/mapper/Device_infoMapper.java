package com.wintech.datacenter.trafficcabinet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.wintech.datacenter.trafficcabinet.pojo.Device_info;

public interface Device_infoMapper {

	@Select("select * from device_info")
	List<Device_info> getDevice();

	// 根据机柜id 查找机柜总数
	int totalCount(@Param("deviceId") String deviceId);

	// 根据机柜id 模糊分页
	List<Device_info> getPageDevice(@Param("rowNum") Integer rowNum, @Param("pageCount") int pageCount,
			@Param("deviceId") String deviceId);

	// 通过deviceId来查找机柜
	// @Select("select * from device_info where deviceId=#{deviceId}")
	Device_info getDevice_info(@Param("deviceId") String deviceId);

	// 修改设备信息
	int updateDevice(Device_info device_info);

	// 添加机柜
	@Insert("insert into device_info(deviceId,devicename,lng,lat)values(#{deviceId},#{devicename},#{lng},#{lat})")
	int addDevice(Device_info device_info);
}

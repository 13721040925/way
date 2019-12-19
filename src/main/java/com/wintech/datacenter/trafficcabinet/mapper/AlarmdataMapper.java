package com.wintech.datacenter.trafficcabinet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.wintech.datacenter.trafficcabinet.pojo.Alarmdata;

public interface AlarmdataMapper {
	@Insert("Insert into alarmdata (deviceid,doorone,doortwo,camera,lockstate,zhendong,power,alarmtime) values (#{deviceid},#{doorone},#{doortwo},#{camera},#{lockstate},#{zhendong},#{power},#{alarmtime}) ")
	int addAlarmdata(Alarmdata alarmdata);

	// 分页显示报警信息
	List<Alarmdata> gePageAlarmdata(@Param("rowNum") Integer rowNum, @Param("pagecount") int pagecount,
			@Param("timemin") String timemin, @Param("timemax") String timemax, @Param("deviceid") String deviceid);

	// 报警信息总数
	int totalCount(@Param("id") Integer id);

	// 报警信息总数(id自增长)
	@Select("select MAX(id) from alarmdata")
	int getMaxId();
}

package com.wintech.datacenter.trafficcabinet.pojo;

import org.springframework.stereotype.Component;

/**
 * 机柜信息类
 * 
 * @author Administrator
 *
 */
@Component("device_info")
public class Device_info {

	private Integer id;// id
	private String deviceId;// 机柜编号
	private String devicestate;// 机柜名称
	private String devicename;// 机柜在线状态
	private String registstate;// 注册状态
	private String tempnow;// 当前温度
	private String tempmax; // 温度上限
	private String tempmin;// 温度下限
	private String wetnow;// 当前湿度
	private String wetmax;// 湿度上限
	private String wetmin;// 湿度下限
	private String lat;// 纬度
	private String lng;// 经度
	private String shake;// 震动等级
	private String deviceip;// 机柜ip
	private String serverip;// 服务器ip
	private String geteway;// 网关ip
	private String snm;// 子网掩码
	private String serverport;// 服务器端口
	private String deviceport;// 机柜端口
	private String reporttime;// 上报时间间隔
	private String hearttime;// 心跳包间隔时间

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getDevicestate() {
		return devicestate;
	}

	public void setDevicestate(String devicestate) {
		this.devicestate = devicestate;
	}

	public String getDevicename() {
		return devicename;
	}

	public void setDevicename(String devicename) {
		this.devicename = devicename;
	}

	public String getRegiststate() {
		return registstate;
	}

	public void setRegiststate(String registstate) {
		this.registstate = registstate;
	}

	public String getTempnow() {
		return tempnow;
	}

	public void setTempnow(String tempnow) {
		this.tempnow = tempnow;
	}

	public String getTempmax() {
		return tempmax;
	}

	public void setTempmax(String tempmax) {
		this.tempmax = tempmax;
	}

	public String getTempmin() {
		return tempmin;
	}

	public void setTempmin(String tempmin) {
		this.tempmin = tempmin;
	}

	public String getWetnow() {
		return wetnow;
	}

	public void setWetnow(String wetnow) {
		this.wetnow = wetnow;
	}

	public String getWetmax() {
		return wetmax;
	}

	public void setWetmax(String wetmax) {
		this.wetmax = wetmax;
	}

	public String getWetmin() {
		return wetmin;
	}

	public void setWetmin(String wetmin) {
		this.wetmin = wetmin;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getShake() {
		return shake;
	}

	public void setShake(String shake) {
		this.shake = shake;
	}

	public String getDeviceip() {
		return deviceip;
	}

	public void setDeviceip(String deviceip) {
		this.deviceip = deviceip;
	}

	public String getServerip() {
		return serverip;
	}

	public void setServerip(String serverip) {
		this.serverip = serverip;
	}

	public String getGeteway() {
		return geteway;
	}

	public void setGeteway(String geteway) {
		this.geteway = geteway;
	}

	public String getSnm() {
		return snm;
	}

	public void setSnm(String snm) {
		this.snm = snm;
	}

	public String getServerport() {
		return serverport;
	}

	public void setServerport(String serverport) {
		this.serverport = serverport;
	}

	public String getDeviceport() {
		return deviceport;
	}

	public void setDeviceport(String deviceport) {
		this.deviceport = deviceport;
	}

	public String getReporttime() {
		return reporttime;
	}

	public void setReporttime(String reporttime) {
		this.reporttime = reporttime;
	}

	public String getHearttime() {
		return hearttime;
	}

	public void setHearttime(String hearttime) {
		this.hearttime = hearttime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((deviceId == null) ? 0 : deviceId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Device_info other = (Device_info) obj;
		if (deviceId == null) {
			if (other.deviceId != null)
				return false;
		} else if (!deviceId.equals(other.deviceId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Device_info [id=" + id + ", deviceId=" + deviceId + ", devicestate=" + devicestate + ", devicename="
				+ devicename + ", registstate=" + registstate + ", tempnow=" + tempnow + ", tempmax=" + tempmax
				+ ", tempmin=" + tempmin + ", wetnow=" + wetnow + ", wetmax=" + wetmax + ", wetmin=" + wetmin + ", lat="
				+ lat + ", lng=" + lng + ", shake=" + shake + ", deviceip=" + deviceip + ", serverip=" + serverip
				+ ", geteway=" + geteway + ", snm=" + snm + ", serverport=" + serverport + ", deviceport=" + deviceport
				+ ", reporttime=" + reporttime + ", hearttime=" + hearttime + "]";
	}

}

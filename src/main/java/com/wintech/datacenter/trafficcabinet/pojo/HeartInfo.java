package com.wintech.datacenter.trafficcabinet.pojo;

import org.springframework.stereotype.Component;

/**
 * 心跳信息类
 * 
 * @author Administrator
 *
 */
@Component("heartInfo")
public class HeartInfo {
	private Integer id;
	private String deviceid;
	private Integer doorone;
	private Integer doortwo;
	private Integer camera;
	private String temp;
	private Integer lockstate;
	private String liquid;
	private Integer zhendong;
	private String type;
	private Integer level;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeviceid() {
		return deviceid;
	}

	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid == null ? null : deviceid.trim();
	}

	public Integer getDoorone() {
		return doorone;
	}

	public void setDoorone(Integer doorone) {
		this.doorone = doorone;
	}

	public Integer getDoortwo() {
		return doortwo;
	}

	public void setDoortwo(Integer doortwo) {
		this.doortwo = doortwo;
	}

	public Integer getCamera() {
		return camera;
	}

	public void setCamera(Integer camera) {
		this.camera = camera;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp == null ? null : temp.trim();
	}

	public Integer getLockstate() {
		return lockstate;
	}

	public void setLockstate(Integer lockstate) {
		this.lockstate = lockstate;
	}

	public String getLiquid() {
		return liquid;
	}

	public void setLiquid(String liquid) {
		this.liquid = liquid == null ? null : liquid.trim();
	}

	public Integer getZhendong() {
		return zhendong;
	}

	public void setZhendong(Integer zhendong) {
		this.zhendong = zhendong;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "HeartInfo [id=" + id + ", deviceid=" + deviceid + ", doorone=" + doorone + ", doortwo=" + doortwo
				+ ", camera=" + camera + ", temp=" + temp + ", lockstate=" + lockstate + ", liquid=" + liquid
				+ ", zhendong=" + zhendong + ", type=" + type + ", level=" + level + "]";
	}

}
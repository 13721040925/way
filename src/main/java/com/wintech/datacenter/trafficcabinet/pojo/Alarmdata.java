package com.wintech.datacenter.trafficcabinet.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

/**
 * 报警信息类
 * 
 * @author Administrator
 *
 */
@Component("alarmdata")
public class Alarmdata {
	private Integer id;// 报警消息id(目前未用)
	private String deviceid;// 机柜id
	private Integer doorone;// 门一状态
	private Integer doortwo;// 门二状态
	private Integer camera;// 摄像头状态
	private String tempstate;// 温度是否过高过低标志
	private String liquidstate;// 湿度是否过高过低标志
	private String temp;// 温度
	private Integer lockstate;// 解锁状态
	private String liquid;// 湿度
	private Integer zhendong;// 震动状态
	private String type;//
	private Integer level;//
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date alarmtime;//
	private String state;//
	private Integer power;// 电源状态

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

	public String getTempstate() {
		return tempstate;
	}

	public void setTempstate(String tempstate) {
		this.tempstate = tempstate == null ? null : tempstate.trim();
	}

	public String getLiquidstate() {
		return liquidstate;
	}

	public void setLiquidstate(String liquidstate) {
		this.liquidstate = liquidstate == null ? null : liquidstate.trim();
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

	public Date getAlarmtime() {
		return alarmtime;
	}

	public void setAlarmtime(Date alarmtime) {
		this.alarmtime = alarmtime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state == null ? null : state.trim();
	}

	public Integer getPower() {
		return power;
	}

	public void setPower(Integer power) {
		this.power = power;
	}

	@Override
	public String toString() {
		return "Alarmdata [id=" + id + ", deviceid=" + deviceid + ", doorone=" + doorone + ", doortwo=" + doortwo
				+ ", camera=" + camera + ", tempstate=" + tempstate + ", liquidstate=" + liquidstate + ", temp=" + temp
				+ ", lockstate=" + lockstate + ", liquid=" + liquid + ", zhendong=" + zhendong + ", type=" + type
				+ ", level=" + level + ", alarmtime=" + alarmtime + ", state=" + state + ", power=" + power + "]";
	}

}
package com.wintech.datacenter.trafficcabinet.pojo;

import org.springframework.stereotype.Component;

@Component("useractionlog")
public class Useractionlog {
	private Integer id;
	private String userid;
	private String message;
	private String time;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Useractionlog [id=" + id + ", userid=" + userid + ", message=" + message + ", time=" + time + "]";
	}

}

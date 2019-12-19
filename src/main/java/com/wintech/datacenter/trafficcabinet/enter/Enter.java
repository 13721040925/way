package com.wintech.datacenter.trafficcabinet.enter;

import com.wintech.datacenter.trafficcabinet.server.Driver;

public class Enter {

	public static void main(String[] args) {
		try {
			Class<?> driver = Class.forName("com.wintech.datacenter.trafficcabinet.server.Driver");
			Driver d = (Driver) driver.newInstance();
			d.start();
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

}

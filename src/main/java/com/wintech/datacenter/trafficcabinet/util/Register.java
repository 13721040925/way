package com.wintech.datacenter.trafficcabinet.util;

import java.net.Socket;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wintech.datacenter.trafficcabinet.pojo.Device_info;
import com.wintech.datacenter.trafficcabinet.service.Device_infoService;
import com.wintech.datacenter.trafficcabinet.util.JGThread.SendThread;

public class Register implements ThreadUtil {
	private ApplicationContext app = new ClassPathXmlApplicationContext("spring-config.xml");
	private boolean result = false;
	private byte[] bt;
	private Socket socket;

	public Register() {
	}

	public Register(byte[] b, Socket socket) {
		this.bt = b;
		this.socket = socket;
	}

	public int register(int bt) {

		if (bt < 0) {
			bt = bt + 256;
			return bt;
		} else {
			return bt;
		}

	}

	@Override
	public void run() {
		System.out.println("IG请求注册");
		Device_info device_info = app.getBean("device_info", Device_info.class);
		Device_infoService device_infoService = app.getBean("Device_infoService", Device_infoService.class);
		byte[] bt2 = new byte[1024];

		System.arraycopy(bt, 3, bt2, 0, 7);

		// 机柜ID
		String deviceid = new String(bt2);
		System.out.println(deviceid);
		Device_info device_info1 = device_infoService.getDevice_info(deviceid);
		System.out.println(device_info1);
		// 本机IP
		int a = (int) bt[10];
		int b = (int) bt[11];
		int c = (int) bt[12];
		int d = (int) bt[13];
		String deviceip = Integer.toString(register(a)) + "." + Integer.toString(register(b)) + "."
				+ Integer.toString(register(c)) + "." + Integer.toString(register(d));

		// 子网掩码
		int e = (int) bt[14];
		int f = (int) bt[15];
		int g = (int) bt[16];
		int h = (int) bt[17];
		String snm = Integer.toString(register(e)) + "." + Integer.toString(register(f)) + "."
				+ Integer.toString(register(g)) + "." + Integer.toString(register(h));

		// 网关
		int i = (int) bt[18];
		int j = (int) bt[19];
		int k = (int) bt[20];
		int l = (int) bt[21];

		String geteway = Integer.toString(register(i)) + "." + Integer.toString(register(j)) + "."
				+ Integer.toString(register(k)) + "." + Integer.toString(register(l));

		// 端口号
		int m = (int) bt[22];
		int n = (int) bt[23];

		String deviceport = Integer.toString(register(m)) + Integer.toString(register(n));

		// 服务器IP
		int o = (int) bt[24];
		int p = (int) bt[25];
		int q = (int) bt[26];
		int s = (int) bt[27];

		String serverip = Integer.toString(register(o)) + "." + Integer.toString(register(p)) + "."
				+ Integer.toString(register(q)) + "." + Integer.toString(register(s));

		// 服务器端口

		int t = (int) bt[28];
		int u = (int) bt[29];

		String serverport = Integer.toString(register(t)) + Integer.toString(register(u));

		device_info.setDeviceId(deviceid);
		device_info.setDeviceip(deviceip);
		device_info.setSnm(snm);
		device_info.setGeteway(geteway);
		device_info.setDeviceport(deviceport);
		device_info.setServerip(serverip);
		device_info.setServerport(serverport);
		// if (device_info1 != null) {
		device_info.setRegiststate("已注册");
		int x = device_infoService.updateDevice(device_info);
		if (x > 0) {
			System.out.println("注册成功");
			result = true;

		}
		SendThread sendThread = new SendThread(socket, bt, result);
		Thread th1 = new Thread(sendThread);
		th1.start();
	}

}

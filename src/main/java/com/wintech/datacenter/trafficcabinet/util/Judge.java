package com.wintech.datacenter.trafficcabinet.util;

import java.net.Socket;

public class Judge implements ThreadUtil {
	private byte[] bt;
	private Socket socket;

	public Judge() {
	}

	public Judge(byte[] b, Socket socket) {
		this.bt = b;
		this.socket = socket;
	}

	@Override
	public void run() {
		switch (bt[2]) {
		case 0x30: {
			ThreadUtil register = new Register(bt, socket);
			Thread th = new Thread(register, "注册");
			th.start();
			break;
		}
		case 0x33: {
			break;
		}
		case 0x43: {
			ThreadUtil heart = new Heart(bt, socket);
			Thread th = new Thread(heart, "心跳");
			th.start();
			break;
		}
		case 0x46: {
			break;
		}
		case 0x48: {
			break;
		}
		case 0x4A: {
			break;
		}
		case 0x4B: {
			ThreadUtil alarm = new Alarm(bt);
			Thread th = new Thread(alarm, "报警");
			th.start();
			break;
		}
		case 0x4F: {
			break;
		}
		}

	}

}

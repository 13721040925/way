package com.wintech.datacenter.trafficcabinet.util;

public class SendJude {
	private byte[] bt1;
	private boolean result;

	public SendJude() {
	}

	public SendJude(byte[] bt1, boolean result) {
		this.bt1 = bt1;
		this.result = result;
	}

	public byte[] mingling() {
		if (result) {
			switch (bt1[2]) {
			case 0x30: {
				byte[] bt = { (byte) 0xf7, (byte) 0x03, (byte) 0x31, (byte) 0x30, (byte) 0x5B };// 注册后服务器响应
				return bt;
			}
			case 0x33: {
				return null;
			}
			case 0x43: {
				byte[] bt = { (byte) 0xf7, (byte) 0x0c, (byte) 0x44, (byte) 0x31, (byte) 0x30, (byte) 0x30, (byte) 0x30,
						(byte) 0x30, (byte) 0x30, (byte) 0x31, (byte) 0x31, (byte) 0x38, (byte) 0x30, (byte) 0x36,
						(byte) 0x31, (byte) 0x31, (byte) 0x32, (byte) 0x31, (byte) 0x34, (byte) 0x37, (byte) 0x35,
						(byte) 0x36, (byte) 0x03, (byte) 0xf7, (byte) 0x0c, (byte) 0x44, (byte) 0x31, (byte) 0x30,
						(byte) 0x30, (byte) 0x30, (byte) 0x30, (byte) 0x30, (byte) 0x31, (byte) 0x31, (byte) 0x38,
						(byte) 0x30, (byte) 0x36, (byte) 0x31, (byte) 0x31, (byte) 0x32, (byte) 0x32, (byte) 0x32,
						(byte) 0x32, (byte) 0x33, (byte) 0x35, (byte) 0xfa };// 心跳包上来后服务器响应
				return bt;
			}
			case 0x46: {
				return null;
			}
			case 0x48: {
				return null;
			}
			case 0x4A: {
				return null;
			}
			case 0x4B: {
				return null;
			}
			case 0x4F: {
				return null;
			}
			}
		}
		return null;

	}

}

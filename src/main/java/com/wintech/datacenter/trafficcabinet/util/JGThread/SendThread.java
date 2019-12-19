package com.wintech.datacenter.trafficcabinet.util.JGThread;

import java.io.DataOutputStream;
import java.net.Socket;

import com.wintech.datacenter.trafficcabinet.util.SendJude;

public class SendThread implements Runnable {
	private DataOutputStream out;
	private Socket socket;
	private byte[] bt;
	private byte[] bt1;
	private boolean result;

	public SendThread(Socket socket, byte[] bt1, boolean result) {
		this.socket = socket;
		this.bt1 = bt1;
		this.result = result;
	}

	@Override
	public void run() {
		try {
			out = new DataOutputStream(socket.getOutputStream());
			SendJude sendJude = new SendJude(bt1, result);
			bt = sendJude.mingling();
			if (bt != null) {
				out.write(bt);// 输出信息
				out.flush();
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}
}

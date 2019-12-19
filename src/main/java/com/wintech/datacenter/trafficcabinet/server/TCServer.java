package com.wintech.datacenter.trafficcabinet.server;

import java.net.ServerSocket;
import java.net.Socket;

import com.wintech.datacenter.server.WTServer;
import com.wintech.datacenter.trafficcabinet.util.JGThread.ServerThread;

public class TCServer implements WTServer {
	private ServerSocket server;//

	@Override
	public void connect(int port) {
		try {
			server = new ServerSocket(port);
			System.out.println("服务器启动！");
			while (true) {
				Socket socket = server.accept();
				socket.getRemoteSocketAddress();
				ServerThread serverThread = new ServerThread(socket);
				Thread th = new Thread(serverThread);
				th.start();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package com.wintech.datacenter.trafficcabinet.server;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.wintech.datacenter.server.WTServer;

public class Driver {
	private Integer port;

	public void start() {
		InputStream in = null;
		try {
			Properties properties = new Properties();
			in = new FileInputStream("D:\\eclipsewokespace\\way\\src\\main\\resources\\JGServer.properties");
			properties.load(in);
			port = Integer.parseInt(properties.getProperty("port"));
			WTServer se = new TCServer();
			se.connect(port);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
			}
		}

	}

}

package com.wintech.datacenter.trafficcabinet.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.wintech.datacenter.trafficcabinet.pojo.User;

public class LockHelper {
	static Map<String, HttpSession> map = new HashMap<String, HttpSession>();

	public static void putSession(HttpSession session) {
		User user = (User) session.getAttribute("USER_LOGIN");
		map.put(user.getUserid(), session);
	}

	public static void moveSession(HttpSession session) {
		User user = (User) session.getAttribute("USER_LOGIN");
		map.remove(user.getUserid());
	}

	public static void destroyedSession(User user) {
		HttpSession session = map.get(user.getUserid());
		session.invalidate();
	}
}

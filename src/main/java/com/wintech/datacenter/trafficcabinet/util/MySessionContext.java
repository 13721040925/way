package com.wintech.datacenter.trafficcabinet.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class MySessionContext {
	private static HashMap<String, HttpSession> mymap = new HashMap<String, HttpSession>();

	public static synchronized Map<String, HttpSession> AddSession(HttpSession session) {
		if (session != null) {
			mymap.put(session.getId(), session);
		}
		return mymap;
	}

	public static synchronized Map<String, HttpSession> DelSession(HttpSession session) {
		if (session != null) {
			mymap.remove(session.getId());
		}
		return mymap;
	}

	public static synchronized HttpSession getSession(String sessionid) {
		if (sessionid == null) {
			return null;
		}
		return mymap.get(sessionid);
	}

}

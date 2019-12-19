package com.wintech.datacenter.trafficcabinet.util;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wintech.datacenter.trafficcabinet.pojo.Alarmdata;
import com.wintech.datacenter.trafficcabinet.service.AlarmdataService;

public class Alarm implements ThreadUtil {
	private ApplicationContext app = new ClassPathXmlApplicationContext("spring-config.xml");
	private byte[] bt;

	public Alarm() {
	}

	public Alarm(byte[] b) {
		this.bt = b;
	}

	@Override
	public void run() {
		System.out.println("IG向IC上报紧急事件");
		Alarmdata alarmdata = new Alarmdata();// app.getBean("alarmdata", Alarmdata.class);
		byte[] bt2 = new byte[1024];
		System.arraycopy(bt, 3, bt2, 0, 7);
		String bianhao = new String(bt2);// 机柜节点编号
		Integer door1 = ((bt[10] & 0x01) != 0) ? 1 : 0; // "门1关闭" : "门1打开";
		Integer door2 = ((bt[10] & 0x02) != 0) ? 1 : 0;// "门2关闭" : "门2打开";
		Integer zhengDong = ((bt[10] & 0x04) != 0) ? 1 : 0; // "震动状态：正常" : "震动状态：有震动";
		Integer SheXiangTou = ((bt[10] & 0x08) != 0) ? 1 : 0; // "摄像头状态：打开" : "摄像头状态：关闭";
		Integer Jiesuo = ((bt[10] & 0x10) != 0) ? 1 : 0; // "解锁状态：解锁中" : "解锁状态：正常工作";
		Integer DianYuan = ((bt[10] & 0x20) != 0) ? 1 : 0; // "电源状态：掉电" : "电源状态：供电正常";
		alarmdata.setDeviceid(bianhao);
		alarmdata.setDoorone(door1);
		alarmdata.setDoortwo(door2);
		alarmdata.setCamera(SheXiangTou);
		alarmdata.setLockstate(Jiesuo);
		alarmdata.setZhendong(zhengDong);
		alarmdata.setPower(DianYuan);
		alarmdata.setAlarmtime(DateUtil.convertUtilDateToTimeStamp(new Date()));
		System.out.println(alarmdata);
		AlarmdataService alarmdataService = app.getBean("alarmdataService", AlarmdataService.class);
		int i = alarmdataService.addAlarmdata(alarmdata);
		if (i > 0) {
			System.out.println("添加报警信息成功！");
		}

	}

}

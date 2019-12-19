package com.wintech.datacenter.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.wintech.datacenter.trafficcabinet.pojo.Alarmdata;
import com.wintech.datacenter.trafficcabinet.pojo.Device_info;
import com.wintech.datacenter.trafficcabinet.pojo.User;
import com.wintech.datacenter.trafficcabinet.pojo.Useractionlog;
import com.wintech.datacenter.trafficcabinet.service.AlarmdataService;
import com.wintech.datacenter.trafficcabinet.service.Device_infoService;
import com.wintech.datacenter.trafficcabinet.service.LogService;
import com.wintech.datacenter.trafficcabinet.service.UserService;
import com.wintech.datacenter.trafficcabinet.util.ExcelUtil;
import com.wintech.datacenter.trafficcabinet.util.FileUpAndDownload;
import com.wintech.datacenter.trafficcabinet.util.MySessionContext;
import com.wintech.datacenter.trafficcabinet.util.Page;

@Controller
@RequestMapping("/user")
public class MyController {
	@Resource
	private UserService userService;
	@Resource
	private Device_infoService doService;
	@Resource
	private LogService logService;
	@Resource
	private AlarmdataService alarmdataService;
	// 文件上传的绝对路径
	/* public static final String PATH = "E:/FileUploadExcal"; */
	@Resource
	private ExcelUtil excelUtil;
	@Resource
	private FileUpAndDownload fileUpAndDownload;

	@RequestMapping("/login")
	@SuppressWarnings("unused") // 屏蔽一些警告
	public String login(Model md, User user, String phone, HttpServletResponse reponse, HttpServletRequest request,
			@RequestParam(name = "password", required = false, defaultValue = "") String password,
			@RequestParam(name = "userid", required = false, defaultValue = "") String userid) {
		phone = userService.phoneshow(user);// 获取手机号
		userService.updateStateLogin(user);// 修改在线状态
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String logintime = df.format(new Date());// new Date()为获取当前系统时间
		// System.out.println(logintime);
		userService.updateTime(logintime, userid, password);// 修改登录时间
		// List<User> list=new ArrayList<User>();
		User u = userService.login(user);
		System.out.println(u);
		HttpSession session = request.getSession();
		System.out.println(session + "----------");
		HashMap<String, HttpSession> mymap = new HashMap<String, HttpSession>();
		session.setMaxInactiveInterval(-1);// 设置session超时时间 秒 时间内的 sessionid不变
		// HttpSession session1 = request.getSession();
		// session1.setMaxInactiveInterval(5);
		// session1.setAttribute("GG", "公告");
		if (u != null) {
			Useractionlog log = new Useractionlog();
			String message = "登录账号";
			log.setTime(logintime);
			log.setUserid(u.getUserid());
			log.setMessage(message);
			// System.out.println(log);
			logService.addLog(log);// 添加日志信息
			// md.addAttribute("USER_LOGIN", user);
			String phone1 = phone.substring(0, 3) + "****" + phone.substring(7, 11);// 156****0592
			session.setAttribute("USER_LOGIN", u);// 登录的user对象
			session.setAttribute("PHONE", phone1);// 加密过后的手机号
			session.setAttribute("PHONE1", phone);// 手机号
			session.setAttribute("LOG", log);
			// System.out.println("+++++++" + new Date(session.getCreationTime()));//
			mymap = (HashMap<String, HttpSession>) MySessionContext.AddSession(session);
			System.out.println("map:" + mymap);
			HttpSession oldSession = mymap.get(session.getId());
			System.out.println(oldSession);
			if (session != oldSession) {
				return "redirect:/user/logout1";
			}
			return "redirect:/user/device_manage";
		}
		session.setAttribute("ERROR", "错误的用户名或密码");
		return "redirect:/jsp/login1.jsp";// 不是逻辑视图名
	}

	// 到添加用户
	@RequestMapping("/toaddUser")
	public String toaddUser(User user, HttpServletResponse reponse, HttpServletRequest request) {
		return "addUser"; /// WEB-INF/pages/addUser.jsp
	}

	// 添加用户
	@RequestMapping("/doaddUser")
	public String addUser(User user, HttpServletResponse reponse, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (request.getSession(false) == null) {
			return "redirect:/user/logout1";
		}
		int i = userService.addUser(user);
		if (i > 0) {
			session.setAttribute("ADD", "已添加");
			System.out.println(i + "iIIIIII");
			// 添加日志
			user = (User) session.getAttribute("USER_LOGIN");
			Useractionlog log = new Useractionlog();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String nowtime = df.format(new Date());// new Date()为获取当前系统时间
			log.setTime(nowtime);
			log.setUserid(user.getUserid());
			log.setMessage("添加用户");
			logService.addLog(log);// 添加日志信息
			return "user_info";
		} else {
			session.setAttribute("Adds", "失败");
			return "user_info";
		}
	}

	// 用户信息user_info
	@RequestMapping("/user_info")
	public ModelAndView user_info(ModelAndView md, HttpServletResponse reponse, HttpServletRequest request,
			@RequestParam(name = "pageNum", required = false, defaultValue = "0") Integer pageNum,
			@RequestParam(name = "userid", required = false, defaultValue = "") String userid) {
		HttpSession session = request.getSession();
		session.removeAttribute("ADD");
		session.removeAttribute("Adds");
		session.removeAttribute("DEL");
		User user = (User) session.getAttribute("USER_LOGIN");
		int role = user.getRole();
		if (role == 1) {
			// 添加日志
			Useractionlog log = new Useractionlog();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String nowtime = df.format(new Date());// new Date()为获取当前系统时间
			log.setTime(nowtime);
			log.setUserid(user.getUserid());
			log.setMessage("查看用户信息");
			logService.addLog(log);// 添加日志信息
			Page<User> page = new Page<User>();
			int totalCount = userService.totalCount(userid);
			// System.out.println(totalCount);
			page.init(totalCount, pageNum);
			List<User> list = userService.getAllPageUser(page.getRowNum(), Page.pageCount, userid);
			page.setList(list);
			System.out.println(page);
			md.addObject("page", page);
			md.setViewName("user_info");
			return md;
		} else {
			session.setAttribute("ERROR", "很抱歉~您没有权限！");
			Useractionlog log = new Useractionlog();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String nowtime = df.format(new Date());// new Date()为获取当前系统时间
			log.setTime(nowtime);
			log.setUserid(user.getUserid());
			log.setMessage("被拒绝查看用户信息");
			logService.addLog(log);// 添加日志信息
			md.setViewName("user_info");
			return md;
		}
	}

	// 用户删除 deleteUser
	@RequestMapping("/deleteUser")
	public String deleteUser(String userid, HttpServletRequest request) {
		// 添加日志
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_LOGIN");
		Useractionlog log = new Useractionlog();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String nowtime = df.format(new Date());// new Date()为获取当前系统时间
		log.setTime(nowtime);
		log.setUserid(user.getUserid());
		log.setMessage("删除用户");
		logService.addLog(log);// 添加日志信息
		userService.deleteUser(userid);
		session.setAttribute("DEL", "已删除");
		return "user_info";
	}

	// 用户批量删除
	@RequestMapping("/delSelected")
	public String delSelected(@RequestParam(name = "arr", required = false, defaultValue = "") String arr,
			HttpServletRequest request) {
		if (request.getSession(false) == null) {
			return "redirect:/user/logout1";
		}
		// 添加日志
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_LOGIN");
		Useractionlog log = new Useractionlog();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String nowtime = df.format(new Date());// new Date()为获取当前系统时间
		log.setTime(nowtime);
		log.setUserid(user.getUserid());
		log.setMessage("批量删除用户");
		logService.addLog(log);// 添加日志信息
		// System.out.println(arr);// 1,2,3 id的序号
		String[] id = arr.split(",");
		userService.delSelected(id);
		return "redirect:/user/user_info";
	}

	// user/log
	@RequestMapping("/log")
	public ModelAndView log(ModelAndView md, HttpServletRequest request,
			@RequestParam(name = "pageNum", required = false, defaultValue = "0") Integer pageNum,
			@RequestParam(name = "userid", required = false, defaultValue = "") String userid,
			@RequestParam(name = "timemin", required = false, defaultValue = "") String timemin,
			@RequestParam(name = "timemax", required = false, defaultValue = "") String timemax) {
		// HttpSession session = request.getSession();
		// User user = (User) session.getAttribute("USER_LOGIN");
		/* int id = logService.getMaxId(); */
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_LOGIN");
		if (user.getRole() == 1) {
			Page<Useractionlog> page = new Page<Useractionlog>();
			int totalCount = logService.getMaxId();
			page.init(totalCount, pageNum);
			System.out.println("+++++" + timemin);
			System.out.println("-----" + timemax);
			List<Useractionlog> list = logService.getAllPageLog(page.getRowNum(), Page.pageCount, timemin, timemax,
					userid);
			page.setList(list);
			// List<Useractionlog> list = logService.getAlllog();
			md.addObject("page", page);
			md.setViewName("log");
			// 添加日志
			Useractionlog log = new Useractionlog();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String nowtime = df.format(new Date());// new Date()为获取当前系统时间
			log.setTime(nowtime);
			log.setUserid(user.getUserid());
			log.setMessage("查看日志");
			logService.addLog(log);// 添加日志信息
			return md;
		} else {
			session.setAttribute("ERROR", "很抱歉~您没有权限！");
			Useractionlog log = new Useractionlog();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String nowtime = df.format(new Date());// new Date()为获取当前系统时间
			log.setTime(nowtime);
			log.setUserid(user.getUserid());
			log.setMessage("被拒绝查看日志");
			logService.addLog(log);// 添加日志信息
			md.setViewName("log");
			return md;
		}
	}

	// 到alert.jsp
	@RequestMapping("/alert")
	public ModelAndView alert(ModelAndView md, HttpServletRequest request,
			@RequestParam(name = "pageNum", required = false, defaultValue = "0") Integer pageNum,
			@RequestParam(name = "deviceid", required = false, defaultValue = "") String deviceid,
			@RequestParam(name = "timemin", required = false, defaultValue = "") String timemin,
			@RequestParam(name = "timemax", required = false, defaultValue = "") String timemax) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_LOGIN");
		if (user.getRole() == 1) {
			Page<Alarmdata> page = new Page<Alarmdata>();
			int totalCount = alarmdataService.getMaxId();
			System.out.println(totalCount);
			page.init(totalCount, pageNum);
			System.out.println("+++++" + timemin);
			System.out.println("-----" + timemax);
			List<Alarmdata> list = alarmdataService.gePageAlarmdata(page.getRowNum(), Page.pageCount, timemin, timemax,
					deviceid);
			page.setList(list);
			md.addObject("page", page);
			md.setViewName("alert");
			// 添加日志
			Useractionlog log = new Useractionlog();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String nowtime = df.format(new Date());// new Date()为获取当前系统时间
			log.setTime(nowtime);
			log.setUserid(user.getUserid());
			log.setMessage("查看报警信息");
			logService.addLog(log);// 添加日志信息
			return md;
		} else {
			session.setAttribute("ERROR", "很抱歉~您没有权限！");
			Useractionlog log = new Useractionlog();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String nowtime = df.format(new Date());// new Date()为获取当前系统时间
			log.setTime(nowtime);
			log.setUserid(user.getUserid());
			log.setMessage("被拒绝查看报警信息");
			logService.addLog(log);// 添加日志信息
			md.setViewName("alert");
			return md;
		}
	}

	// 导出excal
	@RequestMapping("/checkOutxls")
	public void checkOutxls(@RequestParam(name = "arr", required = false, defaultValue = "") String arr,
			HttpServletRequest request, HttpServletResponse response) {
		// 1、文件叫啥名称
		String fileName = "用户表.xls";
		// 2、存放的路径是啥
		ServletContext application = request.getServletContext();
		String path = application.getRealPath("excel");
		// path = D:/Tomcat8.5/java52smsm/excel/jtTSDslsuser.xlsx
		path += File.separator + fileName;
		String id[] = {};
		try {
			id = arr.split(",");
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<User> list = userService.getUsers(id);
		// 3、执行上传excel
		excelUtil.createExcel(User.class, list, path);
		// 4、执行下载
		fileUpAndDownload.download(request, response, fileName, path);
		// 添加日志
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_LOGIN");
		Useractionlog log = new Useractionlog();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String nowtime = df.format(new Date());// new Date()为获取当前系统时间
		log.setTime(nowtime);
		log.setUserid(user.getUserid());
		log.setMessage("到出Excal");
		logService.addLog(log);// 添加日志信息
	}

	// 到device_manage.jsp
	@RequestMapping("/device_manage")
	public ModelAndView device_manage(ModelAndView md, HttpServletResponse reponse, HttpServletRequest request,
			@RequestParam(name = "pageNum", required = false, defaultValue = "0") Integer pageNum,
			@RequestParam(name = "deviceId", required = false, defaultValue = "") String deviceId) {
		/* List<Device_info> DeviceList=doService.getDevice(); */
		/* System.out.println(DeviceList); */
		// 添加日志
		HttpSession session = request.getSession();
		session.removeAttribute("i");
		User user = (User) session.getAttribute("USER_LOGIN");
		Useractionlog log = new Useractionlog();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String nowtime = df.format(new Date());// new Date()为获取当前系统时间
		log.setTime(nowtime);
		log.setUserid(user.getUserid());
		log.setMessage("查看机柜管理");
		logService.addLog(log);// 添加日志信息
		// 分页
		Page<Device_info> page = new Page<Device_info>();
		int totalCount = doService.totalCount(deviceId);
		System.out.println(totalCount);
		page.init(totalCount, pageNum);
		List<Device_info> list = doService.getPageDevice(page.getRowNum(), Page.pageCount, deviceId);
		page.setList(list);
		System.out.println(page);
		md.addObject("page", page);
		md.setViewName("device_manage");
		return md;
	}

	// 从device_manage 到info
	@RequestMapping("/device_info1")
	// @SuppressWarnings("unused")
	public ModelAndView device_info1(ModelAndView md, HttpServletResponse reponse, HttpServletRequest request,
			String deviceId) {
		// 添加日志
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_LOGIN");
		Useractionlog log = new Useractionlog();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String nowtime = df.format(new Date());// new Date()为获取当前系统时间
		log.setTime(nowtime);
		log.setUserid(user.getUserid());
		log.setMessage("查看机柜信息");
		logService.addLog(log);// 添加日志信息
		Device_info device = new Device_info();
		device = doService.getDevice_info(deviceId);
		System.out.println(device);
		md.addObject("device", device);
		md.setViewName("device_info");
		return md;
	}

	// 添加机柜
	@RequestMapping("/addDevice")
	public String addDevice(Device_info device_info, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int i = 0;
		i = doService.addDevice(device_info);
		if (i > 0) {
			session.setAttribute("i", "已添加");
		}
		return "device_manage";
	}

	// 修改设备信息
	@RequestMapping("/updateDevice")
	public String updateDevice(Device_info device_info, ModelAndView md, HttpServletRequest request
	// ,@RequestParam(name = "deviceId", required = false, defaultValue = "") String
	// deviceId,
	// @RequestParam(name = "lng", required = false, defaultValue = "") String lng,
	// @RequestParam(name = "lat", required = false, defaultValue = "") String lat,
	// @RequestParam(name = "deviceip", required = false, defaultValue = "") String
	// deviceip,
	// @RequestParam(name = "snm", required = false, defaultValue = "") String snm,
	// @RequestParam(name = "deviceport", required = false, defaultValue = "")
	// String deviceport,
	// @RequestParam(name = "geteway", required = false, defaultValue = "") String
	// geteway,
	// @RequestParam(name = "reporttime", required = false, defaultValue = "")
	// String reporttime,
	// @RequestParam(name = "hearttime", required = false, defaultValue = "") String
	// hearttime
	) {
		// System.out.println(device_info);
		/*
		 * device_info.setdeviceId(deviceId); device_info.setLat(lat);
		 * device_info.setLng(lng); device_info.setDeviceip(deviceip);
		 * device_info.setSnm(snm); device_info.setDeviceport(deviceport);
		 * device_info.setGeteway(geteway); device_info.setReporttime(reporttime);
		 * device_info.setHearttime(hearttime); System.out.println(device_info);
		 */
		if (request.getSession(false) == null) {
			return "redirect:/user/logout1";
		}
		// 添加日志
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_LOGIN");
		Useractionlog log = new Useractionlog();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String nowtime = df.format(new Date());// new Date()为获取当前系统时间
		log.setTime(nowtime);
		log.setUserid(user.getUserid());
		log.setMessage("修改机柜信息");
		logService.addLog(log);// 添加日志信息
		doService.updateDevice(device_info);
		// request.setAttribute(deviceId, deviceId);
		return "redirect:/user/device_manage";

	}

	// 退出
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, User user) {
		HttpSession session = request.getSession();
		user = (User) session.getAttribute("USER_LOGIN");
		userService.updateStateLogout(user);
		System.out.println(user);
		if (user == null) {
			return "redirect:/jsp/login1.jsp";
		}
		String userid = user.getUserid();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String logouttime = df.format(new Date());
		System.out.println("+++++++++" + userid);
		userService.updateTimes(logouttime, userid);
		Useractionlog log = new Useractionlog();
		log.setTime(logouttime);
		log.setUserid(user.getUserid());
		log.setMessage("退出登录");
		logService.addLog(log);// 添加日志信息
		return "redirect:/jsp/login1.jsp";
	}

	// 超时退出
	@RequestMapping("/logout1")
	public String logout1(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("ERR", "登录超时");
		return "redirect:/jsp/login1.jsp";// 不是逻辑视图名
	}

	// 到map.jsp
	@RequestMapping("/map")
	public String map(HttpServletRequest request) {
		if (request.getSession(false) == null) {
			return "redirect:/user/logout1";
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_LOGIN");
		Useractionlog log = new Useractionlog();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String nowtime = df.format(new Date());// new Date()为获取当前系统时间
		log.setTime(nowtime);
		log.setUserid(user.getUserid());
		log.setMessage("查看地图");
		logService.addLog(log);// 添加日志信息
		return "map";
	}

	// 到device_info.jsp
	@RequestMapping("/device_info")
	public String device_info() {
		return "device_info";
	}

	// 到forgetPass.jsp
	@RequestMapping("/forgetPass")
	public String forgetPass() {
		return "forgetPass";
	}

	// 到doforgetPass.jsp
	@RequestMapping("/doforgetPass")
	public String doforgetPass() {
		return "doforgetPass";
	}

	// 修改密码
	@RequestMapping("/updatePass")
	public String updatePass(String password, String userid) {
		System.out.println(password + "," + userid);
		userService.updatePass(password, userid);
		return "redirect:/jsp/login1.jsp";
	}

	/**
	 * 验证机柜名称是否存在
	 * 
	 * @param deviceId
	 * @return
	 */
	@RequestMapping(value = "/veriftdeviceId", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String veriftdeviceId(String deviceId) {
		Device_info device_info = doService.getDevice_info(deviceId);
		if (device_info != null) {
			return JSON.toJSONString(deviceId);
		}
		return null;
	}

	/**
	 * 验证账号veriftUserid是否存在
	 * 
	 * @param request
	 * @param response
	 * @param userid
	 * @return
	 */
	@RequestMapping(value = "/veriftUserid", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String veriftUserid(HttpServletRequest request, HttpServletResponse response, String userid) {
		User u = userService.verift(userid);
		System.out.println(u);// null
		if (u != null) {
			return JSON.toJSONString(userid);
		}
		return null;
	}

	/**
	 * 验证手机号是否正确
	 * 
	 * @param userid
	 * @param phone
	 * @return
	 */
	@RequestMapping(value = "/veriftPhone", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String veriftPhone(String userid, String phone) {
		User u = userService.verift(userid);
		System.out.println(phone);
		String phone1 = u.getPhone();
		System.out.println(phone1);
		if (phone.equals(phone1)) {
			return JSON.toJSONString(phone);
		}
		return null;
	}

	/**
	 * 发送短信验证码
	 * 
	 * @param number接收手机号码
	 */
	// @RequestMapping(value = "/sendSms", produces =
	// "application/json;charset=utf-8")
	// @ResponseBody
	// public String sendSms(HttpServletRequest request, HttpServletResponse
	// response, String number) {
	// try {
	// JSONObject json = null;
	// // 生成6位验证码
	// String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
	// System.out.println("验证码是:" + verifyCode);
	// // 发送短信
	// ZhenziSmsClient client = new
	// ZhenziSmsClient("https://sms_developer.zhenzikj.com", "100243",
	// "ZmFkYTQ2ODQtODMxYi00MTlkLTk5ZWUtY2M1MjhjNTlmYTIx");
	// String result = client.send(number, "您的验证码为:" + verifyCode +
	// "，该码有效期为5分钟，该码只能使用一次！【短信签名】");
	// // System.out.println(result+"1");
	// json = JSONObject.parseObject(result);//
	// System.out.println(json + "---------");
	// // System.out.println(json.getIntValue("code"));
	// if (json.getIntValue("code") != 0) {// 发送短信失败
	// return null;
	// }
	// // 将验证码存到session中,同时存入创建时间
	// // 以json存放，这里使用的是阿里的fastjson
	// HttpSession session = request.getSession();
	// json = new JSONObject();
	// json.put("verifyCode", verifyCode);
	// json.put("createTime", System.currentTimeMillis());
	// /* String str=JSON.stringify(json); */
	// // 将认证码存入SESSION
	// session.setAttribute("verifyCode", json);
	// System.out.println(json);// 验证码，和发送的时间(createTime)
	// return JSON.toJSONString(json);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// return null;
	// }

	/**
	 * 判断验证码
	 */
	@RequestMapping(value = "/register", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String register(HttpServletRequest request,
			@RequestParam(name = "number", required = false, defaultValue = "0") Integer number,
			@RequestParam(name = "verifyCode", required = false, defaultValue = "0") Integer verifyCode) {
		JSONObject json = (JSONObject) request.getSession().getAttribute("verifyCode");
		// int yzm=json.getIntValue("verifyCode");//定义验证码

		// System.out.println("验证码是:" + json.getString("verifyCode"));
		// System.out.println("你输入的是:" + verifyCode);
		// if (!json.getString("verifyCode").equals(verifyCode)) {
		// System.out.println("验证码错误");
		// return "error";
		// }
		if ((System.currentTimeMillis() - json.getLong("createTime")) > 1000 * 60) {// 60秒过期
			return JSON.toJSONString("验证码过期");
		}
		if (!verifyCode.equals("")) {
			return JSON.toJSONString(json);
		}
		return null;
	}

	/**
	 * 获取手机号
	 */
	@RequestMapping(value = "/phone", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String phone(HttpServletRequest request, String number) {
		HttpSession session = request.getSession();
		String phone = (String) session.getAttribute("PHONE1");
		System.out.println(phone);
		return phone;
	}

	/**
	 * 判断在线情况
	 */
	@RequestMapping(value = "/state", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String state(HttpServletRequest request,
			@RequestParam(name = "userid", required = false, defaultValue = "") String userid,
			@RequestParam(name = "password", required = false, defaultValue = "") String password) {
		// HttpSession session = request.getSession();
		User u1 = new User();
		u1.setUserid(userid);
		u1.setPassword(password);
		u1 = userService.login(u1);
		System.out.println(u1);
		if (u1 != null) {
			Integer state = u1.getState();
			System.out.println(state);
			return state.toString();
		} else {
			Integer state = 0;
			return state.toString();
		}
	}

}

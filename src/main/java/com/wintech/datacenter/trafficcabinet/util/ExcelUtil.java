package com.wintech.datacenter.trafficcabinet.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

import com.wintech.datacenter.trafficcabinet.pojo.User;

//读写excel的工具类
@Component("excelUtil")
public class ExcelUtil {

	// 把list中的user对象读出来，写到excel中
	public static int creatUserExcel(List<User> list, String path) {
		// 1、指定目标文件
		File target = new File(path);
		OutputStream out = null;
		XSSFWorkbook book = null;
		try {
			out = new FileOutputStream(target);
			// 2、创建工作簿
			book = new XSSFWorkbook();
			// 3、创建工作簿中的页，指定页的名称
			XSSFSheet sheet = book.createSheet("userInfo");
			// 4、创建行
			int rowNum = 0;
			XSSFRow row = sheet.createRow(rowNum++);
			// 5、创第一行的单元格并设置值
			int coulumNum = 0;
			row.createCell(coulumNum++).setCellValue("序号");
			row.createCell(coulumNum++).setCellValue("用户名");
			row.createCell(coulumNum++).setCellValue("用户密码");
			row.createCell(coulumNum++).setCellValue("手机号");
			row.createCell(coulumNum++).setCellValue("登录时间");
			row.createCell(coulumNum++).setCellValue("退出时间");
			row.createCell(coulumNum++).setCellValue("权限");
			row.createCell(coulumNum++).setCellValue("状态");
			// 6、循环输出user对象
			for (int i = 0; i < list.size(); i++) {
				User st = list.get(i);
				coulumNum = 0;
				row = sheet.createRow(rowNum++);
				row.createCell(coulumNum++).setCellValue(st.getId());
				row.createCell(coulumNum++).setCellValue(st.getUserid());
				row.createCell(coulumNum++).setCellValue(st.getPassword());
				row.createCell(coulumNum++).setCellValue(st.getPhone());
				row.createCell(coulumNum++).setCellValue(DateUtil.convertUtilDateToString(st.getLogintime()));
				row.createCell(coulumNum++).setCellValue(DateUtil.convertUtilDateToString(st.getLogouttime()));
				row.createCell(coulumNum++).setCellValue(st.getRole() == 1 ? "管理员" : "用户");
				row.createCell(coulumNum++).setCellValue(st.getState() == 1 ? "在线" : "离线");

			}
			// 7、保存文件
			book.write(out);
			System.out.println("创建表成功");
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 8、关闭流
			if (book != null) {
				try {
					book.close();
				} catch (Exception e) {
				}
			}
		}
		return 0;
	}

	// 通用的创建excel表的方法
	public <T> int createExcel(Class<T> clazz, List<T> list, String path) {
		OutputStream out = null;
		XSSFWorkbook book = null;
		try {
			// 1、指定目标文件
			File target = new File(path);
			out = new FileOutputStream(target);
			// 2、创建工作簿
			book = new XSSFWorkbook();
			// 3、创建工作簿中的页，指定页的名称
			XSSFSheet sheet = book.createSheet(clazz.getSimpleName() + "Info");
			// 4、创建第1行
			int rowNum = 0;
			XSSFRow row = sheet.createRow(rowNum++);
			Field[] field = clazz.getDeclaredFields();
			// 从1开始把序列号属性去除
			for (int i = 1; i < field.length; i++) {
				String name = field[i].getName();
				row.createCell(i).setCellValue(name);
			}
			// 5、遍历集合，拼接下一行
			for (int i = 0; i < list.size(); i++) {
				// 创建下一行
				row = sheet.createRow(rowNum++);
				// 遍历所有的属性
				for (int j = 1; j < field.length; j++) {
					// 获得属性的名称
					String name = field[j].getName();
					// 把属性名首字母转大写
					name = Commons.upperCaseFirstChar(name);
					// 获得集合的元素对象
					T t = list.get(i);
					// 执行当前类的方法get方法
					Method mt = clazz.getDeclaredMethod("get" + name);
					// 获得当前getter方法的返回值类型
					Class<?> cl = mt.getReturnType();
					// 判断返回值类型，对单元格进行设置值
					String type = cl.getSimpleName();
					System.out.println(type);
					if (type.equals("String")) {
						if (mt.invoke(t) == null) {
							row.createCell(j).setCellValue("");
						} else {
							String obj = (String) (mt.invoke(t));
							row.createCell(j).setCellValue(obj);
						}
					} else if (type.equals("Long")) {
						if (mt.invoke(t) == null) {
							row.createCell(j).setCellValue("");
						} else {
							Long obj = (Long) (mt.invoke(t));
							row.createCell(j).setCellValue(obj);
						}
					} else if (type.equals("Integer")) {
						if (mt.invoke(t) == null) {
							row.createCell(j).setCellValue("");
						} else {
							Integer obj = (Integer) (mt.invoke(t));
							row.createCell(j).setCellValue(obj);
						}
					} else if (type.equals("Date")) {
						if (mt.invoke(t) == null) {
							row.createCell(j).setCellValue("");
						} else {
							Date obj = (Date) (mt.invoke(t));
							row.createCell(j).setCellValue(obj);
						}
					} else {
						// 除此之外全部设置空
						row.createCell(j).setCellValue("");
					}
				}
			}
			// 6、保存文件
			book.write(out);
			System.out.println("创建表成功");
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 7、关闭流
			if (book != null) {
				try {
					book.close();
				} catch (Exception e) {
				}
			}
		}
		return 0;
	}

}

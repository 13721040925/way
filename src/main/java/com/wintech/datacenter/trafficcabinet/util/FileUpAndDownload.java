package com.wintech.datacenter.trafficcabinet.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component("fileUpAndDownload")
public final class FileUpAndDownload {
	// 下载方法
	public Boolean download(HttpServletRequest request, HttpServletResponse response, String fileName, String path) {
		// 1、构建流的对象
		InputStream is = null;
		OutputStream out = null;
		// 2、设置响应头
		try {
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 3、设置响应的数据类型
		response.setContentType("multipart/form-data");
		// 4、边读边写
		byte[] bt = new byte[1024];
		int len;
		try {
			is = new FileInputStream(path);
			out = response.getOutputStream();
			while ((len = is.read(bt)) != -1) {
				out.write(bt, 0, len);
			}
			out.flush();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5、关闭资源
			if (out != null) {
				try {
					out.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (is != null) {
				try {
					is.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 6、删除源文件
			new File(path).delete();
		}
		return false;
	}
}

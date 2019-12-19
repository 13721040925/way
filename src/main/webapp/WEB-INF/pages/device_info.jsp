<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8"> 
<link rel="icon" href="img/1.png" type="image/x-icon">
<title>道路机柜管理系统</title>
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <script type="text/javascript" SRC="bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" ></script>
    <link href="bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css" rel="stylesheet" >
	<link rel="stylesheet" href="bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="css/style.css"> 
	<script type="text/javascript" src="js/device_info.js"></script>   
    <link rel="stylesheet" href="css/device_info.css">
    <link rel="stylesheet" type="text/css" href="css/zeroModal.css" />
    <script src="js/zeroModal.min.js"></script>
    <script type="text/javascript">
    </script>   
</head>
<body>
	<div class="navbar navbar-inverse" style="background-color: rgb(33, 71, 97); ">
           <div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-primary " id="option4">
			    <input type="radio" name="options"  autocomplete="off" > 设备管理
			  </label>
			  <label class="btn btn-primary" id="option1">
			    <input type="radio" name="options" autocomplete="off" > 报&nbsp;警  
			  </label>
			  <label class="btn btn-primary " id="option2">
			    <input type="radio" name="options"  autocomplete="off"> 日&nbsp;志
			  </label>
			  <label class="btn btn-primary" id="option3">
			    <input type="radio" name="options"  autocomplete="off"> 用户管理
			  </label>
			  <label class="btn btn-primary active" id="option">  
			    <input type="radio" name="options"  autocomplete="off" checked> 设备信息 
			  </label>
			  <label class="btn btn-primary" id="option5">
			    <input type="radio" name="options"  autocomplete="off"> 地图信息
			  </label>
		 </div>
		 <button type="button" class="btn btn-primary" data-backdrop="static" data-keyboard="false" data-toggle="modal" id="logout" data-target="#myModal">退&nbsp;出</button>
		 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document"> 
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">机柜系统</h4>
		      </div>
		      <div class="modal-body">
		        确定要退出该账号吗？
		      </div> 
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary"  data-dismiss="modal" id="logout1">确定</button>
		      </div>
		    </div>
		  </div>
		</div>
    </div>
    <form action="user/updateDevice" method="post">
     <div class="box">
    	<div class="page-header">
		    <h1>机柜系统 
		        <small>设备信息</small>
		    </h1>
		</div>
		<div></div>
		<div class="form-inline">
			<div class="form-group"> 
			    <label for="exampleInputName2">机柜名称</label>
			    <input type="text" class="form-control" id="devicename" name="devicename" placeholder="机柜名称" value="${device.devicename}"> 
			</div>
			<span id="span"></span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label for="exampleInputEmail2">机柜ID</label> 
			    <input type="text" class="form-control" readonly="readonly" name="deviceId" placeholder="机柜ID"  value="${device.deviceId}"> 
			</div>
			<span id="span"></span> 
		</div>  
		<div class="form-inline" >
			<div class="form-group">
			    <label for="exampleInputName2">机柜在线状态</label>
			    <input type="text" class="form-control" required  placeholder="机柜在线状态" name="devicestate" value="${device.devicestate}">
			</div>
			<span id="span"></span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label for="exampleInputEmail2">注册状态</label> 
			    <input type="text" class="form-control" required placeholder="注册状态" name="registstate" value="${device.registstate}">
			</div>
			<span id="span"></span> 
		</div>
		<fieldset disabled>
		<div class="form-inline" >
			<div class="form-group">
			    <label for="exampleInputName2">当前温度</label>
			    <input type="text" class="form-control" id="wendu" name="tempnow" readonly required placeholder="当前温度" value="${device.tempnow}"><span id="span">°C</span>
			</div>
			<span id="span"></span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label for="exampleInputName2">当前湿度</label>
			    <input type="text" class="form-control" id="wendu1" name="wetnow" readonly required placeholder="当前湿度" value="${device.wetnow}"><span id="span">%RH</span>
			</div>
			<span id="span"></span> 
		</div>
		<div class="form-inline" >
			<div class="form-group">
			    <label for="exampleInputName2">温度上限</label>
			    <input type="text" class="form-control" readonly required id="wendu" name="tempmax" placeholder="温度上限" value="${device.tempmax}"><span id="span">°C</span>
			</div>
			<span id="span"></span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label for="exampleInputName2">湿度上限</label>
			    <input type="text" class="form-control" id="wendu1" name="wetmax" readonly required placeholder="湿度上限" value="${device.wetmax}"><span id="span">%RH</span>
			</div>
			<span id="span"></span> 
		</div>
		<div class="form-inline" >
			<div class="form-group">
			    <label for="exampleInputName2">温度下限</label> 
			    <input type="text" class="form-control" id="wendu"  required name="tempmin" placeholder="温度下限" value="${device.tempmin}"><span id="span">°C</span>
			</div>
			<span id="span"></span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label for="exampleInputName2">湿度下限</label>
			    <input type="text" class="form-control" id="wendu1"  required name="wetmin" placeholder="湿度下限" value="${device.wetmin}"><span id="span">%RH</span>
			</div>
			<span id="span"></span> 
		</div>
		</fieldset>
		<div class="form-inline" >
			<div class="form-group">
			    <label for="exampleInputName2">经度</label>
			    <input type="text" class="form-control"  placeholder="经度" required name="lng" value="${device.lng}">
			</div>
			<span id="span12"></span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label for="exampleInputEmail2">纬度</label> 
			    <input type="text" class="form-control"  placeholder="纬度" required name="lat" value="${device.lat}">
			</div>
			<span id="span13"></span>  
		</div>
		<div class="form-inline" >
			<div class="form-group">
			    <label for="exampleInputName2">震动等级</label>
			    <input type="text" class="form-control" readonly name="shake" required placeholder="震动等级" value="${device.shake}">
			</div>
			<span id="span14"></span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-warning" type="submit" data-toggle="modal" data-target="#myModal1"  value="修改信息"></input> 
			 <div class="modal fade" id="" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document"> 
			    <div class="modal-content"> 
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">修改信息</h4>
			      </div>
			      <div class="modal-body">
			        确定要修改该机柜信息吗？ 
			        <br/>
			      </div> 
			      <div class="modal-footer"> 
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <!-- <input type="button" class="btn btn-primary"  data-dismiss="modal" value="确定" onclick="location='user/updateDevice'"></input> -->   
			        <input type="button" class="btn btn-primary"  data-dismiss="modal" value="确定"></input>
			      </div>
			    </div>
			  </div>
			</div> 
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-info" type="button" onclick="history.go(-1)">返回</button>
		</div>
		<div class="page-header">
		    <h2>网络配置
		        <small><span class="sp">(！以下信息请谨慎配置 ！)</span></small>
		    </h2>
		</div>
		<!-- <br/> -->
		<div class="form-inline">
			<div class="form-group">
			    <label for="exampleInputName2">机柜IP</label>
			    <input type="text" class="form-control" id="deIp" name="deviceip" placeholder="机柜IP" required value="${device.deviceip}">
			</div>
			<span id="span15"></span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label for="exampleInputEmail2">子网掩码</label> 
			    <input type="text" class="form-control" id="yanma" name="snm" placeholder="子网掩码" required value="${device.snm}">
			</div>
			<span id="span16"></span> 
		</div>
		<fieldset disabled>
		<div class="form-inline">
			<div class="form-group">
			    <label for="exampleInputName2">服务器IP</label>
			    <input type="text" class="form-control" readonly id="serverIp" name="serverip" required placeholder="服务器IP" value="${device.serverip}">
			</div>
			<span id="span17"></span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label for="exampleInputEmail2">网关IP</label> 
			    <input type="text" class="form-control" id="ip" placeholder="网关IP" name="geteway" required value="${device.geteway}"> 
			</div>
			<span id="span18"></span> 
		</div>
		</fieldset>
		<div class="form-inline"> 
			<div class="form-group">
			    <label for="exampleInputName2">服务器端口</label>
			    <input type="text" class="form-control" readonly id="port1" name="serverport" required placeholder="服务器端口" value="${device.serverport}">
			</div>
			<span id="span19"></span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label >自动上报时间</label> 
			    <input type="number" min="1" max="255" class="form-control" id="sbtime" name="reporttime" required placeholder="1-255分" style="width:100px;" value="${device.reporttime}">
			</div>
			 <span id="span21"></span>  
		</div>
		<div class="form-inline"> 
			<div class="form-group" id="d"> 
			    <label for="exampleInputEmail2">机柜端口</label> 
			    <input type="text" class="form-control" id="port" placeholder="机柜端口" name="deviceport" required value="${device.deviceport}">
			</div>
			<span id="span20"></span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
			    <label for="exampleInputEmail2">心跳包间隔时间</label> 
			    <input type="number" min="1" max="255" class="form-control" id="sbtime1" name="hearttime" placeholder="1-255分" required style="width:100px;" value="${device.hearttime}">
			    <span id="span22"></span> 
			</div> 
		</div>
		<br/><br/>
		<div class="navbar navbar-inverse" style=" background-color: #FCFCFC; height:110px;"><footer class="last">Copyright (C) 安徽维德自动化有限公司版权所有    2014-2018</footer></div>
    </div> 
    </form>
    <div class="suspension">  
		<div class="suspension-box"> 
			<a href="javascript:;" class="a a-service "><i class="i"></i></a>
			<a href="javascript:;" class="a a-service-phone "><i class="i"></i></a>
			<a href="javascript:;" class="a a-qrcode"><i class="i"></i></a>
			<div class="d d-service">
				<i class="arrow"></i>
				<div class="inner-box">
					<div class="d-service-item clearfix">
						<a href="tencent://message/?uin=2625987756&Menu=yes&Site=机柜系统" class="clearfix"><span class="circle"><i class="i-qq"></i></span><h3 id="qq">咨询在线客服</h3></a>
					</div>  
				</div> 
			</div>
			<div class="d d-service-phone">
				<i class="arrow"></i>
				<div class="inner-box">
					<div class="d-service-item clearfix">
						<span class="circle"><i class="i-tel"></i></span>
						<div class="text">
							<p>服务热线</p>
							<p class="red number">15656040592</p>
						</div>
					</div>
					<div class="d-service-intro clearfix">
						<p><i></i>功能和特性</p> 
						<p><i></i>价格和优惠</p>
						<p><i></i>问题与反馈</p>
					</div>
				</div>  
			</div> 
			<div class="d d-qrcode"> 
				<i class="arrow"></i>
				<div class="inner-box">
					<div class="qrcode-img"><img src="img/weixin.jpg" alt="" style="width:80%;"></div>
					<p>微信服务号</p>
				</div>  
			</div> 
		</div>
	</div>		
</body>
</html>
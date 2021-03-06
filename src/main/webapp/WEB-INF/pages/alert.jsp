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
	<link rel="stylesheet" href="css/alert.css">
	<link rel="stylesheet" type="text/css" href="css/zeroModal.css" />
    <script src="js/zeroModal.min.js"></script> 
    <link rel="stylesheet" type="text/css" href="css/dialog.css">
    <script src="js/zepto.min.js"></script>
	<script type="text/javascript" src="js/dialog.min.js"></script>   
	<style type="text/css">
	</style>
	<script type="text/javascript">
		$(function(){
			 setTimeout(function(){alert("登录超时！");location="user/logout"},1800000);  
			 $("#option").click(function(){   
				 zeroModal.alert("请从设备管理—>操作 查看此页面！");  
	    	 	}); 
			 /* $(window).bind('beforeunload',function(){ 
				 alert('您输入的内容尚未保存，确定离开此页面吗？'); 
				}); */ 
			 var msg="${ERROR}"; 
			 if(msg.length>0){
				 popup({type:'error',msg:"很抱歉~您没有权限！",delay:1500,callBack:function(){ 
		 				location="user/device_manage";   
				           }}); 
				}
		})
		
	</script>  
</head>
<body>
	<div class="navbar navbar-inverse" style="background-color: rgb(33, 71, 97); ">
           <div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-primary" id="option4">
			    <input type="radio" name="options"  autocomplete="off"> 设备管理
			  </label>
			  <label class="btn btn-primary active" id="option1">
			    <input type="radio" name="options"  autocomplete="off" checked> 报&nbsp;警   
			  </label>
			  <label class="btn btn-primary " id="option2">
			    <input type="radio" name="options"  autocomplete="off"> 日&nbsp;志
			  </label>
			  <label class="btn btn-primary" id="option3">
			    <input type="radio" name="options"  autocomplete="off"> 用户管理
			  </label>
			  <label class="btn btn-primary "id="option"> 
			    <input type="radio" name="options"  autocomplete="off"> 设备信息
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
     <div class="box">
	     	<div class="page-header">
			    <h1>机柜系统
			        <small>报警</small> 
			    </h1>
			</div>
			<form action="user/alert" method="post"> 
			<div class="form-inline" > 
				<div class="form-group"> 
				    <span  class="sp">起始日期 :</span>    
				    <input type="date" class="form-control" name="timemin" id="" >
				</div>
				<div class="form-group">
				    <span class="sp">结束日期 :</span> 
				    <input type="date" class="form-control" name="timemax" id="" > 
				</div>
				<div class="form-group">
				    <span  class="sp">机柜名称 :</span>
				    <input type="text" class="form-control" name="deviceid" id="" placeholder="机柜名称"> 
				</div>
				<button type="submit" class="btn btn-success">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;查找</button> 
			</div>
			<!-- <div class="input-append date" id="datetimepicker" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
			    <input size="16" type="text" value="12-02-2012" readonly>
			    <span class="add-on"><i class="icon-th"></i></span>
			</div> -->
			<div class="lastbox" width="100%">&nbsp;</div>  
			<div> 
				<table>
					<tr id="fis"> 
						<td width="5%" >机柜编号</td>  
						<td width="4%" >门一状态</td>
						<td width="4%" >门二状态</td>
						<td width="4%" >传感器状态</td> 
						<td width="4%" >解锁状态</td>
						<td width="4%" >震动</td>  
						<td width="4%" >电源状态</td>  
						<td width="7%" >报警时间</td>      
					</tr>
					<c:forEach items="${page.list}"  var="page"> 
					<tr> 
						<td >${page.deviceid}</td> 
						<c:if test="${page.doorone==0}"><td >打开</td></c:if>
						<c:if test="${page.doorone==1}"><td >关闭</td></c:if>
						<c:if test="${page.doortwo==0}"><td >打开</td></c:if>
						<c:if test="${page.doortwo==1}"><td >关闭</td></c:if>     
						<c:if test="${page.camera==1}"><td >打开</td></c:if> 
						<c:if test="${page.camera==0}"><td >关闭</td></c:if>
						<c:if test="${page.lockstate==1}"><td >解锁中 </td></c:if>
						<c:if test="${page.lockstate==0}"><td >正常工作 </td></c:if>
						<c:if test="${page.zhendong==1}"><td>正常</td></c:if> 
						<c:if test="${page.zhendong==0}"><td>有震动</td></c:if>
						<td >${page.power}</td> 
						<td >${page.alarmtime}</td>         
					</tr>
					</c:forEach>
				</table>
				<div class="pages">
					<div class="form-inline" >
					<a href="user/alert?pageNum=1&deviceid=${deviceid}" class="btn btn-primary">首页</a>
					<a href="user/alert?pageNum=${page.pageNum-1}&deviceid=${deviceid}" class="btn btn-primary"><span class="glyphicon glyphicon-backward" aria-hidden="true"></span>&nbsp;上一页</a> 
					<a href="user/alert?pageNum=${page.pageNum+1}&deviceid=${deviceid}" class="btn btn-primary">下一页&nbsp;<span class="glyphicon glyphicon-forward" aria-hidden="true"></span></a>
					<a href="user/alert?pageNum=${page.totalPage}&deviceid=${deviceid}" class="btn btn-primary">尾页</a> 
						<div class="form-group">
							<span id="spn">共</span> 
							<input type="text"  readonly value="${page.totalPage}" style="width: 70px;text-align: center;" class="form-control"/>
							<span id="spn">页, 第</span> 
							<input type="number" min="1"  value="${page.pageNum}" style="width: 70px;text-align: center;" class="form-control" id="pageNum"/>
							<span id="spn">页</span>
						</div>
						<button type="button" class="go btn btn-success">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;点击跳转</button>
					</div>
				</div> 
			</div> 
		   </form>
     </div>
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
	<script type="text/javascript" src="js/alert.js"></script>  
</body>
</html>
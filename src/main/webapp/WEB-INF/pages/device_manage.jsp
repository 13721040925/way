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
<title>道路机柜管理系统_设备信息</title>
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/bootstrapValidator.min.css"/> 
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.min.js"></script> 
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="css/device_info.css">
    <script type="text/javascript" src="js/device_manage.js"></script>      
  	<link rel="stylesheet" href="css/device_manage.css">
  	<link rel="stylesheet" type="text/css" href="css/zeroModal.css" />
    <script src="js/zeroModal.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog.css">
    <script src="js/zepto.min.js"></script>
	<script type="text/javascript" src="js/dialog.min.js"></script>
    <style type="text/css"> 
    #alert{
    	position: absolute; 
    }
    li{
    	padding:10px;
    }
    </style>  
    <script type="text/javascript"> 
    	$(function(){
    		var a="${i}";
    		//alert(a);  
    		if(a.length>0){
    			popup({type:'success',msg:"添加成功！",delay:1000,callBack:function(){ 
    				location="user/device_manage";     
		        }}); 
    		}
    	})
    </script>  
</head>  
<body onunload="CloseOpen(event)">
	<div class="navbar navbar-inverse" style="background-color: rgb(33, 71, 97);" >   
           <div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-primary active" id="option4">  
			    <input type="radio" name="options"  autocomplete="off" checked> 设备管理 
			  </label> 
			  <label class="btn btn-primary" id="option1"> 
			    <input type="radio" name="options"  autocomplete="off" > 报&nbsp;警
			  </label>
			  <label class="btn btn-primary" id="option2">
			    <input type="radio" name="options"  autocomplete="off"> 日&nbsp;志
			  </label>
			  <label class="btn btn-primary" id="option3">
			    <input type="radio" name="options"  autocomplete="off"> 用户管理
			  </label>
			  <label class="btn btn-primary " id="option"> 
			    <input type="radio" name="options" autocomplete="off" > 设备信息
			  </label>
			  <label class="btn btn-primary" id="option5">
			    <input type="radio" name="options"  autocomplete="off"> 地图信息
			  </label>
		 </div>
		 <button type="button" class="btn btn-primary" data-backdrop="static" data-keyboard="false" data-toggle="modal" id="logout" data-target="#myModal" >退&nbsp;出</button>
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
    <div id="alert">
			<h4 style="margin-left: 80px; color:#6C6C6C;">系统公告</h4>   
			<br/>
			<ul style="margin-left: 40px; color:#AE0000;">   
				<li>*欢迎使用机柜系统 </li>
				<li>*如有疑问 请联系在线qq</li> 
				<li>*请遵守用户规则  谨慎操作</li>
				<li>*每一步操作都负法律责任</li> 
			</ul>
	</div> 
    <div class="box">
	     <div class="page-header">
			  <h1>机柜系统
			       <small>设备管理</small> 
			  </h1>
		</div> 
		<div>  
		<form class="form-inline" id="tb" method="post" action="user/device_manage">
		  <div class="form-group">  
		  <button type="button" class="btn btn-info" id="addDevice" data-toggle="modal" data-target="#jigui">添加机柜</button><!--  定义模态框触发器，此处为按钮触发  -->
		    <input type="text" class="form-control" name="deviceId" id="deviceId" placeholder="机柜编号">   
		  </div>
		  <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;查找</button>     
		<div >
			<table>
				<tr id="fis"> 
					<td width="5%">机柜编号</td> 
					<td width="5%">在线状态</td>
					<td width="5%">注册状态</td>
					<td width="7%">纬度</td>
					<td width="7%">经度</td>
					<td width="7%">机柜ip</td>
					<td width="7%">服务器ip</td>
					<td width="7%">操作</td> 
				</tr>
				<c:forEach items="${page.list}"  var="page">
				<tr>
					<td>${page.deviceId}</td> 
					<td>${page.devicestate}</td>
					<td>${page.registstate}</td>
					<td>${page.lat}</td>
					<td>${page.lng}</td>
					<td>${page.deviceip}</td>
					<td>${page.serverip}</td>
					<td><a href="user/device_info1?deviceId=${page.deviceId}" id="oa">查看或修改</a></td> 
				</tr>
				</c:forEach>
			</table>
			<div class="pages">
					<a href="user/device_manage?pageNum=1&deviceId=${deviceId}" class="btn btn-primary">首页</a>
					<a href="user/device_manage?pageNum=${page.pageNum-1}&deviceId=${deviceId}" class="btn btn-primary"><span class="glyphicon glyphicon-backward" aria-hidden="true"></span>&nbsp;上一页</a>
					<a href="user/device_manage?pageNum=${page.pageNum+1}&deviceId=${deviceId}" class="btn btn-primary">下一页&nbsp;<span class="glyphicon glyphicon-forward" aria-hidden="true"></span></a>
					<a href="user/device_manage?pageNum=${page.totalPage}&deviceId=${deviceId}" class="btn btn-primary">尾页</a>
					<span id="spn">共</span> 
					<input type="text"  readonly value="${page.totalPage}" style="width: 70px;text-align: center;" class="form-control"/>
					<span id="spn">页, 第</span>
					<input type="number" min="1"  value="${page.pageNum}" style="width: 70px;text-align: center;" class="form-control" id="pageNum"/>
					<span id="spn">页</span>
					<button type="button" class="go btn btn-success"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;点击跳转</button>
			</div> 
			</div>
		</form>
		</div>
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
				<div class="modal fade " id="jigui" tabindex="-1" aria-hidden="true" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel">
				    <div class="modal-dialog" role="document">
				        <div class="modal-content">
				            <div class="btn-primary modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
				                        aria-hidden="true">&times;</span></button>
				                <h4 class="modal-title" id="exampleModalLabel">添加机柜</h4>
				            </div>
				            <form action="user/addDevice" method="post" id="addjigui">  
				            <div class="modal-body" id="mod-sp">
				            		<span>机柜ID:</span>
				                    <div class="form-group"> 
				                        <input type="text" class="form-control" id="Id" name="deviceId" placeholder="比如:0000001" >
				                    </div>
				                    <br/>
				                    <span>机柜名称:</span>
				                    <div class="form-group">
				                        <input type="text" class="form-control" id="devicename" name="devicename" placeholder="比如:桐城路与芜湖路交叉口机柜">
				                    </div>
				                    <br/>
				                    <span>经度:</span> 
				                   <div class="form-group">
				                        <input type="text" class="form-control" id="lng" name="lng" placeholder="比如:131.123456">
				                    </div>
				                    <br/>
				                    <span>纬度:</span> 
				                   <div class="form-group">
				                        <input type="text" class="form-control" id="lat" name="lat" placeholder="比如:31.123456">  
				                    </div>
				                    <div class="text-right">
				                    <a href="user/map" >如何获得经纬度？</a>
				                        <span id="returnMessages" class="glyphicon"></span>  
				                        <button type="button" class="btn btn-default right" data-dismiss="modal">关闭</button>
				                        <button type="reset" class="btn btn-danger">清空数据</button>  
				                        <button type="submit" class="btn btn-primary">添加</button>      
				                    </div>
				            	</div>
				             </form>
				        </div>
				    </div>
				</div>
</body>
</html>
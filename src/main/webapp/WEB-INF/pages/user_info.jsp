<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="ftm" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8"> 
<link rel="icon" href="img/1.png" type="image/x-icon"/>
<title>道路机柜管理系统</title>
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/bootstrapValidator.min.css"/> 
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script> 
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" ></script>
    <script type="text/javascript" src="js/bootstrapValidator.min.js"></script> 
    <link href="bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css" rel="stylesheet" >
	<link rel="stylesheet" href="bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="css/style.css"> 
	<link rel="stylesheet" href="css/user_info.css"> 
	<link rel="stylesheet" type="text/css" href="css/zeroModal.css" />
    <script src="js/zeroModal.min.js"></script>
    <script src="js/zepto.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog.css">
	<script type="text/javascript" src="js/dialog.min.js"></script>
	<script type="text/javascript" src="js/user_info.js"></script> 
	<style type="text/css">
	</style>
	<script type="text/javascript">
	$(function(){
		var msg="${ERROR}";   
		if(msg.length>0){ 
			popup({type:'error',msg:"很抱歉~您没有权限！",delay:1500,callBack:function(){ 
 				location="user/device_manage";   
		    }});   
		} 
		var Add="${ADD}";
		if(Add.length>0){
			popup({type:'success',msg:"添加成功！",delay:1000,callBack:function(){
				location="user/user_info";   
	           }}); 
		}
		var j="${DEL}";     
		if(j.length>0){    
			popup({type:'success',msg:"删除成功！",delay:1000,callBack:function(){ 
				location="user/user_info";    
	        }});  
		}  
	}) 
	</script>
</head> 
<body > 
	<div class="navbar navbar-inverse" style="background-color: rgb(33, 71, 97);">
           <div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-primary" id="option4">
			    <input type="radio" name="options"  autocomplete="off"> 设备管理
			  </label>
			  <label class="btn btn-primary " id="option1">
			    <input type="radio" name="options"  autocomplete="off" > 报&nbsp;警  
			  </label>
			  <label class="btn btn-primary " id="option2"> 
			    <input type="radio" name="options"  autocomplete="off" > 日&nbsp;志 
			  </label> 
			  <label class="btn btn-primary active">
			    <input type="radio" name="options" id="option3" autocomplete="off" checked> 用户管理 
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
			       <small>用户信息</small>
			  </h1> 
		</div>
		<div>
			<!-- <button class="btn btn-info" id="addbtn" onclick="adduser()" type="button">增加用户</button> -->
			<br/> 
			<div class="form-inline" id="yzm">
			   <%-- <div class="form-group">    
			    <span id="spe">&nbsp;&nbsp;&nbsp;手机号</span>
			    <input type="text" name="number" class="form-control" id="yzm-phone" readonly="readonly" value="${PHONE}" placeholder="请重新登录!" style="width:110px">
			   </div>
			   <div class="form-group">  
			    <button type="button" class="btn btn-default"  id="phone"  onclick="settime(this)" style="width:110px">获取验证码</button>
			    <input type="number" name="verifyCode" class="form-control" id="inp-yzm" placeholder="你的验证码" style="width:110px;" >  
			   </div> 
			  <button class="btn btn-primary" type="button" id="go-yzm">验证</button>  
			  <span id="yzm-sp"></span> 
			  <button type="button" class="btn btn-success" id="lastyz" data-toggle="modal" data-target="#addUser">验证成功点这里</button><!--  定义模态框触发器，此处为按钮触发  --> --%>
				  <div class="modal fade " id="User" tabindex="-1" aria-hidden="true" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel">
				    <div class="modal-dialog" role="document">
				        <div class="modal-content">
				            <div class="btn-primary modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
				                        aria-hidden="true">&times;</span></button>
				                <h4 class="modal-title" id="exampleModalLabel">添加用户</h4>
				            </div>
				            <form action="user/doaddUser" method="post" id="adduser" > 
				            <div class="modal-body" style="margin-left:30px;"> 
				             		<span>用 户 名:</span>
				                    <div class="form-group">
				                        <input type="text" class="form-control" id="id" name="userid" > 
				                    </div>
				                    <br/><br/> <span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
				                    <div class="form-group">
				                        <input type="password" class="form-control" id="password" name="password">
				                    </div>
				                    <br/><br/> 
				                    <div >
				                    <span>权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限:</span>
									  <select title="选择权限" class="btn btn-info"  name="role">
									  	<!-- <option>请选择权限</option> --> 
									  	<option value="2">用户</option>   
									  	<option value="1">管理员</option>
									  </select>
									</div>
				                    <br/><span>手 机 号:</span> 
				                    <div class="form-group">
				                        <input type="text" class="form-control" id="ph" name="phone">   
				                    </div>
				                    <span class="sp"></span> 
				                    <br/><br/> 
				                    <div class="text-right"> 
				                        <span id="returnMessage" class="glyphicon"> </span>
				                        <button type="button" class="btn btn-default right" data-dismiss="modal">关闭</button>
				                        <button type="reset" class="btn btn-danger">清空数据</button> 
				                        <button type="submit" class="btn btn-primary" id="submitBtn">添加</button>  
				                    </div>
				            	</div>
				             </form>
				        </div>
				    </div>
				</div>
			</div>  
		</div>
		<!-- <button class="btn btn-success" id="any" onclick="giveubitch()">点我有惊喜哦</button> -->
		<form class="form-inline" id="tb" method="post" action="user/user_info">
		  <div class="form-group" id="tb1">
		  	<button type="button" class="btn btn-info" id="addbtn" data-toggle="modal" data-target="#User">添加用户</button><!--  定义模态框触发器，此处为按钮触发  -->   
		    <input type="text" class="form-control" name="userid" id="userid" placeholder="用户名">
		    <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;查找</button> 
		  </div>
			<div id="spb">
				<table>
					<tr id="fis" style="background: rgb(40, 96, 144);color:white;">
						<td width="5%">&nbsp;<input type="checkbox" id="slAll" />全选</td>
						<td width="5%">用户名</td>
						<td width="5%">密码</td>
						<td width="5%">手机号</td>
						<td width="7%">上次登录时间</td>
						<td width="7%">上次退出时间</td>
						<td width="5%">权限</td>
						<!-- <td width="5%">状态</td>  -->
						<td width="4%">操作</td>  
					</tr>
					<c:forEach items="${page.list}"  var="page">
					<tr>
						<td><input type="checkbox" class="sl" name="id" value="${page.id}"/></td>   
						<td>${page.userid}</td>
						<td>${page.password}</td> 
						<td>${page.phone}</td>
						<ftm:formatDate value="${page.logintime}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
						<td>${date}</td>
						<ftm:formatDate value="${page.logouttime}" var="date1" pattern="yyyy-MM-dd HH:mm:ss"/> 
						<td>${date1}</td> 
						<c:if test="${page.role==1}">
						<td>管理员</td> 
						</c:if>
						<c:if test="${page.role==2}">
						<td>普通用户</td> 
						</c:if>
						<%-- <c:if test="${page.state==1}">
						<td>在线</td> 
						</c:if>
						<c:if test="${page.state==2}">
						<td>离线</td>   
						</c:if> --%> 
						<td><a href="user/deleteUser?userid=${page.userid}" >   
							<img src="img/schu.png" alt="删除" title="删除" id="oa"/>
						</a></td>  
					</tr>
				</c:forEach>
				</table>
				<div class="pages">
					<a href="user/user_info?pageNum=1&userid=${userid}" class="btn btn-primary">首页</a>
					<a href="user/user_info?pageNum=${page.pageNum-1}&userid=${userid}" class="btn btn-primary"><span class="glyphicon glyphicon-backward" aria-hidden="true"></span>&nbsp;上一页</a>
					<a href="user/user_info?pageNum=${page.pageNum+1}&userid=${userid}" class="btn btn-primary">下一页&nbsp;<span class="glyphicon glyphicon-forward" aria-hidden="true"></span></a>
					<a href="user/user_info?pageNum=${page.totalPage}&userid=${userid}" class="btn btn-primary">尾页</a>
					<span id="spn">共</span> 
					<input type="text"  readonly value="${page.totalPage}" style="width: 70px;text-align: center;" class="form-control"/>
					<span id="spn">页, 第</span>
					<input type="number" min="1"  value="${page.pageNum}" style="width: 70px;text-align: center;" class="form-control" id="pageNum"/>
					<span id="spn">页</span>
					<button type="button" class="go btn btn-success"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;点击跳转</button> 
					<button type="button" class="delSelected btn btn-danger"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>&nbsp;批量删除</button> 
					<button type="button" class="checkOutxls btn btn-info"><span class="glyphicon glyphicon-export" aria-hidden="true"></span>&nbsp;导出Excel</button> 
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
</body>
<script type="text/javascript" src="js/userList.js"></script>
</html>
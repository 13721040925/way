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
<title>道路机柜管理系统</title>
	<link rel="stylesheet" href="css/bootstrapValidator.min.css"/>  
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="css/forgetPass.css">
    <link rel="stylesheet" type="text/css" href="css/zeroModal.css" />
    <script src="js/zeroModal.min.js"></script>
    <script type="text/javascript" src="js/forgetPass.js"></script>
    <link rel="stylesheet" href="css/jigsaw.css">
    <script src="js/jigsaw.js"></script> 
		<script type="text/javascript">
		$(function(){
			jigsaw.init(document.getElementById('captcha'), function () {
				document.getElementById('msg').innerHTML = '验证成功！'; 
				location="user/forgetPass"; 
			})
		})
		function back(){ 
			location="jsp/login1.jsp"; 
		}
		</script> 
		<style type="text/css">
			.container { 
		      width: 337px;
		    }
		    #msg {
		      width: 100%;
		      line-height: 40px;
		      font-size: 14px;
		      text-align: center;
		    }
		    a:link,a:visited,a:hover,a:active {
		      margin-left: 100px;
		      color: #0366D6; 
		    }
		</style> 
    </head>
    <body>
    	<div class="navbar navbar-inverse"  style="background-color: rgb(33, 71, 97); height: 111px;">
		<form class="form-inline" action="user/updatePass" method="post" id="updatePass">   
			<div id="all">
			<span id="title">修&nbsp;改&nbsp;密&nbsp;码</span><br/><br/>   
			  <div class="form-group" >
			    <label for="">账 号</label> 
			    <input type="text" name="userid" class="form-control" id="userid" placeholder="请输入账号" required onkeyup="value=value.replace(/[\u4e00-\u9fa5]/ig,'')" > <!-- 禁止输入汉字 --> 
			    <span id="sp"></span>
			  </div>
			  <div id="tip" ></div> 
			  <br/>
			  <div class="form-group">
			    <label for="">新密码</label> 
			    <input type="password" name="password" class="form-control" id="password" placeholder="输入新密码" required>
			    <span id="sp2"></span> 
			  </div>
			  <div id="tip3" style="margin-left:3%;"></div>
			  <br/>
			  <div class="form-group">
			    <label for="">手机号</label>  
			    <input type="text" name="phone" class="form-control" id="phone" placeholder="请输入绑定的手机号" required>
			    <span id="sp1"></span> 
			  </div> 
			  <div id="tip1" ></div>
			  <br/>
			  <div class="form-group"> 
			    <label for="">验证码</label>   
			    <input type="text" name="yzm" class="form-control" id="veriftyzm" placeholder="验证码" required style="width:93px;">&nbsp;<button type="button" class="bt btn btn-info" id="btn-yzm" onclick="settime(this)" style="width:100px;">获取验证码</button>
			    <span id="sp2"></span> 
			  </div>
			  <div id="tip2" ></div> 
			  <br/>
			  <div class="box"> 
			  <button type="submit" id="go" class="btn btn-info" >修&nbsp;改</button>      
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
			  <button type="button" class="btn btn-default" onclick="back()">返&nbsp;回</button>   
			  </div> 
		  	</div>  
		</form> 
	</div>
    </body>
</html>   
 
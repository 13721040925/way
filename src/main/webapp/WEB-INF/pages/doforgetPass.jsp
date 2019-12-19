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
			zeroModal.confirm({
				content:"为了保护你账号 请根据提示操作！",
				contentDetail:"确定则继续，取消则返回",
				okFn: function() {
		            },
		            cancelFn: function() {
		            	history.go(-1);   
		            }
			})
			jigsaw.init(document.getElementById('captcha'), function () {
				//document.getElementById('msg').innerHTML = '验证成功！';
				location="user/forgetPass"; 
			})
		})
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
		    #btn{
		    	margin-top: 10px;
		    	margin-left: 225px;
		    }
		</style> 
    </head> 
    <body> 
    	<div class="navbar navbar-inverse"  style="background-color: rgb(33, 71, 97); height: 111px;">
    	 	<div class="container">
			  	<div id="captcha" style="position: relative; margin-top:300px;"></div>
			  	<div id="msg"></div>
			  	<button type="button" class="btn btn-info" id="btn" onclick="history.go(-1);">返回</button>
			</div>
		</div>
    </body>
</html>   
 
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
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <!-- <link rel="stylesheet" href="css/login.css"> -->
    <link rel="stylesheet" href="css/style.css">
    <style>
	    #title{   
	    	font-size:35px;          
	    	color:#750000;
	    	margin-left:20%;
	    }
	    label{
	    	font-size:18px;
	    	width:100px;
	    	padding:6px;
	    }
		button{
	    	width:84px;
	    }  
	    #all{ 
			margin-top:15%;
			margin-right:5%;  
			text-align:center;   
		}
		.box{
			margin-left:5.5%; 
		}
		#sp,#sp1,#sp2{
			position: absolute;
			margin-right:26%; 
		}
    </style>
    <script type="text/javascript">
    	$(function(){
    		$("#uid").blur(function(){
    			checkuid(); 
    		});
    		$("#pass").blur(function(){
    			checkpass();
    		});
    		$("#pass1").blur(function(){
    			checkpass1(); 
    		});
    	});
    	function checkuid(){
    		var v=$("#uid").val(); 
    		if(v.length>15||v.length<5){
    			$("#sp").empty();//清空
        		$("#sp").text("用户名要在5-15位之间！") 
        		$("#sp").css("color","red");
    			return false;
    		}
    		$("#sp").text("用户名可用！") 
    		$("#sp").css("color","green"); 
    		return true;
    	}
    	function checkpass(){
    		var v=$("#pass").val();
    		if(v.length>15||v.length<5){
    			$("#sp1").empty();//清空
        		$("#sp1").text("密码要在5-15位之间！") 
        		$("#sp1").css("color","red");  
        		return false;
    		}
    		$("#sp1").text("密码可用！") 
    		$("#sp1").css("color","green"); 
    		return true;
    	}
    	function checkpass1(){
    		var v=$("#pass").val();
    		var v1=$("#pass1").val();
    		if(v1==""){
    			$("#sp2").empty();//清空
        		$("#sp2").text("请输入确认密码！") 
        		$("#sp2").css("color","red");  
        		return false;
    		}
    		if(v!=v1){
    			$("#sp2").empty();//清空
        		$("#sp2").text("两次输入的密码不一样！") 
        		$("#sp2").css("color","red");  
        		return false;
    		}
    		$("#sp2").text("密码可用！") 
    		$("#sp2").css("color","green");
    		return true;
    	}
    	//n、验证表单
    	$(function() {
    		$("form").submit(function() {
    			var flag = checkuid()&checkpass()&checkpass1();
    			if(flag==0){
    				alert("验证不通过！"); 
    			}
    			return flag == 1 ? true : false; 
    		});
    	});
    </script>
</head>
<body>
	<div class="navbar navbar-inverse"  style="background-color: rgb(33, 71, 97); height: 111px;">
	<form class="form-inline" action="user/doaddUser" method="post">  
		<!-- <div id="all">
		  <div class="form-group" >
		  	<span id="title">添加用户系统</span><br/><br/> 
		    <label for="exampleInputName2">账 号:</label>
		    <input type="text" name="userid" class="form-control" id="uid" placeholder="请输入账号" required>
		    <span id="sp"></span>
		  </div>
		  <br/><br/>
		  <div class="form-group">
		    <label for="exampleInputEmail2">密 码:</label> 
		    <input type="password" name="password" class="form-control" id="pass" placeholder="请输入密码" required>
		    <span id="sp1"></span>
		  </div>
		  <br/><br/> 
		  <div class="form-group">
		    <label for="exampleInputEmail2">确认密码:</label> 
		    <input type="password"  class="form-control" id="pass1" placeholder="再次输入密码" required>
		    <span id="sp2"></span> 
		  </div>
		  <br/><br/>
		  <div class="box"> 
		  <button type="submit" class="btn btn-info" >添加</button>  
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
		  <button type="reset" class="btn btn-default" onclick="history.go(-1)">返回</button>  
		  </div> 
	  	</div> -->
	</form> 
	</div>
</body>
</html>
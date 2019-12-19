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
<link rel="icon" href="img/1.png" type="image/x-icon" > 
<title>道路机柜管理系统</title>
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <link rel="stylesheet" href="css/login.css"> 
    <link rel="stylesheet" href="css/jigsaw.css">
    <style type="text/css">
    	.container {
      width: 310px;
      margin: 100px auto;
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
    <script type="text/javascript"> 
    	$(function(){  
    		//获得页面的错误信息 
    		/* var error = $("#error");
    		var msg = "${ERROR}";//通过EL表达式获得页面的值
    		if(msg.length>0){
    			alert("账号或密码错误！")
    		} */ 
    		/* $("#exampleInputName2").attr("disabled","disabled");//不可编辑 */
    		/* $('[data-toggle="tooltip"]').tooltip();
    		$('#example').popover(options); 
    		$('#myButton').on('click', function () {
    		    var $btn = $(this).button('loading')
    		    // business logic...
    		    $btn.button('reset')
    		  }) */
    		  /* var msg1="${ERR}"; 
    		  if(msg1.length>0){    
    			  alert("登录超时请重新登录！");
    		  } */
    		     /* window.onbeforeunload = onbeforeunload_handler;  
    		     function onbeforeunload_handler(){  
    	         var warning="确认退出?";          
    		        return warning;  
    		     } */  
    		     
    		     window.onunload = onunload_handler;  
    		     function onunload_handler(){  
    		         var warning="谢谢光临";  
    		         alert(warning);   
    		     }  
    	}); 
    	$(function(){
    		$("#for").submit(function(event){
    		  event.preventDefault();  
  			 // alert(1); 
  			  var userid=$("#userid").val();
  			  var password=$("#password").val();
  			  $.ajax({ 
  				  url:"user/state", 
  				  async : true, 
  				  data: {"userid":userid,"password":password}, 
  				  success:function(res){
  					  console.log(res); 
  					  var state1=JSON.stringify(res); 
  					  //alert(state1) 
  					  if(state1=="1"){ 
  						  if(confirm("该账号正在被他人使用！是否继续登录？")){
  							location="user/login?userid="+userid+"&password="+password;
  						  }else{
  							 location.reload();
  						  }
  					  }
  					  if(state1=="2"){
  						  location="user/login?userid="+userid+"&password="+password;
  					  }
  					  if(state1=="0"){
  						  alert("账号或密码错误！");   
  					  }
  				  }
    		    })    
    		});
    	}); 
    </script>
<body>
	<img src="img/1.png" id="img1" width="10%"/>  
	<img src="img/bg02.jpg" id="img2" />
	<form class="form-inline" action="user/login" method="post" id="for" > 
		<div id="all">
		  <div class="form-group">
		  	<span>道路机柜管理系统</span><br/><br/>
		    <label for="exampleInputName2">账 号:</label>
		    <input type="text" name="userid" class="form-control" id="userid" placeholder="请输入账号" required>
		  </div>
		  <br/><br/>  
		  <div class="form-group">
		    <label for="exampleInputEmail2">密 码:</label> 
		    <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码" required>
		  </div>
		  <br/><br/> 
		  <div class="box"> 
		  <button type="submit" class="btn btn-info" id="btn1">登&nbsp;&nbsp;录</button> 
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		  <button type="reset" class="btn btn-info" id="btn2">重&nbsp;&nbsp;置</button>   
		  </div> 
	  	</div>
	</form>
	<span id="error" ></span>
	<!-- 在输出错误信息之后，清除session中的指定key的属性  -->
	<c:remove var="ERROR" scope="session" /> 
</body>
</html>
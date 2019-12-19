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
	<!-- 引入百度地图的API -->
    <script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script> 
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=0xdI6Lq0agqBHUtthykRldY7gMTM378p"></script>
    <script type="text/javascript" src="js/map.js"></script> 
    <link rel="stylesheet" href="css/map.css"> 
    <link rel="stylesheet" id="pageloader-css"  href="css/pageloader1.css" type="text/css" media="all" /> 
    <link rel="stylesheet" type="text/css" href="css/zeroModal.css" />
    <script src="js/zeroModal.min.js"></script>
    <script type="text/javascript"> 
	</script> 
</head>
<body>
<!-- 页面加载 -->
<div id="bonfire-pageloader"> 
	<div class="bonfire-pageloader-icon">
		<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			 width="512px" height="512px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
		<path id="loading-12-icon" d="M291,82.219c0,16.568-13.432,30-30,30s-30-13.432-30-30s13.432-30,30-30S291,65.65,291,82.219z
			 M261,404.781c-15.188,0-27.5,12.312-27.5,27.5s12.312,27.5,27.5,27.5s27.5-12.312,27.5-27.5S276.188,404.781,261,404.781z
			 M361.504,113.167c-4.142,7.173-13.314,9.631-20.487,5.489c-7.173-4.141-9.631-13.313-5.49-20.487
			c4.142-7.173,13.314-9.631,20.488-5.489C363.188,96.821,365.645,105.994,361.504,113.167z M188.484,382.851
			c-14.348-8.284-32.697-3.368-40.98,10.98c-8.285,14.349-3.367,32.696,10.98,40.981c14.35,8.283,32.697,3.367,40.98-10.981
			C207.75,409.482,202.834,391.135,188.484,382.851z M421.33,184.888c-8.368,4.831-19.07,1.965-23.901-6.404
			c-4.832-8.368-1.965-19.07,6.404-23.902c8.368-4.831,19.069-1.964,23.9,6.405C432.566,169.354,429.699,180.056,421.33,184.888z
			 M135.399,329.767c-8.285-14.35-26.633-19.266-40.982-10.982c-14.348,8.285-19.264,26.633-10.979,40.982
			c8.284,14.348,26.632,19.264,40.981,10.98C138.767,362.462,143.683,344.114,135.399,329.767z M436.031,277.249
			c-11.044,0-20-8.953-20-19.999c0-11.045,8.955-20.001,20.001-20.001c11.044,0,19.999,8.955,19.999,20.002
			C456.031,268.295,447.078,277.249,436.031,277.249z M115.97,257.251c-0.001-16.57-13.433-30.001-30.001-30.002
			c-16.568,0.001-29.999,13.432-30,30.002c0.001,16.566,13.433,29.998,30.001,30C102.538,287.249,115.969,273.817,115.97,257.251z
			 M401.333,364.248c-10.759-6.212-14.446-19.97-8.234-30.73c6.212-10.759,19.971-14.446,30.731-8.233
			c10.759,6.211,14.445,19.971,8.232,30.73C425.852,366.774,412.094,370.46,401.333,364.248z M135.398,184.736
			c8.285-14.352,3.368-32.698-10.98-40.983c-14.349-8.283-32.695-3.367-40.981,10.982c-8.282,14.348-3.366,32.696,10.981,40.981
			C108.768,204,127.115,199.082,135.398,184.736z M326.869,421.328c-6.902-11.953-2.807-27.242,9.148-34.145
			s27.243-2.806,34.146,9.149c6.902,11.954,2.806,27.243-9.15,34.145C349.059,437.381,333.771,433.284,326.869,421.328z
			 M188.482,131.649c14.352-8.286,19.266-26.633,10.982-40.982c-8.285-14.348-26.631-19.264-40.982-10.98
			c-14.346,8.285-19.264,26.633-10.98,40.982C155.787,135.017,174.137,139.932,188.482,131.649z"/>
		</svg>
	</div>
</div> 
	<div class="navbar navbar-inverse" style="background-color: rgb(33, 71, 97); ">
           <div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-primary " id="option4"> 
			    <input type="radio" name="options"  autocomplete="off"> 设备管理
			  </label>
			  <label class="btn btn-primary " id="option1"> 
			    <input type="radio" name="options"  autocomplete="off" > 报&nbsp;警  
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
			  <label class="btn btn-primary active" id="option5">
			    <input type="radio" name="options"  autocomplete="off" checked> 地图信息
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
	  	<div class="form-inline" id="last_map">
	  	<div class="sp"><input type="checkbox" id="Checkbox"/><span >坐标反查</span></div>
		  <div class="form-group" id="ct">
		    <div class="input-group"> 
		      <input type="text" class="form-control" id="cityName" style="width:100%;" value="安徽维德自动化有限公司" placeholder="安徽维德自动化有限公司">  
		    </div>
		    <input type="button" id="go" class="btn btn-primary" value="搜索"> 
		    <!-- <button type="button" class="btn btn-success" onclick="history.go(-1)">返回上一页</button> -->
		  </div>
		  <div class="input-group" id="lat-lng"> 
			    <input type="number" class="form-control" id="lng" style="width:26%;"  placeholder="经度">  
				<input type="number" class="form-control" id="lat" style="width:26%;"  placeholder="纬度">  
				<input type="button" id="go-lat" class="btn btn-info" value="搜索">
		  </div>
		</div>
	    <div id="container" style="width:100%;height:80%;"></div> 
	    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script src="js/pageloader.js" type="text/javascript"></script>
	<!-- BEGIN PLACE LOADING ICON IN THE MIDDLE OF THE PAGE -->
	<script>
	//页面加载 
	jQuery(window).resize(function(){
		 resizenow();
	});
	function resizenow() {
		var browserwidth = jQuery(window).width();
		var browserheight = jQuery(window).height();
		jQuery('.bonfire-pageloader-icon').css('right', ((browserwidth - jQuery(".bonfire-pageloader-icon").width())/2)).css('top', ((browserheight - jQuery(".bonfire-pageloader-icon").height())/2));
	};
	resizenow();
	</script>
</body>
</html>
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
<link rel="shortcut icon" href="img/1.png" type="image/x-icon"> 
<title>道路机柜管理系统</title>
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
    <link rel="stylesheet" href="css/login1.css"/>
    <link rel="stylesheet" id="pageloader-css"  href="css/pageloader.css" type="text/css" media="all" />
    <script type="text/javascript" src="js/login1.js"></script> 
    <link rel="stylesheet" type="text/css" href="css/zeroModal.css" />
    <script src="js/zeroModal.min.js"></script>
    <link rel="stylesheet" href="css/jigsaw.css">
    <script src="js/jigsaw.js"></script> 
    <style type="text/css">
    .system{margin-top:-62px; background: url("img/bg02.jpg") center no-repeat;text-align: center; width: 100%;background-size: 100% 100%;height: 630px;background-position: 0 -161px;z-index: -1;} 
    </style>
</head>
<body>
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
<div class="box">
    <div class="logo"><img src="img/1.png" alt=""></div>
    <form  action="user/login" method="post" id="for">
    <div class="system">
        <div class="sys_box">
            <p class="sys_tit">道路机柜管理系统</p> 
            <div class="sy_input">
                <label for="">账号：</label> 
                <input type="text" name="userid"  id="userid" placeholder="请输入账号" title="请输入账号" required>
            </div>
            <div class="sy_input">
                <label for="">密码：</label>
                <input type="password" name="password"  id="password" placeholder="请输入密码" title="请输入密码" required> 
            </div>
            <div class="box1">  
            	<a href="user/doforgetPass">忘记密码？</a> 
                <button type="submit" class="btn btn-info" title="点击登录">登&nbsp;&nbsp;录</button> 
                <button type="reset" class="btn btn-info" id="btn1" title="清空数据">重&nbsp;&nbsp;置</button>
            </div>
        </div>
    </div>
    </form>
    <div><canvas id="Mycanvas" width="100%" height="100%"></canvas></div>
</div>
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
	
	// 定义画布宽高和生成点的个数
	var WIDTH = window.innerWidth, HEIGHT = window.innerHeight, POINT = 40; 
	var canvas = document.getElementById('Mycanvas');
	canvas.width = WIDTH,
	canvas.height = HEIGHT;
	var context = canvas.getContext('2d');
	context.strokeStyle = 'rgba(0,0,0,0.02)',
	context.strokeWidth = 1,
	context.fillStyle = 'rgba(0,0,0,0.05)';
	var circleArr = [];

	//线条：开始xy坐标，结束xy坐标，线条透明度
	function Line (x, y, _x, _y, o) {
		this.beginX = x,
		this.beginY = y,
		this.closeX = _x,
		this.closeY = _y,
		this.o = o;
	}
	//点：圆心xy坐标，半径，每帧移动xy的距离
	function Circle (x, y, r, moveX, moveY) {
		this.x = x,
		this.y = y,
		this.r = r,
		this.moveX = moveX,
		this.moveY = moveY;
	}
	//生成max和min之间的随机数
	function num (max, _min) {
		var min = arguments[1] || 0;
		return Math.floor(Math.random()*(max-min+1)+min);
	}
	// 绘制原点
	function drawCricle (cxt, x, y, r, moveX, moveY) {
		var circle = new Circle(x, y, r, moveX, moveY)
		cxt.beginPath()
		cxt.arc(circle.x, circle.y, circle.r, 0, 2*Math.PI)
		cxt.closePath()
		cxt.fill();
		return circle;
	}
	//绘制线条
	function drawLine (cxt, x, y, _x, _y, o) {
		var line = new Line(x, y, _x, _y, o)
		cxt.beginPath()
		cxt.strokeStyle = 'rgba(0,0,0,'+ o +')'
		cxt.moveTo(line.beginX, line.beginY)
		cxt.lineTo(line.closeX, line.closeY)
		cxt.closePath()
		cxt.stroke();

	}
	//初始化生成原点
	function init () {
		circleArr = []; 
		for (var i = 0; i < POINT; i++) {
			circleArr.push(drawCricle(context, num(WIDTH), num(HEIGHT), num(15, 2), num(10, -10)/40, num(10, -10)/40));
		}
		draw();
	} 

	//每帧绘制
	function draw () {
		context.clearRect(0,0,canvas.width, canvas.height);
		for (var i = 0; i < POINT; i++) {
			drawCricle(context, circleArr[i].x, circleArr[i].y, circleArr[i].r);
		}
		for (var i = 0; i < POINT; i++) {
			for (var j = 0; j < POINT; j++) {
				if (i + j < POINT) {
					var A = Math.abs(circleArr[i+j].x - circleArr[i].x),
						B = Math.abs(circleArr[i+j].y - circleArr[i].y);
					var lineLength = Math.sqrt(A*A + B*B);
					var C = 1/lineLength*7-0.009;
					var lineOpacity = C > 0.03 ? 0.03 : C;
					if (lineOpacity > 0) {
						drawLine(context, circleArr[i].x, circleArr[i].y, circleArr[i+j].x, circleArr[i+j].y, lineOpacity);
					}
				}
			}
		}
	}

	//调用执行
	window.onload = function () {
		init();
		setInterval(function () {
			for (var i = 0; i < POINT; i++) {
				var cir = circleArr[i];
				cir.x += cir.moveX;
				cir.y += cir.moveY;
				if (cir.x > WIDTH) cir.x = 0;
				else if (cir.x < 0) cir.x = WIDTH;
				if (cir.y > HEIGHT) cir.y = 0;
				else if (cir.y < 0) cir.y = HEIGHT;
				
			}
			draw();
		}, 16);
	}
</script>
</body>
</html>
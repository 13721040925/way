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
    <link rel="stylesheet" href="css/easyhelper.css">
   
	<script src="js/es6-shim.min.js"></script>
	<script src="js/jquery-3.3.1.min.js"></script>    
	<script src="js/jquery.transit.min.js"></script> 
	<script src="js/easyhelper.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$( "#dialog-info" ).click(function () {  
				Helper.ui.dialogInfo( "对话框标题", "对话框内容" );
			})
			$( "#dialog-success" ).on("click", function () {
				Helper.ui.dialogSuccess( "对话框标题", "对话框内容" );
			}) 
		})
	</script>
</head>
<body>
<button class="helper-button-info" id="dialog-info">info 对话框</button>
<button class="helper-button-info" id="dialog-success">success 对话框</button>
</body> 
</html> 
$(function(){
			zeroModal.loading(5); 
			setTimeout(function(){
				//zeroModal.close(zeroModal.loading(6));  
				zeroModal.closeAll();  
			},500)  
    		setTimeout(function(){zeroModal.alert("登录超时！");location="user/logout"},1800000); 
	    	$("#logout1").click(function(){
	    			location="user/logout";      
	    	}); 
	    	 $("#option1").click(function(){ 
		 		 	location="user/alert" 
		 	 	});
	 		 $("#option4").click(function(){    
		 		 	location="user/device_manage" 
		 	 	});
	    	 $("#option2").click(function(){ 
		 		 	location="user/log"
		 	 	});
	    	 $("#option3").click(function(){
		 		 	location="user/user_info"
		 	 	});
	    	 $("#option5").click(function(){ 
		 		 	location="user/map"
		 	 	}); 
	    	 // 全选和全不选 
	    	 $("#slAll").change(function() {
	    	 		var flag = this.checked;
	    	 		$(".sl").each(function() {
	    	 			this.checked = flag;
	    	 		});
	    	 });
	    	 //失去子网掩码焦点
	    	  $("#yanma").blur(function(){
	    		 	checkyanma(); 
	    	 	});
	    	 //ip失去焦点
	    	 $("#serverIp").blur(function(){
	    		 	checkIp();
	    	 	});
	    	 $("#ip").blur(function(){
		 		 	checkIp1(); 
		 	 	});
	    	 $("#deIp").blur(function(){
		 		 	checkIp2(); 
		 	 	});
	    	 //端口失去焦点
	    	 $("#port").blur(function(){
	    		 	checkport();
	    	 	});
	    	 $("#port1").blur(function(){
	 		 		checkport1();
	 	 		});
	    	 //上报时间失去焦点
	    	 $("#sbtime").blur(function(){
	         		checksbTime();
	         	});
	    	 $("#sbtime1").blur(function(){
	     		//如果验证不通过，让当前元素获得焦点
	 	 			checksbTime1();
     	  	}); 
    		/* $("#update").click */
    		$("#devicename").blur(function(){
    			checkDevicename();
    		});
    	});
    	function checkDevicename(){
    		var v=$("#devicename").val();
    		var reg=/^[\u4e00-\u9fa5]{1,20}$/;
    		if(v==length){
    			$("#span").empty();//清空
        		$("#span").text("机柜名称必须填")
        		$("#span").css("color","red"); 
        		return false; 
    		}
    		if(!reg.test(v)){
    			$("#span").empty();//清空
        		$("#span").text("必须是汉字且不可超过20位")
        		$("#span").css("color","red"); 
        		return false; 
    		}
    		$("#span").html("&radic;")
    		$("#span").css("color","green"); 
    		return true; 
    	};
    	
    	//验证掩码
		function checkyanma(){
			var v=$("#yanma").val();
			var reg=/^(254|252|248|240|224|192|128|0)\.0\.0\.0|255\.(254|252|248|240|224|192|128|0)\.0\.0|255\.255\.(254|252|248|240|224|192|128|0)\.0|255\.255\.255\.(254|252|248|240|224|192|128|0)$/; 
			if(v.length==0){
        		$("#span16").empty();//清空
        		$("#span16").text("不能为空！")
        		$("#span16").css("color","red"); 
        		return false; 
        	}
			if(!reg.test(v)){
				$("#span16").empty();//清空
    			$("#span16").text("子网掩码格式不对！") 
    			$("#span16").css("color","red"); 
    			return false;
			}
			$("#span16").css("color","green"); 
			$("#span16").html("&radic;"); 
			return true;
    	}    	
    	
    	//验证ip
    	function checkIp1(){
    		var v=$("#ip").val();
    		var reg=/^(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)$/
    		if(v.length==0){
        		$("#span18").empty();//清空
        		$("#span18").text("ip还没填！") 
        		$("#span18").css("color","red"); 
        		return false; 
        	}
    		if(!reg.test(v)){
				$("#span18").empty();//清空
    			$("#span18").text("ip格式不对！") 
    			$("#span18").css("color","red"); 
    			return false;
			}
    		$("#span18").css("color","green"); 
			$("#span18").html("&radic;"); 
			return true;
    	}
    	//验证ip
    	function checkIp(){
    		var v=$("#serverIp").val();
    		var reg=/^(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)$/
    		if(v.length==0){
        		$("#span17").empty();//清空
        		$("#span17").text("ip还没填！") 
        		$("#span17").css("color","red"); 
        		return false; 
        	}
    		if(!reg.test(v)){
				$("#span17").empty();//清空
    			$("#span17").text("ip格式不对！") 
    			$("#span17").css("color","red"); 
    			return false;
			}
    		$("#span17").css("color","green"); 
			$("#span17").html("&radic;"); 
			return true;
    	}
    	//验证ip
    	function checkIp2(){
    		var v=$("#deIp").val();
    		var reg=/^(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)$/
    		if(v.length==0){
        		$("#span15").empty();//清空
        		$("#span15").text("ip还没填！") 
        		$("#span15").css("color","red"); 
        		return false; 
        	}
    		if(!reg.test(v)){
				$("#span15").empty();//清空
    			$("#span15").text("ip格式不对！") 
    			$("#span15").css("color","red"); 
    			return false;
			}
    		$("#span15").css("color","green"); 
			$("#span15").html("&radic;"); 
			return true;
    	}
    	
    	//验证端口号
    	function checkport(){
    		var v=$("#port").val();
    		if(v.length == 0){
    			$("#span20").text("机柜端口还没填！") 
    			$("#span20").css("color","red"); 
    			return false;
    		}
    		if(v<1||v>65535){
    			$("#span20").empty();//清空
    			$("#span20").text("超出范围！") 
    			$("#span20").css("color","red"); 
    			return false; 
    		}
    			$("#span20").css("color","green"); 
    			$("#span20").html("&radic;"); 
    			return true;
    	}
    	//验证端口号
    	function checkport1(){
    		var v=$("#port1").val();
    		if(v.length == 0){ 
    			$("#span19").text("不能不填！") 
    			$("#span19").css("color","red"); 
    			return false;
    		}
    		if(v<1||v>65535){ 
    			$("#span19").empty();//清空
    			$("#span19").text("超出范围！") 
    			$("#span19").css("color","red"); 
    			return false;
    		}
    			$("#span19").css("color","green"); 
    			$("#span19").html("&radic;"); 
    			return true;
    		
    	}
    	
    	 //心跳包间隔时间
    	function checksbTime1(){
    		var v=$("#sbtime1").val();
    		if(v.length == 0){ 
    			$("#span22").text("不能不填！") 
    			$("#span22").css("color","red"); 
    			return false;
    		}
    		if(v<1||v>255){
    			$("#span22").empty();//清空
    			$("#span22").text("范围要在1-255分钟！") 
    			$("#span22").css("color","red");
    			return false;
    		}
    			$("#span22").css("color","green"); 
    			$("#span22").html("&radic;"); 
    			return true;
    	}
    	//自动上报时间
    	function checksbTime(){ 
    		var v=$("#sbtime").val();
    		if(v.length == 0){ 
    			$("#span21").text("不能不填！") 
    			$("#span21").css("color","red"); 
    			return false;
    		}
    		if(v<1||v>255){
    			$("#span21").empty();//清空
    			$("#span21").text("范围要在1-255分钟！") 
    			$("#span21").css("color","red"); 
    			return false;
    		}else {
    			$("#span21").css("color","green"); 
    			$("#span21").html("&radic;");  
    			return true;
    		}
    	}
    	$(document).ready(function(){ 
     		// ----- 侧边悬浮 ----  
     		$(document).on("mouseenter", ".suspension .a", function(){
     			var _this = $(this); 
     			var s = $(".suspension"); 
     			var isService = _this.hasClass("a-service");
     			var isServicePhone = _this.hasClass("a-service-phone");
     			var isQrcode = _this.hasClass("a-qrcode");
     			if(isService){ s.find(".d-service").show().siblings(".d").hide();}
     			if(isServicePhone){ s.find(".d-service-phone").show().siblings(".d").hide();}
     			if(isQrcode){ s.find(".d-qrcode").show().siblings(".d").hide();}
     		});
     		$(document).on("mouseleave", ".suspension, .suspension .a-top", function(){
     			$(".suspension").find(".d").hide();
     		});
     		$(document).on("mouseenter", ".suspension .a-top", function(){
     			$(".suspension").find(".d").hide(); 
     		});
     		$(document).on("click", ".suspension .a-top", function(){
     			$("html,body").animate({scrollTop: 0});
     		});
     		$(window).scroll(function(){
     			var st = $(document).scrollTop();
     			var $top = $(".suspension .a-top");
     			if(st > 400){ 
     				$top.css({display: 'block'});
     			}else{ 
     				if ($top.is(":visible")) {
     					$top.hide();
     				}
     			}
     		});
     	}); 
    	$(function() {
    		$("form").submit(function() {
    			var flag = checkyanma()&checkIp()&checkIp1()&checkIp2()&checkport()&checkport1()&checksbTime()&checksbTime1()&checkDevicename();       
       			if(flag==0){
       				zeroModal.alert("验证不通过！"); 
    			}
    			return flag == 1 ? true : false; 
    		}); 
    	});
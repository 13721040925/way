$(function(){
		zeroModal.loading(5); 
		setTimeout(function(){
			//zeroModal.close(zeroModal.loading(6));  
			zeroModal.closeAll();  
		},500)  
    	 $("#logout1").click(function(){
    		 location="user/logout";
    		});  
    	 $("#option2").click(function(){
 		 		location="user/log"
 	 		});
    	 $("#option3").click(function(){
		 		location="user/user_info"
	 		});
    	 $("#option4").click(function(){ 
	 		 	location="user/device_manage"
	 	 	});
    	 $("#option5").click(function(){
	 		 	location="user/map"
	 	 	});
    	 $(".go").click(function(){
			 var pageNum=$("#pageNum").val();
			 location = "user/alert?pageNum=" + pageNum;    
		 	})
    	});
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
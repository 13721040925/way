$(function(){
    		$("#userid").blur(function(){  
    			var userid=$("#userid").val(); 
        		//alert(userid);      
    			/* if(userid==''){
    				alert("账号还没填！"); 
    				return false;
    			} */
        		$.ajax({ 
        			url:"user/veriftUserid",
        			async: false,
        			data:{"userid":userid},
        			success:function(res){
        				console.log(res);    
        				//alert(res);  
        				if(res==''){  
        					alert("该账号不存在！请重新输入"); 
        					location.reload(); 
        				}else{   
        					$("#tip").empty();//清空
        					$("#tip").text("账号验证通过!");
        					$("#tip").css("color","green");     
        				}
        			}
        		});
    		})
    		$("#phone").blur(function(){ 
    			checkphone(); 
	    	});
    		$("#veriftyzm").blur(function(){ 
    			checkyzm();  
	    	});
    		$("#password").blur(function(){
    			checkpass();  
    		})
    		  //发送验证码
    	    $("#btn-yzm").on("click", function(){
    	    		var flag=checkphone();
    	    		if(flag){
    	    			var number=$("#phone").val();   
            	    	//alert(number);   
        	    	        $.ajax({
        	    	            url: "user/sendSms",
        	    	            async : true, 
        	    	            type: "post",  
        	    	            dataType: "json", 
        	    	            data: {"number":number},  
        	    	            //请求成功后的回调函数 
        	    	            success: function (res) {  
        	    	                console.log(res);
        	    	                var str=JSON.stringify(res);//json转化为字符串
        	    	                str=str.substring(15,21);//截取字符串
        	    	                alert(str);//{"verifyCode":"263933","createTime":1544679013150} 
        	    	                //return true;
        	                 	//alert("发送验证码成功！"); 
        	    	            },  
        	    	          	//请求失败的回调函数
        	    				error:function(res){ 
        	    					alert("发送失败！"); 
        	    						//return false;   
        	    				}
        	    	       });    
    	    		}
    	    	});
    		//提交  验证验证码  
    	});
    	//验证码倒计时
	     var countdown=60;
		 function settime(ph) {
			 var flag=checkphone();
			 //alert(flag);
			 if(flag){  
				 if (countdown == 0) {
			    	  ph.removeAttribute("disabled");//删除disabled属性
			    	  $("#btn-yzm").text("获取验证码"); 
			    	  $("#btn-yzm").css("width","100px");     
			            countdown = 60;
			      }else {
			    	  ph.setAttribute("disabled", true);// 添加属性参数1 属性 参数2 赋值。不能单机
			    	  $("#btn-yzm").text("已发送(" + countdown + ")"); 
			    	  $("#btn-yzm").css("width","100px");  
			          countdown--; 
			      }
			      setTimeout(function() { 
			            settime(ph); 
			      },1000);
			 	} else{
			 		alert("手机号有误！不能获取验证码")  
			 	}
			 }
		 //验证手机号
		 function checkphone(){
			    var phone=$("#phone").val(); 
				var userid=$("#userid").val(); 
				var flag=true;
				$.ajax({
					url:"user/veriftPhone", 
					async: false, 
					data: {"userid":userid,"phone":phone}, 
					success:function(res){
						console.log(res); 
						if(res==''){   
							$("#tip1").empty();//清空
					 		$("#tip1").text("手机号与账户绑定的不相同")
					 		$("#tip1").css("color","red");  
					 		flag=false; 
					 		return; 
						}else{   
					 		$("#tip1").empty();//清空
							 /*$("#tip1").text("ok!")
					 		$("#tip1").css("color","green"); */ 
							flag=true;
							//alert("2"+flag);
							return;
						} 
					}
				}); 
				//alert("1"+flag);
				if(flag){
					return true;
				}else{
					return false;
				}
		 }
		 //验证验证码
		 function checkyzm(){
			 var yzm=$("#veriftyzm").val();
			 if(yzm.length!=6){  
				 $("#tip2").empty();//清空
				 $("#tip2").text("验证码为6位数")
				 $("#tip2").css("color","red");    
				 return false;
			 }
			 if(yzm.length==6){
			 $("#tip2").empty();//清空
			 verifyCode = $("#veriftyzm").val();
			 var flag=false; 
	 	       $.ajax({  
	 	            url: "user/register", 
	 	            async : false,
	 	            type: "post",   
	 	            dataType: "json",
	 	            data: {"verifyCode":verifyCode},
	 	            success: function (res) { 
	 	            	console.log(res);
	 	            	var str=JSON.stringify(res);//json转化为字符串
	 	            	//var msg=str.substring(1,6);//验证码过期
	 	                str=str.substring(15,21);//截取字符串 
	 	               	//alert("您输入的="+verifyCode); 
	 	               // alert("验证码是="+str);
	 	               //alert(msg);  
//	 	               if(msg.equals("验证码过期")){   
//	 	            		alert("验证码过期");  
//	 	            		flag=false;
//	 	            	}
	 	                if(verifyCode==""){
	 	                	alert("请输入你收到的验证码！") 
	 	                	flag=false; 
	 	                }
	 	                if(verifyCode!=str){
	 	                	$("#tip2").empty();//清空
					 		$("#tip2").text("验证码错误")
					 		$("#tip2").css("color","red"); 
					 		flag=false;
	 	                }
	 	                if(verifyCode==str){
	 	                	$("#tip2").empty();//清空 
	 	                	flag=true; 
	 	                	//alert("1"+flag);
	 	                }
	 	            } 
	 	       }); 
	 	        if(flag){
					return true;
				}else{
					return false; 
				}
		 	}
		 }
		 //验证密码
		 function checkpass(){
			 var pass=$("#password").val();
			 //alert(pass);
			 if(pass.length<6||pass.length>12){ 
				 $("#tip3").empty();//清空
				 $("#tip3").text("密码长度必须在6~12位");
				 $("#tip3").css("color","red");    
				 return false;
			 }
			 $("#tip3").empty();//清空
			 return true;
		 }
		 //表单验证 
		 $(function() {
    		$("form").submit(function() {
    			var flag = checkphone()&checkpass()&checkyzm(); //
    			if(flag==0){
    				alert("验证码错误  或  验证码过期！");  
    			}else{
    				alert("密码已修改！请重新登录！")
    			}
    			/* if(flag==1){
    				location="user/updatePass";
    			} */
    			return flag == 1 ? true : false;  
    		});
    	});
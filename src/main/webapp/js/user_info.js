$(function(){
		 setTimeout(function(){popup({type:'tip',msg:"登录超时！",delay:null});location="user/logout"},1800000);  
		 $("#lastyz").hide();
	   	 $("#logout1").click(function(){ 
	   		location="user/logout"; 
	   		});    
	   	 $("#option").click(function(){
	   		zeroModal.alert("请从设备管理—>操作 查看此页面！"); 
	   	 	});  
	   	 $("#option1").click(function(){
			 	location="user/alert"  
		 		});
	   	 $("#option2").click(function(){
	 		 	location="user/log"    
	 	 		});
	   	 $("#option4").click(function(){
		 		 	location="user/device_manage"
		 	 	});  
	   	 $("#option5").click(function(){
		 		 	location="user/map"
		 	 	});
	   	 //验证手机号 
	   	 $("#yzm-phone").blur(function(){
					checkphone();	    		  
	   	 })
	   	 //验证验证码
	   	 $("#inp-yzm").blur(function(){
	   		 	checkInpyzm();
	   	 }) 
	    /* //发送验证码
	    $("#phone").on("click", function(){
	    	var number;
	    	$.ajax({url:"user/phone",async: false,data: {"number":number},success:function(res){console.log(res);var st=JSON.stringify(res);number=st}});  
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
	    });
 	//提交  验证验证码 
	 	    $("#go-yzm").click(function(){
	 	    	verifyCode = $("#inp-yzm").val();
		 	       $.ajax({ 
		 	            url: "user/register", 
		 	            async : true,
		 	            type: "post",   
		 	            dataType: "json",
		 	            data: {"verifyCode":verifyCode},
		 	            success: function (res) { 
		 	            	console.log(res);
		 	            	var str=JSON.stringify(res);//json转化为字符串
		 	                str=str.substring(15,21);//截取字符串 
		 	               	//alert("您输入的="+verifyCode); 
		 	               // alert("验证码是="+str); 
		 	                if(verifyCode==""){
		 	                	alert("请输入你收到的验证码！") 
		 	            		return false;    
		 	                }
		 	                if(verifyCode!=str){
		 	                	alert("验证码错误！") 
		 	            		return false;   
		 	                }
		 	            	if(verifyCode==str){ 
		 	            		yzadd();
		 	            		//location="";
		 	            	} 
		 	                //return true;
		 	            } 
		 	       });
	 	    })*/
	});
	// 验证手机号
	 function checkphone(){
		var v=$("#yzm-phone").val(); 
		//var reg=/^0?(13|14|15|18|17)[0-9]{9}$/;
		if(v.length==0){
			$("#yzm-sp").empty();//清空
	   		$("#yzm-sp").text("手机号还没填！")
	   		$("#yzm-sp").css("color","red");  
 		return false; 
		}
		/* if(!reg.test(v)){
			$("#yzm-sp").empty();//清空
			$("#yzm-sp").text("手机号格式不对！") 
			$("#yzm-sp").css("color","red"); 
			return false; 
		} */ 
		//验证手机号是否与数据库相同！
		//
		$("#yzm-sp").css("color","green"); 
		$("#yzm-sp").html("手机号格式正确"+"&radic;"); 
		return true;
	} 
	 //验证验证码
	function checkInpyzm(){
		var v=$("#inp-yzm").val();
		if(v.length!=6){
			$("#yzm-sp").empty();//清空
 		$("#yzm-sp").text("验证码格式不对！")
 		$("#yzm-sp").css("color","red"); 
			return false;
		}
		//$("#yzm-sp").empty();//清空
		$("#yzm-sp").css("color","green"); 
		$("#yzm-sp").html("验证码格式正确"+"&radic;"); 
	} 
	//添加用户
	 function adduser(){
		 var flag=checkphone(); 
		 var flag1=checkInpyzm();
		 if(flag==false){ 
			 zeroModal.error("还没验证！");
			 return false; 
		 }  
		 if(flag1==false){
			 zeroModal.error("请获取验证码！"); 
			 return false;  
		 }  
		 zeroModal.success("点击验证,验证通过后即可添加！") 
	  }
	//验证完 添加用户
	function yzadd(){
		$("#lastyz").show();
		/* location="user/toaddUser";  */
	}
	 //获取验证码
	 var countdown=60;
		 function settime(ph) {
			 var flag=checkphone(); 
			 if(flag==false){ 
				 zeroModal.error("手机号不对 不能验证！")
		         return false;  
			 }else{  
				 if (countdown == 0) {
			    	  ph.removeAttribute("disabled");//删除disabled属性
			    	  $("#phone").text("重新获取"); 
			    	  $("#phone").css("width","110px");   
			            countdown = 60;
			            return false; 
			      }else {
			    	  ph.setAttribute("disabled", true);// 添加属性参数1 属性 参数2 赋值。不能单机
			    	  $("#phone").text("重新获取(" + countdown + ")"); 
			    	  $("#phone").css("width","110px");  
			          countdown--; 
			      }
			      setTimeout(function() { 
			            settime(ph); 
			      },1000);
			 } 
	 	}
	//重复点击
//	 var a=["你点了一下我","你又点了一下我","你点了第三下我"];
//	 var flag=0;
//	 function giveubitch(){
//		          if(flag>2){
//		             flag=0;   
//		         }
//		             $("#any").text(a[flag]);
//		         flag++;
//		  }
	 //
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
	 //container: '#tip3', /* 自定义错误信息的位置 */
	 $(document).ready(function() {
		 $('#adduser').bootstrapValidator({   
			 message: 'This value is not valid',/* 小对勾 小红叉 */
			 feedbackIcons: {
				 valid: 'glyphicon glyphicon-ok',
				 invalid: 'glyphicon glyphicon-remove',
				 validating: 'glyphicon glyphicon-refresh'
			 },
			 fields: {/*验证*/
					userid:{/*和input name值对应*/
						message: 'The username is not valid',
						validators: {
							 notEmpty: {/*非空提示*/
		                            message: '用户名不能为空'
							 }, 
							 stringLength: {/*长度提示*/
			                        min: 6,
			                        max: 18,
			                        message: '用户名长度必须在6到18之间'
			                  },
			                  regexp: {/* 只需加此键值对，包含正则表达式，和提示 */
		                            regexp: /^[a-zA-Z0-9_\.]+$/, 
		                            message: '只能是数字或字母'
		                      } 
						}
					},
					password:{
						message:'密码无效',
	                    validators: {
	                        notEmpty: {
	                            message: '密码不能为空'
	                        },
	                        stringLength: {
	                            min: 6,
	                            max: 18,
	                            message: '用户名长度必须在6到18之间' 
	                        }
	                    }
					},
					phone:{
						message:'密码无效',
	                    validators: { 
	                        notEmpty: {
	                            message: '手机号不能为空'
	                        },
	                        regexp: { 
	                            regexp: "^([0-9]{11})?$",
	                            message: '手机号码格式错误'
	                        }
	                    } 
					} 
				}
		 	});
	     });
	 /*  window.onbeforeunload = function(event) {
		     event.returnValue = "我在这写点东西..."; 
	 };  */
	 $("#submitBtn").click(function () {
	        //进行表单验证
	        var bv = form.data('bootstrapValidator');
	        bv.validate();
	        if (bv.isValid()) {
	            console.log(form.serialize());
	            //发送ajax请求
	            $.ajax({
	                url: 'validator.json',
	                async: false,//同步，会阻塞操作
	                type: 'GET',//PUT DELETE POST 
	                data: form.serialize(),
	                complete: function (msg) {
	                    console.log('完成了'); 
	                },
	                success: function (result) {
	                    console.log(result);
	                    if (result) {
	                        window.location.reload();
	                    } else {
	                        $("#returnMessage").hide().html('<label class="label label-danger">添加失败!</label>').show(300);
	                    }
	                }, error: function () {
	                    $("#returnMessage").hide().html('<label class="label label-danger">添加失败!</label>').show(300);
	                }
	            })
	        }
	    });
	 $(function(){
			zeroModal.loading(5);  
			setTimeout(function(){
				//zeroModal.close(zeroModal.loading(6));  
				zeroModal.closeAll();  
			},500)  
			//zeroModal.show("添加成功！"); 
			
			$("#ph").blur(function(){
				checkUserid();   
			});
		})
		function checkUserid(){
			var userid=$("#id").val(); 
			$.ajax({
				url:"user/veriftUserid",
				async:false,
				data:{"userid":userid},
				success:function(res){
					console.log(res); 
					if(res!=""){    
						//popup({type:'error',msg:"该用户名已存在！",delay:1000,callBack:function(){ 
							alert("该用户名已存在！");
							location="user/user_info";      
				        //}});
					}
				}
			})
		};
	 
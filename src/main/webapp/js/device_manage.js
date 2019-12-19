$(function(){ 
//	var GG="${GG}";
//	if(GG.length>0){ 
//		zeroModal.show({
//		       title: '用户公告', 
//		       content: '请遵守用户规则 谨慎操作 , 每一步操作都要负法律责任！',
//		       ok: true,
//		       //cancel: true,   
//		   });  
//	}
//			zeroModal.loading(5);  
//			setTimeout(function(){
//				//zeroModal.close(zeroModal.loading(6));  
//				zeroModal.closeAll();  
//			},500) 
    		setTimeout(function(){popup({type:'tip',msg:"登录超时！",delay:null});location="user/logout"},1800000);  
    		$("#fis").css("color","#F0F0F0");
    		$("#fis").css("background","#286090");
    		$(".go").click(function(){   
    			var pageNum = $("#pageNum").val();
    			var deviceId = $("#deviceId").val();   
    			location = "user/device_manage?deviceId=" + deviceId + "&pageNum=" + pageNum; 
    		});
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
    	 $("#option3").click(function(){ 
		 		location="user/user_info"
	 		});
    	 $("#option5").click(function(){
	 		 	location="user/map"
	 	 	});
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
    	$(document).ready(function() {
   		    $('#addjigui').bootstrapValidator({ 
   		     excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件
   		     //submitButtons: '#mytest',   
   		     live: 'enabled',//enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
   		     message: 'This value is not valid', 
	   		 feedbackIcons: {//根据验证结果显示的各种图标
				 valid: 'glyphicon glyphicon-ok',
				 invalid: 'glyphicon glyphicon-remove',
				 validating: 'glyphicon glyphicon-refresh'
			 },
   			 fields: {/*验证*/  
   				deviceId:{/*和input name值对应*/
   						validators: {
   							 notEmpty: {/*非空提示*/
   		                            message: '机柜ID不能为空'
   							 }, 
   							 stringLength: {/*长度提示*/
   			                        min: 7,
   			                        max: 7,
   			                        message: '机柜ID长度必须为7位' 
   			                  },
   			                  regexp: {/* 只需加此键值对，包含正则表达式，和提示 */
   		                            regexp: /^[0-9_\.]+$/, 
   		                            message: '只能是数字'
   		                      } 
   						}
   					},
   					devicename:{
   	                    validators: {
   	                        notEmpty: {
   	                            message: '机柜名不能为空'
   	                        },
   	                        regexp: { 
   	                            regexp: /^[\u4e00-\u9fa5]+$/, 
   	                            message: '只能汉字！'  
   	                        }
   	                    }
   					},
   					lng:{
   	                    validators: { 
   	                        notEmpty: {
   	                            message: '经度不能为空'
   	                        },
   	                        regexp: { 
   	                            regexp: /^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,6})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,6}|180)$/,
   	                            message: '经度格式错误' 
   	                        }
   	                    } 
   					},
   					lat:{ 
   	                    validators: { 
   	                        notEmpty: {
   	                            message: '纬度不能为空'
   	                        },
   	                        regexp: { 
   	                            regexp: /^(\-|\+)?([0-8]?\d{1}\.\d{0,6}|90\.0{0,6}|[0-8]?\d{1}|90)$/, 
   	                            message: '纬度格式错误'
   	                        }
   	                    } 
   					} 
   				}
   		 	});
   	 });
    	/*$("#submitBtn").click(function () {
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
	    });*/ 
    	$(function(){  
        	$("#Id").blur(function(){  
        		checkdeviceId(); 
        	})
        });
        //验证机柜名是否存在
        function checkdeviceId(){
        	var deviceId=$("#Id").val();
        	$.ajax({  
        		url:"user/veriftdeviceId",
        		async: false,
        		data:{"deviceId":deviceId},
    			success:function(res){
    				console.log(res);
    				//alert(res);      
    				if(res!=""){ 
    					alert("该机柜名已存在！请重新输入！"); 
						location="user/device_manage";      
    				}
    			}    		
        	})
        }
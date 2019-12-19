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
  						zeroModal.confirm({
  				            content: "该账号正在别处登录中！继续登录？",
  				            contentDetail: '不会对其他设备造成影响', 
  				            okFn: function() {
  				            	location="user/login?userid="+userid+"&password="+password;
  				            },
  				            cancelFn: function() {
  				            	location.reload(); 
  				            } 
  				        });
  					  }
  					  if(state1=="2"){
  						  location="user/login?userid="+userid+"&password="+password;
  					  }
  					  if(state1=="0"){
  						zeroModal.alert("账号或密码错误！");
  						//location.reload();   
  					  }
  				  }
    		    })    
    		});
    	});
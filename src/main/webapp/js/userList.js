
// 2、点击跳转功能
$(function() {
	$(".go").click(function() {
		location = "user/user_info?pageNum=" + $("#pageNum").val();  
	});
});

// 3、全选和全不选
$(function() {
	$("#slAll").change(function() {
		var flag = this.checked;
		$(".sl").each(function() {
			this.checked = flag;
		});
	});
});

// 4、执行批量删除
$(function() {
	$(".delSelected").click(function() {
		var arr = [];
		$(".sl").each(function() {
			if (this.checked) {
				arr.push(this.value);
			}
		});
		if (arr.length == 0) {
			zeroModal.error("你还没选择要删除的数据！");
		} else {
			// 执行删除
			zeroModal.confirm({
		            content: "确认删除吗？",
		            contentDetail: '删除后 不可撤回！', 
		            okFn: function() {
		            	location = "user/delSelected?arr=" + arr;
		            	zeroModal.success; 
		            },
		            cancelFn: function() { 
		            	location.reload(); 
		            } 
		        });
//			var flag = confirm("确认删除吗？"); 
//			if (flag) {
//				location = "user/delSelected?arr=" + arr;
//			} 
		}
	});
});
 
// 5、单个删除
/*$(function() {
	var href;
	$(".removeUser").click(function(e) {
		e.preventDefault();
		$(".zhezhao").css("display", "block");
		$("#removeUse").fadeIn();
		href = this.href;
	});

	$("#no").click(function() {
		$(".zhezhao").css("display", "none");
		$("#removeUse").fadeOut();
	});

	$("#yes").click(function() {
		// 设置post同步
		// $.ajaxSettings.async = false;
		// alert(href);
		$.get(href, function(res) {
			console.log(res);
			alert("成功删除" + res.result + "条");
			$(".zhezhao").css("display", "none");
			$("#removeUse").fadeOut();
			location.reload();
		}, "json");
		// 设置post异步
		// $.ajaxSettings.async = true;
	});
});*/

// 6、导出excel文件.checkOutxls
$(function() {
	$(".checkOutxls").click(function() {
		// 获得id存放到数组中提交给controller
		let arr = [];
		$.each($(".sl"), function() {
			if (this.checked) {
				arr.push(this.value);
			}
		});
		// 判断是否提交
		if (arr.length == 0) {
			alert("请选择要导出的数据！");
		} else {
			location = "user/checkOutxls?arr=" + arr;
		}
	});
});

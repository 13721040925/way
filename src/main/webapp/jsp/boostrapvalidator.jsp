<%-- <%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.min.css"/>
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script> 
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>  
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script> 
<style type="text/css">
</style>
<script type="text/javascript">
$(function(){
	$(".form_datetime").datetimepicker({
        format: "dd MM yyyy - hh:ii",
        autoclose: true,
        todayBtn: true,
        startDate: "2013-02-14 10:00",
        minuteStep: 10
    });
})
$(document).ready(function() {
    /**
     * 下面是进行插件初始化
     * 你只需传入相应的键值对
     * */
    $('#formyz').bootstrapValidator({
            //message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok', //有效
                invalid: 'glyphicon glyphicon-remove',// 无效
                validating: 'glyphicon glyphicon-refresh' // 验证
            },
            fields: {/*验证*/
                username: {/*键名username和input name值对应*/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '用户名不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min: 6,
                            max: 30,
                            message: '用户名长度必须在6到30之间'
                        }/*最后一个没有逗号*/,
                        regexp: {/* 只需加此键值对，包含正则表达式，和提示 */
                            regexp: /^[a-zA-Z0-9_\.]+$/, 
                            message: '只能是数字或字母'
                        } 
                    }
                },
                password: {
                    message:'密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '用户名长度必须在6到30之间'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空！'
                        },
                        emailAddress: {
                            message: '邮箱格式不对！'
                        }
                    }
                }
            } 
        });
});

/* notEmpty：非空验证；
stringLength：字符串长度验证；
regexp：正则表达式验证；
emailAddress：邮箱地址验证（都不用我们去写邮箱的正则了~~）
除此之外，在文档里面我们看到它总共有46个验证类型，我们抽几个常见的出来看看：
base64：64位编码验证；
between：验证输入值必须在某一个范围值以内，比如大于10小于100；
creditCard：身份证验证；
date：日期验证；
ip：IP地址验证； 
numeric：数值验证；
phone：电话号码验证；
uri：url验证 */
</script>
</head>
<body>
	<div class="container">
            <!-- class都是bootstrap定义好的样式，验证是根据input中的name值 -->
            <form id="formyz" method="post" class="form-horizontal" action=""> 
                <!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
                <div class="form-group">
                    <label class="col-lg-3 control-label">用户名</label> 
                    <div class="col-lg-3">
                        <input type="text" class="form-control" name="username" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">邮箱</label>
                    <div class="col-lg-3">
                        <input type="email" class="form-control" name="email" /> 
                    </div>
                </div> 

				<div class="form-group">
                    <label class="col-lg-3 control-label">日期</label>
                    <div class="col-lg-3">
                        <input type="date" class="form-control" name="date" /> 
                    </div>
                </div> 
				
                <div class="form-group">
                    <label class="col-lg-3 control-label">密码</label> 
                    <div class="col-lg-3">
                        <input type="password" class="form-control" name="password" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-lg-9 col-lg-offset-3"> 
                        <button type="submit" class="btn btn-primary">添加</button>
                    </div>
                </div> 
               <div class="input-append date form_datetime" data-date="2013-02-21T15:25:00Z">
				    <input size="16" type="text" value="" readonly>
				    <span class="add-on"><i class="icon-remove"></i></span>
				    <span class="add-on"><i class="icon-calendar"></i></span>
				</div>
            </form>
	</div> 
	<div class="container">
    <h3>创建模态框（Modal）</h3>
    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">点击我显示模态框</button>
    <!--  定义模态框触发器，此处为按钮触发  -->

    <form method="post" action="#" class="form-horizontal" role="form" id="myForm" onsubmit="return ">
        <div class="modal fade" id="myModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <!--  定义模态框，过渡效果为淡入，id为myModal,tabindex=-1可以禁用使用tab切换，aria-labelledby用于引用模态框的标题，aria-hidden=true保持模态框在触发前窗口不可见  -->
            <div class="modal-dialog">
                <!--  显示模态框对话框模型（若不写下一个div则没有颜色）  -->
                <div class="modal-content">
                    <!--  显示模态框白色背景，所有内容都写在这个div里面  -->

                    <div class="btn-info modal-header">
                        <!--  模态框标题  -->
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <!--  关闭按钮  -->
                        <h4>您好，欢迎进入模态框</h4>
                        <!--  标题内容  -->
                    </div>

                    <div class="modal-body">
                        <!--  模态框内容，我在此处添加一个表单 -->
                            <div class="form-group">
                                <label for="uname" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-9">
                                    <input type="text" id="uname" name="uname" class="form-control well" placeholder="请输入用户名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="upwd" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-9">
                                    <input type="password" id="upwd" name="upwd" class="form-control well" placeholder="请输入密码"/>
                                </div>
                            </div>
                    </div>

                    <div class="modal-footer">
                        <!--  模态框底部样式，一般是提交或者确定按钮 -->
                        <button type="submit" class="btn btn-info">确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>

                </div><!-- /.modal-content -->
            </div>
        </div> <!-- /.modal -->
    </form>
</div>
<div class="container text-center">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">修改信息</button>
</div>
<div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">用户信息修改</h4>
            </div>
 
            <div class="modal-body">
                <form id="updateform">
                    <div class="form-group">
                        <label for="loginname" class="control-label">用户名:</label>
                        <input type="text" class="form-control" id="loginname" name="loginname">
                    </div>
                    <div class="form-group">
                        <label for="email" class="control-label">Email:</label>
                        <input type="text" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="phone" class="control-label">电话:</label>
                        <input type="text" class="form-control" id="phone" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="address" class="control-label">收货地址:</label>
                        <textarea class="form-control" id="address" name="address"></textarea>
                    </div>
                    <div class="text-right">
                        <span id="returnMessage" class="glyphicon"> </span>
                        <button type="button" class="btn btn-default right" data-dismiss="modal">关闭</button>
                        <button id="submitBtn" type="button" class="btn btn-primary">修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript'>
    var form = $('#updateform');
    $(document).ready(function () {
 
        form.bootstrapValidator({
            message: '输入值不合法',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                loginname: {
                    message: '用户名不合法',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 3,
                            max: 30,
                            message: '请输入3到30个字符'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\. \u4e00-\u9fa5 ]+$/,
                            message: '用户名只能由字母、数字、点、下划线和汉字组成 '
                        }
                    }
                }
                , email: {
                    validators: {
                        notEmpty: {
                            message: 'email不能为空'
                        },
                        emailAddress: {
                            message: '请输入正确的邮件地址如：123@qq.com'
                        }
                    }
                }, phone: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        regexp: {
                            regexp: "^([0-9]{11})?$",
                            message: '手机号码格式错误'
                        }
                    }
                }, address: {
                    validators: {
                        notEmpty: {
                            message: '地址不能为空'
                        }, stringLength: {
                            min: 8,
                            max: 60,
                            message: '请输入5到60个字符'
                        }
                    }
                }
            }
        });
    });
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
                        $("#returnMessage").hide().html('<label class="label label-danger">修改失败!</label>').show(300);
                    }
                }, error: function () {
                    $("#returnMessage").hide().html('<label class="label label-danger">修改失败!</label>').show(300);
                }
            })
        }
    }); 
 
</script>
</body>
</html> --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>
	<meta charset="UTF-8">
	<title>图书管理系统</title>
	<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<div class="pen-title">
	  	<h1>Flat Login Form</h1><span>Pen <i class='fa fa-paint-brush'></i> + <i class='fa fa-code'></i> by <a href=''>Andy Tran</a></span>
	</div>
	<div class="module form-module">
	  	<div class="toggle"><i class="fa fa-times fa-pencil"></i>
	  	</div>
	  	<div class="form">
	    	<h2>Login to your account</h2>
		      	<input type="text" placeholder="Username" name="UserName" id="UserName" autocomplete="off" class="layui-input"/>
		      	<input type="password" placeholder="Password" name="PassWord" id="PassWord" autocomplete="off" class="layui-input"/>
		      	<button class="layui-btn layui-btn-normal" id="Signin">Login</button>
	  	</div>
	</div>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	
	<script  src="js/index.js"></script>
	<script  src="../LayUI/layui.js"></script>
	<script>
	layui.use('table', function() {
		var table = layui.table;
		var $ = layui.$;
		
		 $("#UserName").focus();

		    $("#Signin").click(function () {
		        const data = {
		            number: $("#UserName").val(),
		            passWord: $("#PassWord").val(),
		            userType: 0
		        };

		        $.ajax({
		            type: "post",           
		            url: "/bms/Security/login",
		            data: data,
		            success: function (result) {
		                if (result.code ==0) {
		                    if (result.data.isAdmin) {
		                   		window.location.href="/bms/Pages/Admin/Admin.jsp";
		                    }
		                    else
		                    {
		                    	window.location.href="/bms/Pages/Operator/Operator.jsp";
		                    }

		                }
		                else {
		                    alert("用户名或密码错误");
		                }
		            },
		            error: function (err) {
		                alert(err);
		            }
		        });
		    });
	});
	</script>

</body>
</html>

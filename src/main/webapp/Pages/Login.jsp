<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <% String
path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh">
  <head>
    <meta charset="UTF-8" />
    <title>图书管理系统</title>
    <link rel="stylesheet" href="<%=path %>/LayUI/css/style.css" />
  </head>

  <body>
    <div class="pen-title">
      <h1>图书管理系统</h1>
      <span>Library <a>Management System</a></span>
    </div>
    <div class="module form-module">
      <div class="toggle"><i class="fa fa-times fa-pencil"></i></div>
      <div class="form">
        <h2>登录到您的帐号</h2>
        <input
          type="text"
          placeholder="Username"
          name="UserName"
          id="UserName"
          autocomplete="off"
          class="layui-input"
        />
        <input
          type="password"
          placeholder="Password"
          name="PassWord"
          id="PassWord"
          autocomplete="off"
          class="layui-input"
        />
        <button class="layui-btn layui-btn-normal" id="Signin">Login</button>
      </div>
	</div>
	
    <script src="<%=path %>/LayUI/jquery-3.2.1.min.js"></script>
    <script src="<%=path %>/LayUI/index.js"></script>
    <script src="<%=path %>/LayUI/layui.js"></script>
    <script>
      layui.use("table", function() {
        var table = layui.table;
        var $ = layui.$;

        $("#UserName").focus();

        $("#Signin").click(function() {
          const data = {
            number: $("#UserName").val(),
            passWord: $("#PassWord").val(),
            userType: 0
          };

          $.ajax({
            type: "post",
            url: "<%=path %>/Security/login",
            data: data,
            success: function(result) {
              if (result.code == 0) {
                if (result.data.isAdmin) {
                  window.location.href = "<%=path %>/Pages/Admin/Admin.jsp";
                } else {
                  window.location.href =
                    "<%=path %>/Pages/Operator/Operator.jsp";
                }
              } else {
                alert("用户名或密码错误");
              }
            },
            error: function(err) {
              alert(err);
            }
          });
        });
      });
    </script>
  </body>
</html>

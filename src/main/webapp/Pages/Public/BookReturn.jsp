<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<% String path = request.getContextPath(); %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="<%=path %>/LayUI/css/layui.css" />
  </head>
  <body>
    <br />
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">图书条码</label>
        <div class="layui-input-inline">
          <input
            type="tel"
            name="phone"
            id="bookBarCode"
            lay-verify="required|phone"
            autocomplete="off"
            class="layui-input"
          />
        </div>
      </div>
      <div class="layui-inline">
        <div class="layui-input-inline">
          <button class="layui-btn layui-btn-sm" id="returnBooks">还书</button>
        </div>
      </div>
    </div>
  </body>

  <script src="<%=path %>/LayUI/layui.js"></script>
  <script src="<%=path %>/LayUI/jquery-3.2.1.min.js"></script>
  <script>
  layui.use(["table", "form"], function() {

  $("#returnBooks").click(function() {
   	  const bookBarCode = $("#bookBarCode").val();
      data={
    	bookBarcode: bookBarCode
      };
      $.ajax({
          type: "post", //要用post方式
          url: "<%=path %>/BookBorrowing/sendBack", //方法所在页面和方法名
          data: data,
          success: function(result) {
            if (result.code == 0) {
            	$("#bookBarCode").val("");
            	layer.msg("归还成功", {
                    icon: 1,
                    time: 1000,
                    zIndex: layer.zIndex
                  });
            } else {
            	layer.msg(result.msg, {
                    icon: 5,
                    time: 1000,
                    zIndex: layer.zIndex
                  });
            }
          }
      });
    });
  });
  </script>
</html>

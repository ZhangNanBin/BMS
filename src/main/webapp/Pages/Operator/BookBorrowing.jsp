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
	<br>
	<div class="layui-form-item">
	    <div class="layui-inline">
		    <label class="layui-form-label">图书条码</label>
		    <div class="layui-input-inline">
		        <input type="tel" name="phone" id="bookBarCode" lay-verify="required|phone" autocomplete="off" class="layui-input">
		    </div>
	    </div>
	    <div class="layui-inline">
		   	<label class="layui-form-label">读者编号</label>
		    <div class="layui-input-inline">
		     	<input type="text" name="email" id="readerNumber" lay-verify="email" autocomplete="off" class="layui-input">
		    </div>
	    </div>
	    <div class="layui-inline">
		    <div class="layui-input-inline">
		     	<button class="layui-btn layui-btn-sm" id="borrowBooks">借书</button>
		    </div>
	    </div>
  	</div>
</body>

<script src="<%=path %>/LayUI/layui.js"></script>
<script>
	$("#borrowBooks").click(function () {
		$.ajax({
            type: "post", 
            url: "<%=path %>/BookBorrowing/borrowing",//方法所在页面和方法名
            contentType: "application/json; charset=utf-8",
            data: {
            	
            },
            dataType: "json",
            success: function (data) {
        		layer.close(layer.index);
            	if(data.code==0)
            	{
                    table.reload("demo");
            	}
            	else
                {
                	layer.msg(data.msg);
                }
            },
            error: function (err) {
                layer.close(layer.index);
                layer.msg(err.responseJSON.Message, {
                    icon: 5,
                    time: 1000
                });
            }
        })
	});
</script>
</html>

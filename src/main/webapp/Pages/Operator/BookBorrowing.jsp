<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="../../LayUI/css/layui.css" />
</head>
<body>
	<div class="layui-inline">
      <div class="layui-input-inline">
        <input type="tel" name="phone" lay-verify="required|phone" placeholder="请输入图书编号" autocomplete="off" class="layui-input" style="width:300px">
      	<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      </div>
    </div>
    <div class="layui-inline">
      <div class="layui-input-inline">
        <input type="tel" name="phone" lay-verify="required|phone" placeholder="请输入图书编号" autocomplete="off" class="layui-input" style="width:300px">
      <label class="layui-form-label">验证手机</label>
      </div>
    </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</body>

<script src="../../LayUI/layui.js"></script>
<script>
    
</script>
</html>

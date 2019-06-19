<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <% String
path = request.getContextPath(); %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="<%=path %>/LayUI/css/layui.css" />
  </head>
  <body style="width: 98%; margin: auto">
    <br />

    <table id="demo" lay-filter="demo"></table>
    <script type="text/html" id="toolbarDemo">
      <div class="layui-form-item">
             <div class="layui-inline">
              <label class="layui-form-label">编号</label>
              <div class="layui-input-inline">
                  <input type="tel" name="bookNumber" id="bookNumber" autocomplete="off" class="layui-input">
              </div>
             </div>
             <div class="layui-inline">
             	<label class="layui-form-label">名称</label>
              <div class="layui-input-inline">
               	<input type="text" name="bookName" id="bookName" autocomplete="off" class="layui-input">
              </div>
             </div>
             <div class="layui-inline">
              <div class="layui-input-inline">
               	<button class="layui-btn layui-btn-sm" lay-event="Search">搜索</button>
               	<button class="layui-btn layui-btn-sm" lay-event="Reset">重置</button>
          		<button class="layui-btn layui-btn-sm" lay-event="AddInfo">添加</button>
              </div>
             </div>
      	    </div>
    </script>
    <script type="text/html" id="barDemo">
      <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </script>
  </body>

  <script type="text/html" id="editInfo">
    <form class="layui-form" lay-filter="formTestFilter">
       <input type="hidden" name="id" id="id" value="...">
       <div style="width: 80%; margin: auto; text-align: center; margin-top: 5%">
           <div class="layui-form-item">
               <label class="layui-form-label">图书编号</label>
               <div class="layui-input-block">
                   <input type="text" name="number" id="number" required lay-verify="required"  autocomplete="off" class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">类别编号</label>
               <div class="layui-input-block">
                   <input type="text" name="categoryNumber" id="categoryNumber" required lay-verify="required"  autocomplete="off" class="layui-input">
               </div>
           </div>
    	<div class="layui-form-item">
               <label class="layui-form-label">图书名称</label>
               <div class="layui-input-block">
                   <input type="text" name="name" id="name" required lay-verify="required"  autocomplete="off" class="layui-input">
               </div>
           </div>
    	<div class="layui-form-item">
               <label class="layui-form-label">作者</label>
               <div class="layui-input-block">
                   <input type="text" name="author" id="author" required lay-verify="required"  autocomplete="off" class="layui-input">
               </div>
           </div>
    	<div class="layui-form-item">
               <label class="layui-form-label">译者</label>
               <div class="layui-input-block">
                   <input type="text" name="translator" id="translator" required lay-verify="required"  autocomplete="off" class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">出版社</label>
               <div class="layui-input-block">
                   <input type="text" name="press" id="press" required lay-verify="required"  autocomplete="off" class="layui-input">
               </div>
           </div>
    	<div class="layui-form-item">
               <label class="layui-form-label">价格</label>
               <div class="layui-input-block">
                   <input type="number" name="price" id="price" required lay-verify="required"  autocomplete="off" class="layui-input">
               </div>
           </div>
    	<div class="layui-form-item">
               <label class="layui-form-label">出版时间</label>
    		<div class="layui-input-block">
                   <input type="text" name="date" id="publicationTime" autocomplete="off" class="layui-input" lay-verify="date" />
               </div>
           </div>
       </div>
    </form>
  </script>

  <script src="<%=path %>/LayUI/layui.js"></script>
  <script>
    layui.use(["table", "form", "laydate"], function() {
      var table = layui.table;
      var $ = layui.$;
      var laydate = layui.laydate;
      var form = layui.form;
      popForm = layui.form;

      var globalNumber = "";
      var globalName = "";

      table.render({
        elem: "#demo",
        method: "post",
        page: true, //开启分页
        url: "<%=path %>/BasicInfoBook/getAll", //方法所在页面和方法名
        request: {
          pageName: "pageNo", //页码的参数名称
          limitName: "pageSize" //每页数据量的参数名
        },
        where: {
          // 可使用编号和姓名进行筛选 模糊查找
          number: globalNumber,
          name: globalName,
          categoryNumber: ""
        },
        id: "demo",
        toolbar: "#toolbarDemo",
        height: 540, //固定值
        cols: [
          [
            //表头
            { field: "id", title: "ID", sort: true, fixed: "left", hide: true },
            { field: "number", title: "图书编号", fixed: "left" },
            { field: "categoryNumber", title: "类别编号", fixed: "left" },
            { field: "name", title: "图书名称", fixed: "left" },
            { field: "author", title: "作者", fixed: "left" },
            { field: "translator", title: "译者", fixed: "left" },
            { field: "press", title: "出版社", fixed: "left" },
            { field: "price", title: "价格", fixed: "left" },
            {
              field: "publicationTime",
              title: "出版时间",
              fixed: "left",
              templet:
                "<div>{{layui.util.toDateString(d.publicationTime, 'yyyy-MM-dd')}}</div>"
            },
            { fixed: "left", title: "操作", toolbar: "#barDemo" }
          ]
        ]
      });

      table.on("toolbar(demo)", function(obj) {
        switch (obj.event) {
          case "AddInfo":
            var that = this;
            layer.open({
              id: "AddInfo",
              type: 1, //此处以iframe举例
              title: "新建图书信息",
              area: ["35%", "80%"],
              shade: 0,
              maxmin: true,
              offset: "auto",
              content: $("#editInfo")[0].innerHTML,
              btn: ["提交", "取消"], //只是为了演示
              yes: function() {
                const number = $("#number").val();
                const categoryNumber = $("#categoryNumber").val();
                const name = $("#name").val();
                const author = $("#author").val();
                const translator = $("#translator").val();
                const press = $("#press").val();
                const price = parseInt($("#price").val());
                const publicationTime = $("#publicationTime").val();
                const data = {
                  number: number,
                  categoryNumber: categoryNumber,
                  name: name,
                  author: author,
                  translator: translator,
                  press: press,
                  price: price,
                  publicationTime: publicationTime
                };
                $.ajax({
                  type: "post", //要用post方式
                  url: "<%=path %>/BasicInfoBook/create", //方法所在页面和方法名
                  contentType: "application/json; charset=utf-8",
                  data: JSON.stringify(data),
                  dataType: "json",
                  success: function(result) {
                    if (result.code == 0) {
                      layer.close(layer.index);
                      table.reload("demo", {
                        where: { name: globalName, number: globalNumber }
                      });
                    } else {
                      layer.msg(result.msg, {
                        icon: 5,
                        time: 1000,
                        zIndex: layer.zIndex
                      });
                    }
                  },
                  error: function(err) {
                    layer.close(layer.index);
                    layer.msg(err.responseJSON.Message, {
                      icon: 5,
                      time: 1000,
                      zIndex: layer.zIndex
                    });
                  }
                });
              },
              btn2: function() {
                layer.close(layer.index);
              },
              success: function(layero) {
                laydate.render({
                  elem: "#publicationTime",
                  trigger: "click"
                });
                layer.setTop(layero); //重点2
              }
            });
            break;
          case "Search":
            globalNumber = $("#bookNumber").val();
            globalName = $("#bookName").val();
            table.reload("demo", {
              where: { name: globalName, number: globalNumber },
              page: { curr: 1 }
            });
            $("#bookNumber").val(globalNumber); // Table重载后bookNumber会被清空，所以重新赋值
            $("#bookName").val(globalName);
            break;
          case "Reset":
            globalNumber = "";
            globalName = "";
            table.reload("demo", {
              where: { name: globalName, number: globalNumber },
              page: { curr: 1 }
            });
            break;
        }
      });

      table.on("tool()", function(obj) {
        var data = obj.data;
        if (obj.event === "edit") {
          var data = obj.data;
          layer.open({
            id: "Edit",
            type: 1, //此处以iframe举例
            title: "编辑图书信息",
            area: ["35%", "80%"],
            shade: 0,
            maxmin: true,
            offset: "auto",
            content: $("#editInfo")[0].innerHTML,
            btn: ["更新", "取消"], //只是为了演示
            yes: function() {
              const id = parseInt($("#id").val());
              const number = $("#number").val();
              const categoryNumber = $("#categoryNumber").val();
              const name = $("#name").val();
              const author = $("#author").val();
              const translator = $("#translator").val();
              const press = $("#press").val();
              const price = $("#price").val();
              const publicationTime = $("#publicationTime").val();
              const data = {
                id: id,
                number: number,
                categoryNumber: categoryNumber,
                name: name,
                author: author,
                translator: translator,
                press: press,
                price: price,
                publicationTime: publicationTime
              };
              $.ajax({
                type: "post", //要用post方式
                url: "<%=path %>/BasicInfoBook/update", //方法所在页面和方法名
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(result) {
                  if (result.code == 0) {
                    layer.close(layer.index);
                    table.reload("demo", {
                      where: { name: globalName, number: globalNumber }
                    });
                  } else {
                    layer.msg(result.msg, {
                      icon: 5,
                      time: 1000,
                      zIndex: layer.zIndex
                    });
                  }
                },
                error: function(err) {
                  layer.close(layer.index);
                  layer.msg(err.responseJSON.Message, {
                    icon: 5,
                    time: 1000,
                    zIndex: layer.zIndex
                  });
                }
              });
            },
            btn2: function() {
              layer.close(layer.index);
            },
            success: function(layero) {
              laydate.render({
                elem: "#publicationTime",
                trigger: "click"
              });
              popForm.val("formTestFilter", {
                id: data.id,
                number: data.number,
                categoryNumber: data.categoryNumber,
                name: data.name,
                author: data.author,
                translator: data.translator,
                press: data.press,
                price: data.price
              });
              popForm.render(null, "formTestFilter");
              const publicationTime = layui.util.toDateString(
                data.publicationTime,
                "yyyy-MM-dd"
              );
              $("#publicationTime")[0].value = publicationTime;
              layer.setTop(layero); //重点2
            }
          });
        }
      });
    });
  </script>
</html>

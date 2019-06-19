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
    <table id="demo" lay-filter="demo"></table>
    <script type="text/html" id="toolbarDemo">
      <div class="layui-btn-container">
          <button class="layui-btn layui-btn-sm" lay-event="AddInfo">添加</button>
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
               <label class="layui-form-label">条形码</label>
               <div class="layui-input-block">
                   <input type="text" name="barcode" id="barcode" required lay-verify="required"  autocomplete="off" class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">编号</label>
               <div class="layui-input-block">
                   <input type="text" name="basicNumber" id="basicNumber" required lay-verify="required"  autocomplete="off" class="layui-input">
               </div>
           </div>
       </div>
    </form>
  </script>

  <script src="<%=path %>/LayUI/layui.js"></script>
  <script>
    layui.use(["table", "form"], function() {
      var table = layui.table;
      var $ = layui.$;
      var form = layui.form;
      popForm = layui.form;
      //GetAll接口实例
      table.render({
        elem: "#demo",
        method: "post",
        page: true, //开启分页
        url: "<%=path %>/Book/getAll", //方法所在页面和方法名
        request: {
          pageName: "pageNo", //页码的参数名称
          limitName: "pageSize" //每页数据量的参数名
        },
        where: {
          // 可使用编号和姓名进行筛选 模糊查找
          number: "",
          name: ""
        },
        id: "demo",
        toolbar: "#toolbarDemo",
        height: 520, //固定值
        cols: [
          [
            //表头
            { field: "id", title: "ID", sort: true, fixed: "left", hide: true },
            { field: "barcode", title: "条形码", fixed: "left" },
            { field: "basicNumber", title: "编号", fixed: "left" },
            {
              field: "state",
              title: "是否借出",
              fixed: "left",
              templet: "<div>{{d.state?'已借':'未借'}}</div>"
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
                const barcode = $("#barcode").val();
                const basicNumber = $("#basicNumber").val();
                const data = {
                  barcode: barcode,
                  basicNumber: basicNumber
                };
                $.ajax({
                  type: "post", //要用post方式
                  url: "<%=path %>/Book/create", //方法所在页面和方法名
                  contentType: "application/json; charset=utf-8",
                  data: JSON.stringify(data),
                  dataType: "json",
                  success: function(result) {
                    if (result.code == 0) {
                      layer.close(layer.index);
                      table.reload("demo");
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
                layer.setTop(layero); //重点2
              }
            });
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
              const barcode = $("#barcode").val();
              const basicNumber = $("#basicNumber").val();
              const data = {
                id: id,
                barcode: barcode,
                basicNumber: basicNumber
              };
              $.ajax({
                type: "post", //要用post方式
                url: "<%=path %>/Book/update", //方法所在页面和方法名
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(result) {
                  if (result.code == 0) {
                    layer.close(layer.index);
                    table.reload("demo");
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
              popForm.val("formTestFilter", {
                id: data.id,
                barcode: data.barcode,
                basicNumber: data.basicNumber
              });
              popForm.render(null, "formTestFilter");
              layer.setTop(layero); //重点2
            }
          });
        }
      });
    });
  </script>
</html>

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
  <script>
    layui.use(["table", "layer", "laydate"], function() {
      var $ = layui.jquery;
      var table = layui.table;
      var laydate = layui.laydate;
      var layer = layui.layer;

      //第一个实例
      table.render({
        elem: "#test",
        title: "课程信息列表",
        url: "./CourseSelection.aspx/GetAll", //数据接口
        method: "post",
        contentType: "application/json",
        where: { CourseName: "", Number: "", TId: 0 },
        page: true, //开启分页
        parseData: function(result) {
          //res 即为原始返回的数据
          const res = result.d;
          return {
            code: !res.Status, //解析接口状态
            msg: res.Msg, //解析提示文本
            count: res.Total, //解析数据长度
            data: res.Data //解析数据列表
          };
        },
        id: "test",
        toolbar: "#toolbarDemo",
        size: "lg",
        height: 660, //固定值
        cols: [
          [
            //表头
            { type: "checkbox", fixed: "left" },
            { field: "Id", title: "ID", sort: true, fixed: "left", hide: true },
            { field: "BooKNumber", title: "图书编号", fixed: "left" },
            { field: "ReaderNumber", title: "读者编号", fixed: "left" },
            { field: "OperatorNumber", title: "操作员编号", fixed: "left" },
            { field: "BorrowingDate", title: "借阅日期", fixed: "left" },
            { field: "ReturnDate", title: "归还日期", fixed: "left" },
            { fixed: "left", title: "操作", toolbar: "#barDemo", width: "15%" }
          ]
        ],
        done: function(res, curr, count) {
          for (var i in res.data) {
            var item = res.data[i];
            if (item.StatusName !== "可选") {
              // 这里是判断需要禁用的条件（如：状态为0的）
              $("tr[data-index=" + i + '] input[type="checkbox"]').prop(
                "disabled",
                true
              );
            }
            $("th[data-field=0] div").replaceWith(
              '<div class="layui-table-cell laytable-cell-5-0-0"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></div>'
            );
          }
        }
      });
    });
  </script>
</html>

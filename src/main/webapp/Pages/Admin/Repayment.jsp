<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="<%=path %>/LayUI/css/layui.css" />
</head>

<body style="width: 98%; margin: auto">
    <table id="demo" lay-filter="demo"></table>
    <script type="text/html" id="barDemo">
      <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">还款</a>
    </script>
</body>

<script src="<%=path %>/LayUI/layui.js"></script>
<script>
    layui.use(["table"], function () {
        var table = layui.table;
        var $ = layui.$;
        //GetAll接口实例
        table.render({
            elem: "#demo",
            method: "post",
            page: true, //开启分页
            url: "<%=path %>/BookBorrowing/getFineRecord", //方法所在页面和方法名
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
            height: 540, //固定值
            cols: [
                [
                    //表头
                    { field: "number", title: "读者编号", fixed: "left" },
                    { field: "name", title: "读者姓名", fixed: "left" },
                    { field: "telephone", title: "读者电话", fixed: "left" },
                    { field: "totalArrears", title: "总欠款", fixed: "left" },
                    { fixed: "left", title: "操作", toolbar: "#barDemo" }
                ]
            ]
        });

        table.on("tool()", function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === "del") {
                layer.confirm("欠款是否缴清", function (index) {
                    const data = { readerNumber: obj.data.number };
                    $.ajax({
                        type: "post", //要用post方式
                        url: "<%=path %>/BookBorrowing/repayment", //方法所在页面和方法名
                        data: data,
                        success: function (result) {
                            layer.close(layer.index);
                            table.reload("demo");
                        },
                        error: function (err) {
                            layer.msg(err.responseJSON.Message, {
                                icon: 5,
                                time: 1000,
                                zIndex: layer.zIndex
                            });
                        }
                    });
                    layer.close(index);
                });
            }
        });
    });
</script>

</html>
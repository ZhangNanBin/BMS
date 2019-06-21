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
                <input type="tel" name="phone" id="bookBarCode" lay-verify="required|phone" autocomplete="off"
                    class="layui-input" />
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">读者编号</label>
            <div class="layui-input-inline">
                <input type="text" name="email" id="readerNumber" lay-verify="email" autocomplete="off"
                    class="layui-input" />
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
<script src="<%=path %>/LayUI/jquery-3.2.1.min.js"></script>
<script>
    layui.use(["table", "form"], function () {

        $("#borrowBooks").click(function () {
            const bookBarCode = $("#bookBarCode").val();
            const readerNumber = $("#readerNumber").val();
            data = {
                bookBarcode: bookBarCode,
                readerNumber: readerNumber
            };
            $.ajax({
                type: "post", //要用post方式
                url: "<%=path %>/BookBorrowing/borrowing", //方法所在页面和方法名
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: "json",
                success: function (result) {
                    if (result.code == 0) {
                        $("#bookBarCode").val("");
                        $("#readerNumber").val("");
                        layer.msg("借阅成功", {
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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="../../LayUI/css/layui.css" />

</head>
<body>
    <table id="test" lay-filter="test"></table>
</body>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="Checkbox">选择</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    {{# if (d.StatusName === "已选"&& d.RQuantity!==0 ) { }}  
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="Revoke">撤销</a>
    {{# } else if(d.StatusName === "可选") { }}  
            <a class="layui-btn layui-btn-xs" lay-event="Select">选择</a>
    {{# } }}  
</script>

<script type="text/html" id="editInfo">
    <input type="hidden" name="Id" id="Id" value="..." />
    <div style="width: 80%; margin: auto; text-align: center; margin-top: 5%">
        <div class="layui-form-item">
            <label class="layui-form-label">课程编号</label>
            <div class="layui-input-block">
                <input type="text" name="Number" id="Number" readonly="readonly" required="required" lay-verify="required" placeholder="请输入课程编号" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程名称</label>
            <div class="layui-input-block">
                <input type="text" name="CourseName" id="CourseName" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学分</label>
            <div class="layui-input-block">
                <input type="text" name="Credit" id="Credit" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">老师姓名</label>
            <div class="layui-input-block">
                <input type="text" name="TName" id="TName" readonly="readonly" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上课地点</label>
            <div class="layui-input-block">
                <input type="text" name="Place" id="Place" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-block">
                <input type="text" name="date" id="StartTime" readonly="readonly" autocomplete="off" class="layui-input" lay-verify="date" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-block">
                <input type="text" name="date" id="EndTime" readonly="readonly" autocomplete="off" class="layui-input" lay-verify="date" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">最大数量</label>
            <div class="layui-input-block">
                <input type="text" name="MaxNumber" id="MaxNumber" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">课程介绍</label>
            <div class="layui-input-block">
                <textarea name="Introduction" id="Introduction" readonly="readonly" class="layui-textarea"></textarea>
            </div>
        </div>
    </div>
</script>


<script type="text/html" id="TeacherInfo">
    <input type="hidden" name="Id" id="Id" value="..." />
    <div style="width: 80%; margin: auto; text-align: center; margin-top: 5%">
        <div class="layui-form-item">
            <label class="layui-form-label">教师编号</label>
            <div class="layui-input-block">
                <input type="text" name="TNumber" id="TNumber" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">教师名称</label>
            <div class="layui-input-block">
                <input type="text" name="TTName" id="TTName" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="text" name="TSex" id="TSex" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">职称</label>
            <div class="layui-input-block">
                <input type="text" name="TTitle" id="TTitle" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属学院</label>
            <div class="layui-input-block">
                <input type="text" name="FacultyName" id="FacultyName" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">教师介绍</label>
            <div class="layui-input-block">
                <textarea name="TIntroduction" id="TIntroduction" readonly="readonly" class="layui-textarea"></textarea>
            </div>
        </div>
    </div>
</script>

<script src="../../LayUI/layui.js"></script>
<script>
    layui.use(['table', 'layer', 'laydate'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var laydate = layui.laydate;;
        var layer = layui.layer;

        //第一个实例
        table.render({
            elem: '#test',
            title: '课程信息列表',
            url: './CourseSelection.aspx/GetAll', //数据接口
            method: "post",
            contentType: 'application/json',
            where: { CourseName: "", Number: "", TId: 0 },
            page: true, //开启分页
            parseData: function (result) { //res 即为原始返回的数据
                const res = result.d;
                return {
                    "code": !res.Status, //解析接口状态
                    "msg": res.Msg, //解析提示文本
                    "count": res.Total, //解析数据长度
                    "data": res.Data//解析数据列表
                };
            },
            id: "test",
            toolbar: '#toolbarDemo',
            size: 'lg',
            height: 660, //固定值
            cols: [[ //表头
                { type: 'checkbox', fixed: 'left' },
                { field: 'Id', title: 'ID', sort: true, fixed: 'left', hide: true },
                { field: 'BooKNumber', title: '图书编号', fixed: 'left' },
                { field: 'ReaderNumber', title: '读者编号', fixed: 'left' },
                { field: 'OperatorNumber', title: '操作员编号', fixed: 'left' },
                { field: 'BorrowingDate', title: '借阅日期', fixed: 'left' },
                { field: 'ReturnDate', title: '归还日期', fixed: 'left' },
                { fixed: 'left', title: '操作', toolbar: "#barDemo", width: "15%" }
            ]],
            done: function (res, curr, count) {
                for (var i in res.data) {
                    var item = res.data[i];
                    if (item.StatusName !== "可选") {// 这里是判断需要禁用的条件（如：状态为0的）
                        $('tr[data-index=' + i + '] input[type="checkbox"]').prop('disabled', true);
                    }
                    $('th[data-field=0] div').replaceWith('<div class="layui-table-cell laytable-cell-5-0-0"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></div>');
                }
            }
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);

            switch (obj.event) {
                case 'Checkbox':
                    let data = checkStatus.data;
                    let CourseIds = [];
                    data.forEach(d => {
                        CourseIds.push(d.Id);
                    });
                    if (CourseIds.length <= 0) {
                        layer.msg("未选择课程", {
                            icon: 5,
                            time: 1000,
                            zIndex: layer.zIndex
                        });
                        return;
                    }
                    layer.confirm("确定同时选择该多门课程吗？", function (index) {
                        const data = { CourseIds: CourseIds };
                        $.ajax({
                            type: "post", //要用post方式                 
                            url: "./CourseSelection.aspx/Select",//方法所在页面和方法名
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                //返回的数据用data.d获取内容
                                layer.msg(data.d.Msg, {
                                    icon: 1,
                                    time: 1000,
                                    zIndex: layer.zIndex
                                });
                            },
                            error: function (err) {
                                layer.msg(err.responseJSON.Message, {
                                    icon: 5,
                                    time: 1000,
                                    zIndex: layer.zIndex
                                });
                            }
                        })
                        table.reload("test", { CourseName: "", Number: "", TId: 0 });
                    })
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'Select') {
                layer.confirm(`确定选择该门课程吗？课程编号：${data.Number}`, function (index) {
                    const data = { CourseIds: [parseInt(obj.data.Id)] };
                    $.ajax({
                        type: "post", //要用post方式                 
                        url: "./CourseSelection.aspx/Select",//方法所在页面和方法名
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            //返回的数据用data.d获取内容
                            layer.msg(data.d.Msg, {
                                icon: 1,
                                time: 1000,
                                zIndex: layer.zIndex
                            });
                        },
                        error: function (err) {
                            layer.msg(err.responseJSON.Message, {
                                icon: 5,
                                time: 1000,
                                zIndex: layer.zIndex
                            });
                        }
                    })
                    table.reload("test", { CourseName: "", Number: "", TId: 0 });
                })
            }
        });
    });
</script>
</html>

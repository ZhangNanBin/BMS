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
            <label class="layui-form-label">类别编号</label>
            <div class="layui-input-block">
                <input type="text" name="number" id="number" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">类别名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" id="name" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">可借天数</label>
            <div class="layui-input-block">
                <input type="number" name="borrowableDays" id="borrowableDays" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">罚款金额</label>
            <div class="layui-input-block">
                <input type="number" name="finesAmount" id="finesAmount" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
	</form>
</script>

<script src="<%=path %>/LayUI/layui.js"></script>
<script>
	layui.use(['table','form'], function() {
		var table = layui.table;
		var $ = layui.$;
		var form = layui.form;
		  popForm=layui.form;
		//GetAll接口实例
		table.render({
			elem : '#demo',
			method : "post",
			page : true, //开启分页
	        url: "<%=path %>/BookCategory/getAll",//方法所在页面和方法名
			request : {
				pageName : 'pageNo',//页码的参数名称
				limitName : 'pageSize' //每页数据量的参数名
			},
			where : { // 可使用编号和姓名进行筛选 模糊查找
				number : "",
				name : ""
			},
	        id: "demo",
	        height: 520, //固定值
	        toolbar: '#toolbarDemo',
            cols: [[ //表头
            	{ field: 'id', title: 'ID', sort: true, fixed: 'left', hide: true },
                { field: 'number', title: '类别编号', fixed: 'left' },
                { field: 'name', title: '类别名称', fixed: 'left' },
                { field: 'borrowableDays', title: '可借天数', fixed: 'left' },
                { field: 'finesAmount', title: '罚款金额', fixed: 'left' },
                { fixed: 'left', title: '操作', toolbar: '#barDemo' }
            ]]
        });
		
		table.on('toolbar(demo)', function (obj) {
            switch (obj.event) {
                case 'AddInfo':
                    var that = this;
                    layer.open({
                        id: "AddInfo",
                        type: 1,//此处以iframe举例
                        title: '新建图书类别信息',
                        area: ['35%', '80%'],
                        shade: 0,
                        maxmin: true,
                        offset: 'auto',
                        content: $('#editInfo')[0].innerHTML,
                        btn: ['提交', '取消'],//只是为了演示
                        yes: function () {
                        	const number = $("#number").val();
                            const name = $("#name").val();
                            const borrowableDays = parseInt($("#borrowableDays").val());
                            const finesAmount = $("#finesAmount").val();
                            const data = {
                                    number : number,
                                    name : name,
                                    borrowableDays : borrowableDays,
                                    finesAmount : finesAmount
                            }
                            $.ajax({
                                type: "post", //要用post方式                 
                                url: "<%=path %>/BookCategory/create",//方法所在页面和方法名
                                contentType: "application/json; charset=utf-8",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (result) {
                                    if(result.code==0)
                                	{
                                        layer.close(layer.index);
                                        table.reload("demo");
                                	}
                                	else
                                    {
                                        layer.msg(result.msg, {
                                            icon: 5,
                                            time: 1000,
                                            zIndex: layer.zIndex
                                        });
                                    }
                                },
                                error: function (err) {
                                    layer.close(layer.index);
                                    layer.msg(err.responseJSON.Message, {
                                        icon: 5,
                                        time: 1000,
                                        zIndex: layer.zIndex
                                    });
                                }
                            })
                        },
                        btn2: function () {
                            layer.close(layer.index);
                        },
                        success: function (layero) {
                            layer.setTop(layero); //重点2
                        }
                    });
            };
        });
		
		table.on('tool(demo)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'edit') {
                var data = obj.data;
                layer.open({
                    id: "Edit",
                    type: 1,//此处以iframe举例
                    title: '编辑图书类别信息',
                    area: ['35%', '80%'],
                    shade: 0,
                    maxmin: true,
                    offset: 'auto',
                    content: $('#editInfo')[0].innerHTML,
                    btn: ['更新', '取消'],//只是为了演示
                    yes: function () {
                        const id = parseInt($("#id").val());
                        const number = $("#number").val();
                        const name = $("#name").val();
                        const borrowableDays = parseInt($("#borrowableDays").val());
                        const finesAmount = $("#finesAmount").val();
                        const data = {
                                id : id,
                                number : number,
                                name : name,
                                borrowableDays : borrowableDays,
                                finesAmount : finesAmount
                        }
                        $.ajax({
                            type: "post", //要用post方式                 
                            url: "<%=path %>/BookCategory/update",//方法所在页面和方法名
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                if(data.code==0)
                                {
                                    layer.close(layer.index);
                                    table.reload("demo");
                                }
                                else
                                {
                                    layer.msg(data.msg, {
                                        icon: 5,
                                        time: 1000,
                                        zIndex: layer.zIndex
                                    });
                                }
                            },
                            error: function (err) {
                                layer.close(layer.index);
                                layer.msg(err.responseJSON.Message, {
                                    icon: 5,
                                    time: 1000,
                                    zIndex: layer.zIndex
                                });
                            }
                        })
                    },
                    btn2: function () {
                        layer.close(layer.index);
                    },
                    success: function (layero) {
                    	popForm.val("formTestFilter", {
              			  "id":data.id 
              			 ,"number":data.number
              			 ,"name":data.name
              			 ,"borrowableDays":data.borrowableDays
              			 ,"finesAmount":data.finesAmount
              			});
                		popForm.render(null,'formTestFilter')
                        layer.setTop(layero); //重点2
                    }
                });
            }
        });
		
    });
</script>
</html>
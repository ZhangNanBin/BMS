<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="../../LayUI/css/layui.css" />
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
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</body>

<script type="text/html" id="editInfo">
	<form class="layui-form" lay-filter="formTestFilter">
    <input type="hidden" name="id" id="id" value="...">
    <div style="width: 80%; margin: auto; text-align: center; margin-top: 5%">
        <div class="layui-form-item">
            <label class="layui-form-label">编号</label>
            <div class="layui-input-block">
                <input type="text" name="number" id="number" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" id="name" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="text" name="sex" id="sex" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input type="number" name="age" id="age" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-block">
                <input type="text" name="idNumber" id="idNumber" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工作日期</label>
            <div class="layui-input-block">
                <input type="text" name="date" id="workDate" autocomplete="off" class="layui-input" lay-verify="date" />
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input type="text" name="telephone" id="telephone" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="passWord" id="passWord" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
	</form>
</script>

<script src="../../LayUI/layui.js"></script>
<script>
	layui.use(['table','form','laydate'], function() {
		var table = layui.table;
		var $ = layui.$;
		var laydate = layui.laydate;
		var form = layui.form;
		  popForm=layui.form;
		//GetAll接口实例
		table.render({
			elem : '#demo',
			method : "post",
			page : true, //开启分页
	        url: "/bms/Operator/getAll",//方法所在页面和方法名
			request : {
				pageName : 'pageNo',//页码的参数名称
				limitName : 'pageSize' //每页数据量的参数名
			},
			where : { // 可使用编号和姓名进行筛选 模糊查找
				number : "",
				name : "",
				isAdmin:false
			},
	        id: "demo",
            toolbar: '#toolbarDemo',
	        height: 520, //固定值
            cols: [[ //表头
                { field: 'id', title: 'ID', sort: true, fixed: 'left', hide: true },
                { field: 'number', title: '编号', fixed: 'left' },
                { field: 'name', title: '姓名', fixed: 'left' },
                { field: 'sex', title: '性别', fixed: 'left' },
                { field: 'age', title: '年龄', fixed: 'left' },
                { field: 'idNumber', title: '身份证号', fixed: 'left' },
                { field: 'workDate', title: '工作日期', fixed: 'left',templet: "<div>{{layui.util.toDateString(d.workDate, 'yyyy-MM-dd')}}</div>"  },
                { field: 'telephone', title: '联系电话', fixed: 'left' },
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
                        title: '新建操作员信息',
                        area: ['35%', '80%'],
                        shade: 0,
                        maxmin: true,
                        offset: 'auto',
                        content: $('#editInfo')[0].innerHTML,
                        btn: ['添加', '取消'],//只是为了演示
                        yes: function () {
                            const number = $("#number").val();
                            const name = $("#name").val();
                            const sex = $("#sex").val();
                            const age = $("#age").val();
                            const idNumber = $("#idNumber").val();
                            const workDate = $("#workDate").val();
                            const telephone = $("#telephone").val();
                            const isAdmin = Boolean($("#isAdmin").val());
                            const passWord = $("#passWord").val();
                            const data = {
                                    number : number,
                                    name : name,
                                    sex : sex,
                                    age : age,
                                    idNumber : idNumber,
                                    workDate : workDate,
                                    telephone : telephone,
                                    isAdmin : isAdmin,
                                    passWord : passWord
                            }
                            $.ajax({
                                type: "post", //要用post方式                 
                                url: "/bms/Operator/create",//方法所在页面和方法名
                                contentType: "application/json; charset=utf-8",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (data) {
                                	if(data.code==0)
                                	{
                                		layer.close(layer.index);
                                        table.reload("demo");
                                	}
                                    esle
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
                        zIndex: layer.zIndex, //重点1
                        success: function (layero) {
                        	laydate.render({
                                elem: '#workDate',
                                trigger: 'click'
                            });
                            layer.setTop(layero); //重点2
                        }
                    });
            };
        });
		
		table.on('tool()', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    const data = { id: parseInt(obj.data.id) };
                    $.ajax({
                        type: "post", //要用post方式                 
                        url: "/bms/Operator/delete",//方法所在页面和方法名
                        data: data,
                        success: function (data) {
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
                    })
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                var data = obj.data;
                layer.open({
                    id: "Edit",
                    type: 1,//此处以iframe举例
                    title: '编辑操作员信息',
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
                        const sex = $("#sex").val();
                        const age = $("#age").val();
                        const idNumber = $("#idNumber").val();
                        const workDate = $("#workDate").val();
                        const telephone = $("#telephone").val();
                        const isAdmin = $("#isAdmin").val();
                        const passWord = $("#passWord").val();
                        const data = {
                                id : id,
                                number : number,
                                name : name,
                                sex : sex,
                                age : age,
                                idNumber : idNumber,
                                workDate : workDate,
                                telephone : telephone,
                                isAdmin : isAdmin,
                                passWord : passWord
                        }
                        $.ajax({
                            type: "post", //要用post方式                 
                            url: "/bms/Operator/update",//方法所在页面和方法名
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                layer.close(layer.index);
                                table.reload("demo");
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
                    zIndex: layer.zIndex, //重点1
                    success: function (layero) {
                    	laydate.render({
                            elem: '#workDate',
                            trigger: 'click'
                        });
                    	popForm.val("formTestFilter", {
              			  "id":data.id 
              			 ,"number":data.number
              			 ,"name":data.name
              			 ,"sex":data.sex
              			 ,"age":data.age
              			 ,"idNumber":data.idNumber
             			 ,"telephone":data.telephone
             			 ,"isAdmin":data.isAdmin
             			 ,"passWord":data.passWord
              			});
                		popForm.render(null,'formTestFilter')
                		const workDate = layui.util.toDateString(data.workDate, 'yyyy-MM-dd');
                		$("#workDate")[0].value = workDate;
                        layer.setTop(layero); //重点2
                    }
                });
            }
        });
    });
</script>
</html>
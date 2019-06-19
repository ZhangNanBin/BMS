<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用AJAX以JSON方式获取数据</title>
<link rel="stylesheet" href="<%=path %>/LayUI/css/layui.css" media="all">

</head>
<body>
	<table id="demo" lay-filter=demo></table>
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
            <label class="layui-form-label">读者编号</label>
            <div class="layui-input-block">
                <input type="text" name="number" id="number" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">读者姓名</label>
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
                <input type="text" name="age" id="age" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input type="text" name="telephone" id="telephone" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">押金</label>
            <div class="layui-input-block">
                <input type="text" name="deposit" id="deposit" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">生日</label>
            <div class="layui-input-block">
                <input type="text" name="date" id="birthday" autocomplete="off" class="layui-input" placeholder="请选择生日" lay-verify="date" />
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">职业</label>
            <div class="layui-input-block">
                <input type="text" name="occupation" id="occupation" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">证件类型</label>
            <div class="layui-input-block">
                <input type="text" name="idType" id="idType" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">办证日期</label>
			<div class="layui-input-block">
                <input type="text" name="date" id="certificationDate" autocomplete="off" class="layui-input" placeholder="请选择生日" lay-verify="date" />
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">最大借阅数量</label>
            <div class="layui-input-block">
                <input type="text" name="maxNumber" id="maxNumber" required lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">证件号码</label>
            <div class="layui-input-block">
                <input type="text" name="idNumber" id="idNumber" required lay-verify="required"  autocomplete="off" class="layui-input">
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
<script type="text/javascript" src="<%=path %>/LayUI/layui.js"></script>
<script>
	layui.use(['table','form', 'laydate'], function() {
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
            url: "<%=path %>/Reader/getAll",//方法所在页面和方法名
			request : {
				pageName : 'pageNo',//页码的参数名称
				limitName : 'pageSize' //每页数据量的参数名
			},
			where : { // 可使用编号和姓名进行筛选 模糊查找
				number : "",
				name : ""
			},
            id: "demo",
            toolbar: '#toolbarDemo',
            height: 520, //固定值
			cols : [ [ //表头
				{ field: 'id', title: 'ID', sort: true, fixed: 'left', hide: true },
                { field: 'number', title: '读者编号', fixed: 'left' },
                { field: 'name', title: '姓名', fixed: 'left' },
                { field: 'sex', title: '性别', fixed: 'left' },
                { field: 'age', title: '年龄', fixed: 'left' },
                { field: 'telephone', title: '联系电话', fixed: 'left' },
                { field: 'deposit', title: '押金', fixed: 'left' },
                { field: 'birthday', title: '生日', fixed: 'left',templet: "<div>{{layui.util.toDateString(d.birthday, 'yyyy-MM-dd')}}</div>" },
                { field: 'occupation', title: '职业', fixed: 'left' },
                { field: 'maxNumber', title: '最大借阅数量', fixed: 'left' },
                { field: 'idNumber', title: '证件号码', fixed: 'left' },
                { fixed: 'left', title: '操作', toolbar: '#barDemo' }
			] ]
		});
		
		table.on('toolbar(demo)', function (obj) {
            switch (obj.event) {
                case 'AddInfo':
                    var that = this;
                    layer.open({
                        id: "AddInfo",
                        type: 1,//此处以iframe举例
                        title: '新建读者信息',
                        area: ['35%', '80%'],
                        shade: 0,
                        maxmin: true,
                        offset: 'auto',
                        content: $('#editInfo')[0].innerHTML,
                        btn: ['提交', '取消'],//只是为了演示
                        yes: function () {
                            const number = $("#number").val();
                            const name = $("#name").val();
                            const sex = $("#sex").val();
                            const age = $("#age").val();
                            const telephone = $("#telephone").val();
                            const deposit = $("#deposit").val();
                            const birthday = $("#birthday").val();
                            const occupation = $("#occupation").val();
                            const idType = $("#idType").val();
                            const certificationDate = $("#certificationDate").val();
                            const maxNumber = $("#maxNumber").val();
                            const idNumber = $("#idNumber").val();
                            const passWord = $("#passWord").val();
                            const data = {
                                    number : number,
                                    name : name,
                                    sex : sex,
                                    age : age,
                                    telephone : telephone,
                                    deposit : deposit,
                                    birthday : birthday,
                                    occupation : occupation,
                                    idType : idType,
                                    certificationDate : certificationDate,
                                    maxNumber : maxNumber,
                                    idNumber : idNumber,
                                    passWord : passWord
                            }
                            $.ajax({
                                type: "post", //要用post方式                 
                                url: "<%=path %>/Reader/create",//方法所在页面和方法名
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
                                        zIndex: layer.zIndex                                    });
                                }
                            })
                        },
                        btn2: function () {
                            layer.close(layer.index);
                        },
                        zIndex: layer.zIndex, //重点1
                        success: function (layero) {
                        	laydate.render({
                                elem: '#birthday',
                                trigger: 'click'
                            });
                        	laydate.render({
                                elem: '#certificationDate',
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
                        url: "<%=path %>/Reader/delete",//方法所在页面和方法名
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
                    title: '编辑读者信息',
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
                        const telephone = $("#telephone").val();
                        const deposit = $("#deposit").val();
                        const birthday = ($("#birthday").val());
                        const occupation = $("#occupation").val();
                        const idType = $("#idType").val();
                        const certificationDate = $("#certificationDate").val();
                        const maxNumber = ($("#maxNumber").val());
                        const idNumber = $("#idNumber").val();
                        const passWord = $("#passWord").val();
                        const data = {
                                id : id,
                                number : number,
                                name : name,
                                sex : sex,
                                age : age,
                                telephone : telephone,
                                deposit : deposit,
                                birthday : birthday,
                                occupation : occupation,
                                idType : idType,
                                certificationDate : certificationDate,
                                maxNumber : maxNumber,
                                idNumber : idNumber,
                                passWord : passWord
                        }
                        $.ajax({
                            type: "post", //要用post方式                 
                            url: "<%=path %>/Reader/update",//方法所在页面和方法名
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
                                }                            },
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
                    	laydate.render({
                            elem: '#birthday',
                            trigger: 'click'
                        });
                    	laydate.render({
                            elem: '#certificationDate',
                            trigger: 'click'
                        });
                    	popForm.val("formTestFilter", {
              			  "id":data.id 
              			 ,"number":data.number
              			 ,"name":data.name
              			 ,"sex":data.sex
              			 ,"age":data.age
              			 ,"telephone":data.telephone
              			 ,"deposit":data.deposit
             			 ,"occupation":data.occupation
             			 ,"idType":data.idType
             			 ,"maxNumber":data.maxNumber
             			 ,"idNumber":data.idNumber
             			 ,"passWord":data.passWord
              			});

                		popForm.render(null,'formTestFilter')
                	  	const birthday = layui.util.toDateString(data.birthday, 'yyyy-MM-dd');
						$("#birthday")[0].value = birthday;
						const certificationDate = layui.util.toDateString(data.certificationDate, 'yyyy-MM-dd');
						$("#certificationDate")[0].value = certificationDate;
                        layer.setTop(layero); //重点2
                    }
                });
            }
        });
	});
</script>
</html>

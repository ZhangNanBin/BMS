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
</body>

<script src="<%=path %>/LayUI/layui.js"></script>
<script>
	layui.use('table', function() {
		var table = layui.table;
		var $ = layui.$;
		//GetAll接口实例
		table.render({
			elem : '#demo',
			method : "post",
			page : true, //开启分页
	        url: "<%=path %>/BookBorrowing/getAll",//方法所在页面和方法名
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
            cols: [[ //表头
            	{ field: 'id', title: 'ID', sort: true, fixed: 'left', hide: true },
                { field: 'bookBarcode', title: '图书条形码', fixed: 'left' },
                { field: 'readerNumber', title: '读者编号', fixed: 'left' },
                { field: 'borrowingDate', title: '借阅日期', fixed: 'left',templet: "<div>{{layui.util.toDateString(d.ordertime, 'yyyy-MM-dd')}}</div>"  },
                { field: 'returnDate', title: '归还日期', fixed: 'left',templet: "<div>{{layui.util.toDateString(d.ordertime, 'yyyy-MM-dd')}}</div>"  },
                { field: 'operatorNumber', title: '操作员编号', fixed: 'left' },
                { field: 'arrears', title: '欠款', fixed: 'left' },
                { field: 'paid', title: '是否还款', fixed: 'left', templet: "<div>{{d.paid?'已还':'未还'}}</div>" },
                { field: 'sendBack', title: '是否归还', fixed: 'left', templet: "<div>{{d.sendBack?'已还':'未还'}}</div>"},
            ]]
        });
    });
</script>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用AJAX以JSON方式获取数据</title>
<link rel="stylesheet" href="../LayUI/css/layui.css" media="all">

</head>
<body>
	<table id="demo"></table>
	<input type="button" value="通过AJAX获取一个Hero对象---" id="sender">
	<input type="button" value="通过AJAX获取一个Hero对象---" id="test">
</body>
<script type="text/javascript" src="../LayUI/layui.js"></script>
<script>
	layui.use('table', function() {
		var table = layui.table;
		var $ = layui.$;
		const goblName = "";
		const hnumber="";
		
		//GetAll接口实例
		table.render({
			elem : '#demo',
			method : "post",
			url : '../Book/getAll',//数据接口
			page : true, //开启分页
			request : {
				pageName : 'pageNo',//页码的参数名称
				limitName : 'pageSize' //每页数据量的参数名
			},
			where : { // 可使用编号和姓名进行筛选 模糊查找
				number : $(#name).val,
				name : $(#name).val
			},
			cols : [ [ //表头
			{
				field : 'id',
				title : 'ID',
				sort : true,
				fixed : 'left'
			}, {
				field : 'number',
				title : '编号'
			}, {
				field : 'name',
				title : '名字'
			}, {
				field : 'sex',
				title : '性别'
			} ] ]
		});

		$('#sender').click(function() {
			$.ajax({
				type : "post",
				url : "/bms/BasicInfoBook/update",
				data : JSON.stringify({
					id:6,
					name : "zhaDASDg",
					number : "A0002",
					categoryNumber : "A"
				}),
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				success : function(result) {
				},
				error : function(err) {

				}
			});

			// get和delete采用
			// 					$.ajax({
			// 						type : "post",
			// 						url : "../Security/login",
			// 						data : {
			// 							number : "20164089145",
			// 							passWord : "zhangyang",
			// 							userType : 1
			// 						},
			// 						success : function(result) {
			// 							var re = JSON.parse(result);
			// 							sessionStorage.setItem('userInfo', JSON
			// 									.stringify(re.data));
			// 							var userJsonStr = sessionStorage
			// 									.getItem('userInfo');
			// 							var userEntity = JSON.parse(userJsonStr);

			// 						},
			// 						error : function(err) {

			// 						}
			// 					});
		});

		$('#test').click(function() {
			// get和delete采用
			$.ajax({
				type : "post",
				url : "/bms/Book/get",
				data : {
					id : 1
				},
				success : function(result) {
					var ds = result.code;
					var sex = result.data;
				},
				error : function(err) {

				}
			});
		});
	});
</script>
</html>
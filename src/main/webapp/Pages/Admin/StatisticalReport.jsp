<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="<%=path %>/LayUI/css/layui.css" media="all" />
    <style>
        .tubiao {
            width: 600px;
        	height: 450px;
            margin: auto;
            margin-top: 5%;
        }
    </style>
</head>

<body>
    <div id="tubiao1" class="tubiao"></div>
    <div id="tubiao2" class="tubiao"></div>

</body>
<script src="<%=path %>/LayUI/layui.js"></script>
<script src="<%=path %>/LayUI/echarts.js"></script>
<script>
    layui.use(['element', 'layer'], function () {
        var element = layui.element
        var $ = layui.jquery;
        var layer = layui.layer;
        $.ajax({
            type: "post", //要用post方式                 
            url: '<%=path %>/StatisticalReport/getStatisticalReport',
            success: function (result) {
                //返回的数据用data.d获取内容
                if (result.code == 0) {
                    const data = result.data;
                    const readers = data.readers;
                    const basicInfoBooks = data.basicInfoBooks;
                    var myChart1 = echarts.init(document.getElementById("tubiao1"));
                    var myChart2 = echarts.init(document.getElementById("tubiao2"));
                    option1 = {
                        title: {
                            text: '读者借阅前十',
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c}次 ({d}%)"
                        },
                        series: [
                            {
                                name: '姓名',
                                type: 'pie',
                                radius: '70%',
                                center: ['50%', '50%'],
                                data: readers,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };
                    
                    option2 = {
                            title: {
                                text: '图书借阅前十',
                                x: 'center'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c}次 ({d}%)"
                            },
                            series: [
                                {
                                    name: '图书编号',
                                    type: 'pie',
                                    radius: '70%',
                                    center: ['50%', '50%'],
                                    data: basicInfoBooks,
                                    itemStyle: {
                                        emphasis: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };
                    myChart1.setOption(option1);
                    myChart2.setOption(option2);
                }
            },
            error: function (err) {
                layer.msg(err, {
                    icon: 5,
                    time: 1000
                });
            }
        })
    });
</script>

</html>

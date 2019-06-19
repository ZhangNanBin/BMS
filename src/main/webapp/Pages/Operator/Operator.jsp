<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../../LayUI/css/layui.css" />
    <link rel="stylesheet" href="../../LayUI/css/admin.css" media="all" />
    <title>图书管理系统</title>
    <style type="text/css">
        #ifrMain {
            height: 98%;
            visibility: inherit;
            width: 100%;
            z-index: 1;
        }

        a {
            cursor: pointer;
        }
    </style>
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域（可配合layui已有的水平导航） -->

            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item"><a id="SystemInfo">系统信息</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right" style="margin-right: 15px">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <asp:Image runat="server" ID="MyImage" CssClass="layui-nav-img" />
                        <asp:Label runat="server" ID="UserName"></asp:Label>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child layui-anim layui-anim-upbit" style="text-align: center;">
                        <dd><a id="BasicInfo">基本资料</a></dd>
                        <hr>
                        <dd><a id="Out">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo">
                    <span>图书管理系统</span>
                </div>
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree" id="Menu">
                    <li data-name="Student" class="layui-nav-item">
                        <a>
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>读者信息</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a onclick='handleMenuClick("图书借阅","1")'>图书借阅</a></dd>
                            <dd><a onclick='handleMenuClick("图书归还","2")'>图书归还</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs">
            <div class="layui-tab">
                <ul class="layui-tab-title" id="MyTabs">
                    <li id="homeIcon"><i class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>

        <!-- 内容主体区域 -->
        <div class="layui-body">
            <iframe id="ifrMain" name="ifrMain" src="Welcome.html"></iframe>
        </div>

        <!-- 底部固定区域 -->
        <div class="layui-footer">
            张南彬 20164089145
        </div>

    </div>
</body>
<script type="text/html" id="editInfo">
    <div style="width: 80%; margin: auto; text-align: center; margin-top: 5%">
        <div class="layui-form-item">
            <label class="layui-form-label">编号</label>
            <div class="layui-input-block">
                <input type="text" name="Number" id="Number" readonly="readonly" required="required" lay-verify="required" placeholder="请输入编号" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="SName" id="SName" readonly="readonly" required="required" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="text" name="Sex" id="Sex" readonly="readonly" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input type="text" name="Age" id="Age" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" name="Age" id="Phone" required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级</label>
            <div class="layui-input-block">
                <input type="text" name="Grade" id="Grade" readonly="readonly"  required="required" lay-verify="required" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="PassWord" id="PassWord" required="required" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" />
            </div>
        </div>
    </div>
</script>
<script src="../../LayUI/layui.js"></script>
<script src="../../LayUI/jquery-3.2.1.min.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer'], function () {
        var element = layui.element;
        var layer = layui.layer;
        var $ = layui.$ //重点处
        $("#Out").click(function () {
            window.location.href = "../Login.html";
        });
        $("#SystemInfo").click(function () {
            layer.msg("采用Java进行开发，环境为Eclipse", {
                icon: 1,
                time: 1000
            });
        });


        $("#BasicInfo").click(function () {
            $.ajax({
                type: "post", //要用post方式                 
                url: "./Student.aspx/q",//方法所在页面和方法名
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    layer.msg(data.d.Msg, {
                        icon: 1,
                        time: 1000
                    });
                    layer.open({
                        id: "AddInfo",
                        type: 1,
                        title: '编辑用户信息',
                        area: ['35%', '80%'],
                        shade: 0,
                        maxmin: true,
                        offset: 'auto',
                        content: $('#editInfo')[0].innerHTML,
                        btn: ['更新', '取消'],
                        yes: function () {
                            const Number = $("#Number").val();
                            const SName = $("#SName").val();
                            const Age = $("#Age").val();
                            const PassWord = $("#PassWord").val();
                            const data = {
                                studentModel: {
                                    Number: Number,
                                    SName: SName,
                                    Age: Age,
                                    PassWord: PassWord,
                                }
                            }
                            $.ajax({
                                type: "post", //要用post方式                 
                                url: "./Student.aspx/Update",//方法所在页面和方法名
                                contentType: "application/json; charset=utf-8",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (data) {
                                    //返回的数据用data.d获取内容
                                    layer.close(layer.index);
                                    layer.msg(data.d.Msg, {
                                        icon: 1,
                                        time: 1000
                                    });
                                },
                                error: function (err) {
                                    layer.close(layer.index);
                                    layer.msg(err.responseJSON.Message, {
                                        icon: 5,
                                        time: 1000
                                    });
                                }
                            })
                        },
                        btn2: function () {
                            layer.close(layer.index);
                        },
                        zIndex: layer.zIndex, //重点1
                        success: function (layero) {
                            $("#Number")[0].value = data.d.Data[0].Number;
                            $("#SName")[0].value = data.d.Data[0].Name;
                            $("#Sex")[0].value = data.d.Data[0].Sex;
                            $("#Age")[0].value = data.d.Data[0].Age;
                            $("#Phone")[0].value = data.d.Data[0].Telephone;
                            $("#PassWord")[0].value = data.d.Data[0].PassWord;
                            layer.setTop(layero); //重点2
                        }
                    });
                },
                error: function (err) {
                    layer.msg(err.responseJSON.Message, {
                        icon: 5,
                        time: 2000
                    });
                }
            })
        });

    });

    function handleMenuClick(lable, value) {
        let path = getUrl(value);
        document.getElementById("ifrMain").src = path;
        const str = "#" + value;
        const tab = $(str);
        if (tab.length === 1) {
            return;
        }
        const temp = `<li id=${value}><span onclick='handleMenuClick("${lable}","${value}")'>${lable}</span><i onclick='removeMenuClick("${value}")'  class="layui-icon layui-unselect layui-tab-close">ဆ</i></li>`;
        $("#MyTabs").append(temp);
    }

    function removeMenuClick(value) {
        var host = location.origin;
        let path = host + getUrl(value);
        const str = "#" + value;
        const tab = $(str);
        tab.remove();
        if (document.getElementById("ifrMain").src === path) {
            document.getElementById("homeIcon").className = "layui-this"
            document.getElementById("ifrMain").src = "Welcome.html";
        }
    }

    function getUrl(value) {
        let path = "/BMS/src/main/webapp/Pages";
        switch (value) {
            case "1":
                path += "/Readers/BookBorrowing.html";
                break;
            case "2":
                path += "/Readers/BookReturn.html";
                break;
            default:
                path += "/Login.aspx"
                break;
        }
        return path;
    }
</script>
</html>

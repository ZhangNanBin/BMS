<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="true"%>
<% String path = request.getContextPath(); %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="<%=path %>/LayUI/css/layui.css" />
    <link rel="stylesheet" href="<%=path %>/LayUI/css/admin.css" media="all" />
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
                <li class="layui-nav-item">
                    <a onclick='handleMenuClick("统计图表","10")'>统计图表</a>
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" style="margin-right: 15px">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <span>20164089118</span>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child layui-anim layui-anim-upbit" style="text-align: center;">
                        <dd><a id="BasicInfo">基本资料</a></dd>
                        <hr />
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
                    <li data-name="Faculty" class="layui-nav-item">
                        <a>
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>图书信息管理</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="console">
                                <a onclick='handleMenuClick("书籍类别","1")'>书籍类别</a>
                            </dd>
                            <dd data-name="console">
                                <a onclick='handleMenuClick("图书基本信息","2")'>图书基本信息</a>
                            </dd>
                            <dd data-name="console">
                                <a onclick='handleMenuClick("图书信息","3")'>图书信息</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="Teacher" class="layui-nav-item">
                        <a>
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>读者信息管理</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="console">
                                <a onclick='handleMenuClick("读者信息","4")'>读者信息</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="Student" class="layui-nav-item">
                        <a>
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>图书借还</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="console">
                                <a onclick='handleMenuClick("图书借阅","6")'>图书借阅</a>
                            </dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd data-name="console">
                                <a onclick='handleMenuClick("图书归还","7")'>图书归还</a>
                            </dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd data-name="console">
                                <a onclick='handleMenuClick("借阅信息","5")'>借阅信息</a>
                            </dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd data-name="console">
                                <a onclick='handleMenuClick("还款","9")'>还款</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="Student" class="layui-nav-item">
                        <a>
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>操作员信息管理</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="console">
                                <a onclick='handleMenuClick("操作员信息","8")'>操作员信息</a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs">
            <div class="layui-tab">
                <ul class="layui-tab-title" id="MyTabs">
                    <li id="homeIcon">
                        <i class="layui-icon layui-icon-home" onclick="handleMenuClick(999,homeIcon)"></i>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 内容主体区域 -->
        <div class="layui-body">
            <iframe id="ifrMain" name="ifrMain" src="<%=path %>/Pages/Welcome.jsp"></iframe>
        </div>
    </div>
</body>
<script type="text/html" id="editInfo">
    <form class="layui-form" lay-filter="formTestFilter">
       <input type="hidden" name="id" id="id" value="" />
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
<script src="<%=path %>/LayUI/layui.js"></script>
<script src="<%=path %>/LayUI/jquery-3.2.1.min.js"></script>
<script>
    //JavaScript代码区域
    layui.use(["element", "layer", "form"], function () {
        var element = layui.element;
        var layer = layui.layer;
        var $ = layui.$; //重点处
        var form = layui.form;
        popForm = layui.form;
        $("#Out").click(function () {
            window.location.href = "<%=path %>";
        });

        $("#SystemInfo").click(function () {
            layer.msg("采用Java进行开发，环境为Eclipse", {
                icon: 1,
                time: 1000,
                zIndex: layer.zIndex
            });
        });

        $("#BasicInfo").click(function () {
            $.ajax({
                type: "post", //要用post方式
                url: "<%=path %>/Security/getSession", //方法所在页面和方法名
                success: function (result) {
                    layer.msg("", {
                        icon: 1,
                        time: 1000,
                        zIndex: layer.zIndex
                    });
                    layer.open({
                        id: "Edit",
                        type: 1, //此处以iframe举例
                        title: "个人信息",
                        area: ["35%", "80%"],
                        shade: 0,
                        maxmin: true,
                        offset: "auto",
                        content: $("#editInfo")[0].innerHTML,
                        btn: ["更新", "取消"], //只是为了演示
                        yes: function () {
                            const id = parseInt($("#id").val());
                            const number = $("#number").val();
                            const name = $("#name").val();
                            const sex = $("#sex").val();
                            const age = parseInt($("#age").val());
                            const idNumber = $("#idNumber").val();
                            const telephone = $("#telephone").val();
                            const passWord = $("#passWord").val();
                            const data = {
                                id: id,
                                number: number,
                                name: name,
                                sex: sex,
                                age: age,
                                idNumber: idNumber,
                                telephone: telephone,
                                isAdmin: true,
                                passWord: passWord
                            };
                            $.ajax({
                                type: "post", //要用post方式
                                url: "<%=path %>/Operator/update", //方法所在页面和方法名
                                contentType: "application/json; charset=utf-8",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (data) {
                                    layer.close(layer.index);
                                },
                                error: function (err) {
                                    layer.close(layer.index);
                                    layer.msg(err.responseJSON.Message, {
                                        icon: 5,
                                        time: 1000,
                                        zIndex: layer.zIndex
                                    });
                                }
                            });
                        },
                        btn2: function () {
                            layer.close(layer.index);
                        },
                        success: function (layero) {
                            popForm.val("formTestFilter", {
                                id: result.data.id,
                                number: result.data.number,
                                name: result.data.name,
                                sex: result.data.sex,
                                age: result.data.age,
                                idNumber: result.data.idNumber,
                                telephone: result.data.telephone,
                                passWord: result.data.passWord
                            });
                            popForm.render(null, "formTestFilter");
                            layer.setTop(layero); //重点2
                        }
                    });
                },
                error: function (err) {
                    layer.msg(err.responseJSON.Message, {
                        icon: 5,
                        time: 2000,
                        zIndex: layer.zIndex
                    });
                }
            });
        });
    });

    function getUrl(value) {
        let path = "<%=path %>/Pages";
        switch (value) {
            case "1":
                path += "/Public/BookCategory.jsp";
                break;
            case "2":
                path += "/Public/BasicInfoBook.jsp";
                break;
            case "3":
                path += "/Admin/Book.jsp";
                break;
            case "4":
                path += "/Admin/Reader.jsp";
                break;
            case "5":
                path += "/Admin/BookBorrowing.jsp";
                break;
            case "6":
                path += "/Public/BookBorrowing.jsp";
                break;
            case "7":
                path += "/Public/BookReturn.jsp";
                break;
            case "8":
                path += "/Admin/Operator.jsp";
                break;
            case "9":
                path += "/Admin/Repayment.jsp";
                break;
            case "10":
                path += "/Admin/StatisticalReport.jsp";
                break;
            default:
                path += "/Welcome.jsp";
                break;
        }
        return path;
    }

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
            document.getElementById("homeIcon").className = "layui-this";
            document.getElementById("ifrMain").src = "<%=path %>/Pages/Welcome.jsp";
        }
    }
</script>

</html>
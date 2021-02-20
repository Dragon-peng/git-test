<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/10
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="easyui.jsp" %>
<html>
<head>
    <title>Title</title>
    <script>
        function test1() {
            //判断选项卡是否包含某个标题对应的面板
            let r = $("#tab").tabs('exists', '员工信息管理');
            console.log(r);
        }

        function test2() {
            //选择指定选项卡的面板，并展示
            $("#tab").tabs('select', '员工信息管理');
        }

        function test3() {
            //添加form.jsp的页面，所在选项卡面板
            $("#tab").tabs('add', {
                title: '新加的tab',
                iconCls: 'icon-man',
                closable: true,
                href: '${pageContext.request.contextPath}/form.jsp',
            });
        }

        function test4() {
            //关闭没有叉的选项卡面板
            $("#tab").tabs('close', '首页');
        }

        function test5() {
            //1.判断是否包含"员工管理"的面板
            if ($("#tab").tabs('exists', '员工管理信息')) {
                //2.如果包含，选中，select
                $("#tab").tabs('select', '员工管理信息');
            } else {
                //3.如果不包含，添加，add
                $("#tab").tabs('add', {
                    title: '员工管理信息',
                    iconCls: 'icon-man',
                    href: '${pageContext.request.contextPath}/datagrid.jsp'
                });
            }
        }

        function test6() {
            if ($("#tab").tabs('exists', '员工管理信息')) {
                $("#tab").tabs('close', 0);
            } else {
                //1.关闭当前面板
                $("#tab").tabs('close', 0);
                //2.添加新的面板
                $("#tab").tabs("add", {
                    title: '员工管理信息',
                    iconCls: 'icon-man',
                    href: '${pageContext.request.contextPath}/datagrid.jsp',
                })
            }
        }
    </script>
</head>
<body>
<!--测试按钮-->
<button onclick="test1()">exists</button>
<button onclick="test2()">select</button>
<button onclick="test3()">add</button>
<button onclick="test4()">close</button>
<button onclick="test5()">员工管理</button>
<button onclick="test6()">员工管理 单选项卡测试</button>


<div style="width: 1100px;height: 600px;">
    <div id="tab">
        <div data-options="title:'首页'">11</div>
        <div data-options="title:'员工信息管理',iconCls:'icon-man',closable:true,href:'${pageContext.request.contextPath}/datagrid.jsp',">
            22
        </div>
    </div>
</div>

<script>
    $("#tab").tabs({
        height: 100,//高度
        fit: true,//填充tab的div所在的父标签的全部空间
    });
</script>
</body>
</html>

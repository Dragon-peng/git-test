<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/10
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="easyui.jsp"%>
<html>
<head>
    <title>Title</title>
    <style>
        ul{
            list-style: none;
            padding-left:5px;
            padding-right: 5px;
        }
        ul>li>a{
            width: 100%;
            border:1px dotted lightblue;
        }
    </style>
</head>
<body class="easyui-layout">
    <div data-options="title:'标题',region:'north',height:120,">上</div>
    <div data-options="title:'底部信息',region:'south',height:80">下</div>
    <div data-options="title:'菜单',region:'west',width:180,">
        <!--菜单栏，手风琴-->
        <div id="ad">
            <div data-options="title:'系统功能'">
                <ul>
                    <li><a href="#" class="easyui-linkbutton">用户管理</a></li>
                    <li><a href="#" class="easyui-linkbutton">修改密码</a></li>
                    <li><a href="#" class="easyui-linkbutton">退出</a></li>
                </ul>
            </div>
            <div data-options="title:'员工信息管理'">
                <ul>
                    <li><a href="#" class="easyui-linkbutton" data-options="onClick:menu.add21">员工管理</a></li>
                    <li><a href="#" class="easyui-linkbutton" data-options="onClick:menu.add22">修改密码</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div data-options="title:'通知',region:'east',width:180">右</div>
    <div data-options="title:'主页',region:'center'">
        <!--选项卡父div-->
        <div id="main_tabs">

        </div>
    </div>

    <script>
        let menu = {
            add21:function () {
                //关闭第0个选项卡
                $("#main_tabs").tabs('close',0);

                //1.添加一个选项卡，menu_tabs
                $("#main_tabs").tabs('add',{
                    title:'员工管理',
                    href:'${pageContext.request.contextPath}/datagrid.jsp',
                })
            },
            add22:function () {
                //1.关闭第一个选项卡
                $("#main_tabs").tabs('close',0);
                //2.添加
                $("#main_tabs").tabs('add',{
                    title:'添加用户',
                    href:'${pageContext.request.contextPath}/dialog.jsp',

                })
            }
        }


        $("#ad").accordion({
            // width:160,
            // height:400,
            fit:true,//将手风琴整体填充到父标签中
            animate:true,//是否展示过度的动画

        });
        $("#ad ul>li>a").linkbutton({
            plain:true,//将按钮设置简约的样式

        });

        /*是main_tas 变成选项卡*/
        $("#main_tabs").tabs();


    </script>
</body>
</html>

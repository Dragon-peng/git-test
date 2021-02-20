<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/10
  Time: 18:54
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
<body>
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
                <li><a href="#" class="easyui-linkbutton">员工管理</a></li>
                <li><a href="#" class="easyui-linkbutton">修改密码</a></li>
            </ul>
        </div>
    </div>
    <script>
        $("#ad").accordion({
            width:160,
            height:400,
            // fit:true,//将手风琴整体填充到父标签中
            animate:true,//是否展示过度的动画

        });
        $("#ad ul>li>a").linkbutton({
           plain:true,//将按钮设置简约的样式

        });
    </script>
</body>
</html>

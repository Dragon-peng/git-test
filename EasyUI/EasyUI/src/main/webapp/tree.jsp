<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/10
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="easyui.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ul id="tree-category1">
    <li><span>图书</span>
        <!--子列表-->
        <ul>
            <li><span>小说</span></li>
            <li><span>计算机图书</span></li>
            <li><span>漫画</span></li>
        </ul>
    </li>
    <li><span>电子产品</span>
        <!--子列表-->
        <ul>
            <li><span>手机</span></li>
            <li><span>电脑</span>
                <!--子列表-->
                <ul>
                    <li><span>Lenovo</span></li>
                    <li><span>Dell</span></li>
                    <li><span>Mac</span></li>
                </ul>
            </li>
            <li><span>耳机</span></li>
        </ul></li>
    <li><span>衣服</span>
        <!--子列表-->
        <ul>
            <li><span>男上衣</span></li>
            <li><span>女上衣</span></li>
            <li><span>裤子</span></li>
        </ul>
    </li>
</ul>
<script>
    $("#tree-category1").tree({
        animate:true,//是否打开过度效果
        checkbox:true,//节点显示复选框
        lines:true,//显示节点直接连接虚线
    });
</script>

<hr>
<!-- 动态从数据库中查询多个类别信息-->
<div class="easyui-window" data-options="title:'类别展示',width:200">
    <ul id="tree_category"></ul>
</div>

<script>
    $("#tree_category").tree({
       url:"${pageContext.request.contextPath}/category/tree"
    });
</script>


</body>
</html>

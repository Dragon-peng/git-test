<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/8
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyui.jsp"%>
</head>
<body>
    <!--标签div + easyui-panel -->
    <div class="easyui-panel" data-options="title:'我是标题',iconCls:'icon-man'">面板1</div>

    <hr/>
    <!-- div+panel() -->
    <!-- 按钮工具组-->
    <div id="tt">
        <a href="#" class="icon-help"></a>
    </div>
    <div id="p1">一个面板</div>
    <script>
        /*生成一个panel*/
        $("#p1").panel({
            //标题
            title:'我是标题',
            //图标
            iconCls:'icon-filter',
            //宽度
            width:400,
            //高度:
            height:300,
            //可折叠
            collapsible:true,
            //可放大
            maximizable:true,
            //可关闭
            closable:true,
            //可缩小
            minimizable:true,
            //绑定按钮组
            tools:'#tt',
            //ajax异步加载远程的内容，显示在面板中
            href:'${pageContext.request.contextPath}/index.jsp',//异步加载远程内容
        });

    </script>
</body>
</html>

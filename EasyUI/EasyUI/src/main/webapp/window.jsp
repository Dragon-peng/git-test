<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/8
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyui.jsp"%>
</head>
<body>
    <!--定义一个按钮组-->
    <div id="tt">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"></a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'"></a>
    </div>
    <!--div + window()-->
    <div id="w1">
        这是一个窗口
    </div>

    <script>
        /*window窗口*/
        $("#w1").window({
            width:600,
            height:400,
            iconCls:'icon-man',
            title:'窗口',
            href:'${pageContext.request.contextPath}/index.jsp',
            shadow:true,//窗体显示阴影
            modal:true,//灯罩效果，窗体外的的按钮不能使用
            draggable:false,//是否可拖拽
            tools:'#tt',//绑定按钮组
        });
    </script>
</body>
</html>

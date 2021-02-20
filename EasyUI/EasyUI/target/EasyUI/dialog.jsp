<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/8
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyui.jsp" %>
</head>
<body>
<!--定义一个按钮组-->
<div id="tt">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"></a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'"></a>
</div>
<!--底部的按钮组-->
<div id="tt2">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-man'">登录</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
</div>
<!--div + dialog()-->
<div id="d1">
    <!--登录表单-->
    <form action="#">
        <fieldset>
            <legend>登录</legend>
            <table align="center">
                <tr>
                    <td>用户名</td>
                    <td><input type="text" name="username" id="username"></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input type="text" name="password" id="password"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>

<script>
    /*对话框*/
    $("#d1").dialog({
        //图标
        iconCls: 'icon-man',
        //宽度
        width: 400,
        //高度
        // height: 400,
        //标题
        title: '对话框',
        //灯罩效果，窗体外的的按钮不能使用
        modal: true,
        //对话框上部，工具栏位置，绑定一个按钮组
        // toolbar: '#tt',
        //对话框底部，绑定按钮
        buttons: '#tt2'
    });
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/8
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyui.jsp" %>
</head>
<body>
<a href="#" class="easyui-linkbutton" data-options="onClick:test1">测试消息框</a>
<a href="#" class="easyui-linkbutton" data-options="onClick:test2">测试提示框</a>
<a href="#" class="easyui-linkbutton" data-options="onClick:test3">测试确认框</a>

<script>
    /**
     * 展示一个消息框
     */
    function test1() {
        $.messager.show({
            title: '操作提示',
            //显示过度时间
            showSpeed: 1000,
            //显示时间
            timeout: 5000,
            //显示消失的过场效果
            showType: 'fade',
            //提示文字
            msg: '你的余额已经不足，请及时充值！',
        });
    }

    /**
     * 警告框
     */
    function test2() {
        $.messager.alert({
            title: '警告',
            msg: '权限不足!',
            icon: 'error',//提示框图标，'error','info','question','warning'
            //点击确定，触发函数
            fn: function () {
                //窗口关闭
                console.log("窗口关闭");
            }
        });
    }

    /**
     * 确认框
     */
    function test3() {
        $.messager.confirm({
            title: '警告',
            msg: '是否要删除',
            //用户选择确定或者取消后，调用函数
            fn: function (r) {
                console.log(r);
                if (r){
                    //删除数据
                }else {
                    //什么也不做
                }
            }
        });
    }
</script>

</body>
</html>

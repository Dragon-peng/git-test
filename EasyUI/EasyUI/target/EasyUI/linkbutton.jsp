<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/7
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyui.jsp"%>
</head>
<body>
    <!--HTML标签 + easyUI-样式名-->
    <a href="#" class="easyui-linkbutton">按钮</a>

    <!--HTML标签 + easyUI插件方法-->
    <a id="btn1" href="#">按钮</a>
    <script>
        $("#btn1").linkbutton();
    </script>

    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',size:'large'">按钮</a>

    <a id="btn2" href="#">按钮</a>
    <script>
        $("#btn2").linkbutton({
            iconCls:'icon-cancel',
            size:'large',
            disabled:true
        });
    </script>


    <a href="#" class="easyui-linkbutton" data-options="onClick:textEvent">按钮</a>
    <script>
        function textEvent() {
            alert("按钮被点击");
        }
    </script>

    <a id="btn3" href="#">按钮</a>
    <script>
        $("#btn3").linkbutton({
            iconCls:'icon-cancel',//图标
            size:'large',//变大
            disabled:false,//按钮是否不可用
            onClick:function () {
                alert("按钮被点击");
            }
        });
    </script>

    <a href="#" id="btn4">按钮</a>
    <script>
        $("#btn4").linkbutton({
            iconCls:'icon-ok',
            onClick:function () {
                $("#btn4").linkbutton('resize',{
                    width:300,
                    height:100
                })
            },
        })
    </script>

    <a href="#" id="btn5">按钮</a>
    <script>
        $("#btn5").linkbutton({
            iconCls:'icon-ok',
            onClick:function () {
                alert("按钮被点击");
                $("#btn5:first").linkbutton('disable');
            }
        })
    </script>
</body>
</html>

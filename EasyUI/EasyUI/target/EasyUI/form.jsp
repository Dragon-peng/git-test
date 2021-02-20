<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/8
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyui.jsp" %>
</head>
<body>
<form action="#">
    用户名：<input type="text" name="username" id="username"><br>
    自我介绍：<input type="text" name="self_introduce" id="self_introduce"><br>
</form>
<script>
    /**
     *textbox插件
     */
    $("#username").textbox({
        width: 260,
        required: true,//是否必填
        /**
         * 验证规则：
         * 1.验证只有一个，可以给值 字符串：内置{'url','email','length[m,n]'}
         * 2.验证多个，可以给数组 ['email','length[8,16']
         */
        validType: ['length[12,20]'],
        missingMessage: '用户名不能为空',//为空时提示文字
        invalidMessage: '用户名长度必须为12到20字符！',//不符合验证规则的提示文字
        readonly: false,//是否只读
        type: 'text',//input的type
        prompt: '请输入用户名',//输入框提示文字
        buttonText: '搜索',//按钮文字，模拟搜索输入框
        buttonIcon: 'icon-search',//定义搜索按钮图标
        /*
        onClickButton:function () {//绑定事件
            // alert("搜索");
            //1.获得输入框内容
            let value =  $("#username").textbox('getValue');
            alert(value);
            //清空输入内容的数据
            // $("#username").textbox('clear');
            // $(this).textbox('clear');
            //2.发送ajax请求
            //判断输入框的内容是是否符合验证规则
            let r = $(this).textbox('isValid');
            alert(r);
        }*/
        onClickButton: function () {
            //验证输入框是否符合要求，如果符合要求，则发送ajax请求，否则提示输入框内容不匹配
            let flag = $(this).textbox('isValid');
            if (flag) {
                alert("验证成功！");
            } else {
                alert("验证失败！");
            }
        }
    });
    $("#self_introduce").textbox({
        multiline: true,//是否多行，模拟textarea
        width: 200,
        height: 100,
        prompt: '自我介绍',//输入框提示文字
    });
</script>
<hr>
<!--数字输入框-->
<form action="#">
    年龄：<input type="text" name="age" id="age"><br>
    价格：<input type="text" name="price" id="price">
</form>
<script>
    $("#price").numberbox({
        precision: 2,
        min: 0,
        suffix: '$'//输入的数字，默认追加一个符合

    });

    $("#age").numberbox({
        precision: 2,//默认保留两位小数，四舍五入
        min: 18,//最小值
        max: 70,//最大值
    });
</script>

<hr>
<form action="#">
    出生日期：<input type="text" name="birth" id="birth">
</form>
<script>
    $("#birth").datebox({
        required: true,//是否必填
        editable: false,//是否允许用户修改内容
    });
</script>
<hr>
<form action="#">
    上传文件：<input type="text" name="file" id="file">
</form>
<script>
    $("#file").filebox({
        buttonText: '选择文件',//设置按钮文字
        buttonIcon: 'icon-save',//设置按钮图标
        width: 300
    });
</script>
<hr>
<!-- ~~~~~~~~~~~~~~~~~按钮组~~~~~~~~~~~~~~~~ -->
<!-- 添加客户信息表单的按钮组-->
<div id="addPersonBtn">
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="onClick:person.add">注册</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="onClick:person.clear">清空</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="onClick:person.showUpdate">修改</a>

</div>
<div id="fmdiv" style="text-align: center">
    <form id="fmPersonAdd" action="${pageContext.request.contextPath}/person/add">
        <fieldset>
            <legend>注册</legend>
            <table align="center">
                <tr>
                    <td>姓名</td>
                    <td><input type="text" name="name" id="name"></td>
                </tr>
                <tr>
                    <td>年龄</td>
                    <td><input type="text" name="age" id="age1"></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td><input type="text" name="sex" id="sex"></td>
                </tr>
                <tr>
                    <td>手机号</td>
                    <td><input type="text" name="mobile" id="mobile"></td>
                </tr>
                <tr>
                    <td>地址</td>
                    <td><input type="text" name="address" id="address"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
<script>
    /* person相关函数 */
    let person = {
        add: function () {
            //将表单提交
            //$("form").form('submit');
            $("#fmPersonAdd").form("submit");
        },
        clear: function () {
            $("#fmPersonAdd").form("clear");
        },
        showUpdate: function () {
            /**
             * $.ajax({
             *     url
             *     type
             *     success:function(json){
             *         ps
             *     }
             * })
             *
             *
             * */
                //将服务器查询到person信息--->json串--->js对象
            let ps = {
                    "id": "1001",
                    "name": "张三",
                    "age": 18,
                    "sex": 1,
                    "mobile": "12345678901",
                    "address": "湖北"
                }
            //将ps对象数据加载到表单中
            $("#fmPersonAdd").form('load', ps);

            /**
             *  第二种方法：
             *      $("fmPersonAdd").form('load','${pageContext.request.contextPath}/person/getByd?id=1001');
             *
             *
             * */

        }
    }
    /**
     * 表单绑定onSubmit事件
     *
     * */
    $("#fmPersonAdd").form({
        ajax: true,//指定是否是异步提交

        //表单提交之前，触发
        onSubmit: function () {
            alert("表单要提交了，之前");
            return true;//允许提交表单
            // return false;//不允许提交表单
        }
    })

    /**
     * easyui插件初始化
     */
    $("#fmdiv").dialog({
        title: '添加客户',
        iconCls: 'icon-man',
        width: 300,
        buttons: '#addPersonBtn',
    });
    $("#name").textbox({
        required: true,
    });
    $("#age1").numberbox({
        required: true,
        precision: 0,
        min: 0,
        max: 60,

    });
    $("#sex").numberbox({
        required: true,
        precision: 0,
        min: 0,
        max: 1,
    });
    $("#mobile").numberbox({
        required: true,
        precision: 0,
        validType: 'length[11,11]',
        invalidMessage: '请输入正确的手机号',

    });
    $("#address").textbox({
        required: true,
        multiline: true,
        height: 50
    });
</script>

</body>
</html>

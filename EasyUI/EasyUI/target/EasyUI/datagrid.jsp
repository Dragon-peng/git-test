<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/8
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="easyui.jsp" %>
<html>
<head>
    <title>Title</title>
    <script>
        function test1() {
            //reload方法
            $("#datagrid_person").datagrid('reload');
        }

        function test2() {
            //load方法
            $("#datagrid_person").datagrid('load');
        }
    </script>

    <style>
        #dialog_peron_add td {
            border: 1px dotted gray;
        }
    </style>
</head>
<body>
<hr>
<!--测试按钮-->
<button onClick="test1()">reload</button>
<button onClick="test2()">load</button>

<!--按钮键-->
<div id="datagrid_toolbar">
    <a href="javascript:void(0);">删除选中</a>
    <a href="javascript:void(0);">添加</a>
    <input type="text" name="keyword" id="keyword">
</div>
<!--添加用户的按钮-->
<div id="dialog_person_add_buttons">
    <a href="javascript:void(0);">注册</a>
    <a href="javascript:void(0);">重置</a>
</div>
<!--修改用户的按钮-->
<div id="dialog_person_edit_buttons">
    <a href="javascript:void(0);">修改</a>
    <a href="javascript:void(0);">重置</a>
</div>
<!--展示person的table-->
<table id="datagrid_person">
    <thead>
    <tr>
        <!--checkbox:true 将id列设置为复选框-->
        <th data-options="field:'id',width:100,checkbox:true">ID</th>
        <th data-options="field:'username',width:120">姓名</th>
        <!--formatter:函数名 格式化值，将指定的值设置其他内容-->
        <th data-options="field:'sex',width:80,formatter:person.sex_fmt">性别</th>
        <!--sortable:true 在年龄列添加一个排序按钮，每点一次出发一次url,sort=该列的field&order=asc|desc 并把order的排序方式和列名返回-->
        <th data-options="field:'age',width:80,sortable:true">年龄</th>
        <th data-options="field:'mobile',width:180">手机号</th>
        <!--hidden:true 隐藏该列-->
        <th data-options="field:'address',width:200,hidden:false">地址</th>
        <th data-options="field:'operate',width:200,formatter:person.operate_fmt">操作</th>
    </tr>
    </thead>
</table>

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~添加person的dialog~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<div id="dialog_person_add" align="center">
    <form id="form_person_add" action="${pageContext.request.contextPath}/person/add">
        <table>
            <tr>
                <td>用户名</td>
                <td><input type="text" name="username" id="username"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><input type="text" name="sex" id="sex"></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="age" id="age"></td>
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
    </form>
</div>

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~修改person的dialog~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
<div id="dialog_person_edit" align="center">
    <form id="form_person_edit" action="${pageContext.request.contextPath}/person/edit">
        <table>
            <tr>
                <td><input type="hidden" name="id"></td>
            </tr>
            <tr>
                <td>用户名</td>
                <td><input type="text" name="username" id="username2"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><input type="text" name="sex" id="sex2"></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="age" id="age2"></td>
            </tr>
            <tr>
                <td>手机号</td>
                <td><input type="text" name="mobile" id="mobile2"></td>
            </tr>
            <tr>
                <td>地址</td>
                <td><input type="text" name="address" id="address2"></td>
            </tr>
        </table>
    </form>
</div>
<script>
    /*person相关的函数*/
    let person = {
        /*
        * 参数：
        *   value:当前行的值
        *   row:当前行的json数据
        *   index:数据所在行的下标
        *
        * */
        sex_fmt: function (value, row, index) {
            // console.log(value,row,index);
            if (value == 1) {
                return '男';
            } else {
                return '女';
            }
        },
        /*格式化显示操作按钮列*/
        operate_fmt: function (value, row, index) {
            return '<a href="javascript:void(0)" class="person_toRemove_btn">删除</a> ' +
                '<a href="javascript:void(0)" class="person_toUpdate_btn">修改</a>';
        }
    };

    /*生效datagrid的效果*/
    // $("table").datagrid();
    $("#datagrid_person").datagrid({
        title: '客户信息',
        iconCls: 'icon-man',
        height: 460,
        //自动请求url，自动创建tr，装载数据
        /* 设置th列的属性，表明controller响应的json串中对象的属性和列的对应关系*/
        url: '${pageContext.request.contextPath}/person/all',
        //引用按钮组
        toolbar: '#datagrid_toolbar',
        //是否加行号
        rownumbers: true,
        //是否加复选框,使行在复选框选中，才选中
        checkOnSelect: true,
        //让表格的列宽，强行自适应到整合页面宽度
        fitColumns: true,
        //斑马线效果
        striped: true,
        //datagrid数据加载完毕之后，执行的代码
        onLoadSuccess: function () {
            //datagrid数据加载完毕，再使用easyui插件，再次使按钮效果生效
            //$("删除").linkbutton();
            /* ~~~~~~~~~~~~~~~~~~~~修改 表单~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
            $(".person_toUpdate_btn").linkbutton({
                iconCls: 'icon-edit',
                onClick: function () {
                    //1.显示dialog--修改dialog属性closed属性值为false
                    $("#dialog_person_edit").dialog({
                        closed: false,//显示
                        //添加灯罩效果
                        modal: true,
                    });
                    //2.获得当前行数据的id属性值
                    let id = $(this).parent().parent().parent().children().eq(0).find("input").val();
                    //3.ajax请求，根据id从控制器获取对应的person信息。json
                    //4.填充在form表单中，"load"
                    $("#form_person_edit").form('load', '${pageContext.request.contextPath}/person/id?id=' + id);
                }
            });
            $(".person_toRemove_btn").linkbutton({
                iconCls: 'icon-cancel',
            });
        },
        //添加分页工具类
        /**
         * 分页会每次自动请求datagrid的url
         * 页面向控制器返回两个数据
         * page:页号
         * rows:行数
         * 控制器向页面返回rows行list集合信息和总数
         *  json{
         *      rows:list集合的实体信息,
         *      total:数据总数
         *  }
         *  public Object getPage(Integer page,Integer rows){
         *      1.接受请求参数
         *      2.根据page和rows查询当前页实体数据，List集合
         *      3.获得总数
         *      4.将数据封装成Map  或者PageResult包含List:rows和total
         *            key   value
         *            rows  List<>集合
         *            total 数据总数
         *      5.return map;
         *  }
         *
         *  xxService(page rows)
         *      查询得到数据的总和
         *      查询得到当前页的数据
         *  Dao
         * */
        pagination: true,

    });

    /*生效dialog*/
    $("#dialog_person_add").dialog({
        width: 300,
        title: '添加客户信息',
        iconCls: 'icon-man',
        buttons: '#dialog_person_add_buttons',
        //初始关闭状态
        closed: true
    });

    /*生效linkbutton*/
    $("#datagrid_toolbar>a:contains('删除选中')").linkbutton({
        iconCls: 'icon-remove',
        onClick: function () {
            //获得被选中的行数据
            let as = $("#datagrid_person").datagrid('getChecked');
            // console.log(as);
            //删除被选中的信息
            /**
             * 1.获得所有被选中的id参数
             * 2.ajax方式发送参数
             * 3.根据服务器响应式的结果，作出提示
             */
            let param = "";
            for (let i = 0; i < as.length; i++) {
                let id = as[i].id;
                if (i == 0) {
                    param = param + "ids=" + id;
                } else {
                    param = param + "," + id;
                }
            }
            // console.log(param);
            $.ajax({
                url: "${pageContext.request.contextPath}/person/deleteBatch",
                type: 'post',
                data: param,
                dataType: 'json',
                success: function (json) {
                    // console.log(json);
                    /**
                     * 1.重新加载当前页面的信息
                     * 2.提示信息
                     */
                    $("#datagrid_person").datagrid('reload');
                    $.messager.show({
                        title: '提示',
                        msg: json.msg,
                    })
                }
            });
        }

    });
    $("#datagrid_toolbar>a:contains('添加')").linkbutton({
        iconCls: 'icon-add',
        onClick: function () {
            //1.显示dialog--修改dialog属性closed属性值为false
            $("#dialog_person_add").dialog({
                closed: false,//显示
                //添加灯罩效果
                modal: true,
            });
        }
    });

    /* ~~~~~~~~~~~~~~~~~~~~添加person的form表单 start~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
    $("#dialog_person_add_buttons a:contains('注册')").linkbutton({
        //绑定表单中的信息事件
        onClick: function () {
            //1.将表单数据提交到控制器
            // $("form").from("submit")
            $("#form_person_add").form('submit');
            // console.log(as);
            //2.表单提交成功之后，重新加载，将数据datagrid数据reloady一次
            $("#form_person_add").form({
                success: function (data) {
                    //添加成功
                    let json = JSON.parse(data);
                    $.messager.show({
                        title: '提示',
                        msg: json.msg,
                    });
                    //将dialog关闭
                    $("#dialog_person_add").dialog({
                        closed: true,
                    });
                    //将当前datagrid重新加载
                    $("#datagrid_person").datagrid('reload');
                    //清空表单
                    $("#form_person_add").form('clear');
                }
            })
        }
    });
    $("#dialog_person_add_buttons a:contains('重置')").linkbutton({
        //清空表单
        onClick: function () {
            $("#form_person_add").form('clear');
        }
    });

    /* ~~~~~~~~~~~~~~~~~~~~添加person的form表单 end~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

    /* ~~~~~~~~~~~~~修改person的form表单 person_toUpdate_btn start~~~~~~~~~~~~~~~~~~ */

    //初始化修改dialog表单
    $("#dialog_person_edit").dialog({
        title: '修改客户信息',
        iconCls: 'icon-man',
        width: 300,
        closed: true,
        buttons: '#dialog_person_edit_buttons',

    })
    $("#dialog_person_edit_buttons a:contains('修改')").linkbutton({
        //修改单击事件
        onClick: function () {
            //1.提交表单数据
            $("#form_person_edit").form('submit');
            //2.修改提交后form
            $("#form_person_edit").form({
                success: function (data) {
                    //修改的表单提交成功，且服务器响应到浏览器
                    //1.关闭修改的dialog
                    $("#dialog_person_edit").dialog({
                        closed: true,
                    })
                    //2.提示修改成功
                    let json = JSON.parse(data);
                    $.messager.show({
                        title: '提示',
                        msg: json.msg,
                    })
                    //3.datagrid重新加载
                    $("#datagrid_person").datagrid('reload');
                }
            })
        }
    });
    $("#dialog_person_edit_buttons a:contains('重置')").linkbutton({});


    /* ~~~~~~~~~~~~~~~~~~~~修改person的form表单 end~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

    /*搜索按钮*/
    $("#keyword").textbox({
        buttonIcon: 'icon-search',
        buttonText: '搜索',
        width: 240,
        onClickButton: function () {
            //1.获得输入框的输入文本
            let keyword = $("#keyword").val();
            //2.使用datagrid的load方法，发送关键字参数
            /**
             *load 自动请求datagrid中的url路径并把keywords: keyword并接上
             * */
            $("#datagrid_person").datagrid('load', {
                keywords: keyword,
            })
            //3.数据自动重新加载

            //4.提示信息：查询结束
            if (!isNull(keyword)){
                $.messager.show({
                    title: '提示',
                    msg: '查询成功',
                })
            }

        }
    });
    //判断搜索栏是否为空
    function isNull(val){
        let str = val.replace(/(^\s*)|(\s*$)/g, '');//去除空格
        if (str == '' || str == undefined || str == null){
            return true;
        }else {
            return false;
        }
    }
    <!--添加按钮微调-->
    $("#dialog_person_add_buttons a:contains('注册')").css("float", "left").css("margin-left", "0")
    $("#dialog_person_edit_buttons a:contains('修改')").css("float", "left").css("margin-left", "0")
</script>
</body>
</html>

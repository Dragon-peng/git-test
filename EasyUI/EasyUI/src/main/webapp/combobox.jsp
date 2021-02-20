<%--
  Created by IntelliJ IDEA.
  User: 19715
  Date: 2020/11/10
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="easyui.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <!--性别-->
    <select name="sex" id="sex">
        <option value="1">男</option>
        <option value="0">女</option>
    </select>
    <script>
        $("#sex").combobox({
            width:100,
            panelHeight:70,//下拉的高度
            multiple:true,//是否多选，替代复选框
        });
    </script>
    <hr>
    <form id="fm" action="slt">
        <input type="text" name="deptId" id="deptId">
    </form>
    <script>
        $("#deptId").combobox({
            url:'${pageContext.request.contextPath}/department/all',
            textField:'name',
            valueField:'id',
            // multiple: true
        });
    </script>
</body>
</html>

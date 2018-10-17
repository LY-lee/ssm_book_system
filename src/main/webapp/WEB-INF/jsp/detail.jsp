<%--
  Created by IntelliJ IDEA.
  User: liyan
  Date: 2018/10/16
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>
<html>
<head>
    <title>图书详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入BootStrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 Shim 和 Respond.js 用于让IE8 支持 HTML元素和媒体查询 -->
    <!-- 注意：如果通过file：// 引入Respond.js文件，则该文件无法起效果 -->
    <!-- [if lt IE9] -->
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <!-- [endif] -->
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    Hisen<small>图书管理系统By ssm框架</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-tabs">
                <li><a href="<%=appPath%>/book/detail/1003">图书具体位置</a></li>
                <li class="active"><a href="<%=appPath%>/book/detail/1003">图书具体信息</a></li>
                <li class="disabled"><a href="#">信息</a></li>
            </ul>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    图书详情<small>显示当前图书详细信息</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>图书编号</th>
                    <th>图书名字</th>
                    <th>图书数量</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${requestScope.get('book').bookId}</td>
                    <td>${requestScope.get('book').name}</td>
                    <td>${requestScope.get('book').number}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <p>
                <em>《${requestScope.get('book').name}》</em>${requestScope.get('book').detail}
            </p>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap的JavaScript插件需要引入jQuery) -->
<script src="https://code.jquery.com/jquery.js"></script>
</body>
</html>

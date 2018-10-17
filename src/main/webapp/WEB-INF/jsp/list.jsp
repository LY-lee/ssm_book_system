<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>图书列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    Hisen
                    <small>图书管理系统by ssm框架</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-tabs">
                <li class="active"><a href="<%=appPath%>/book/list">首页</a></li>
                <li><a href="<%=appPath%>/book/detail/1000">图书具体信息</a></li>
                <li><a href="<%=appPath%>/add.jsp">添加图书信息</a></li>
                <li class="disabled"><a href="#">信息</a></li>
            </ul>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>图书列表
                    <small>显示当前图书库存信息</small>
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
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${requestScope.get('list')}" varStatus="status">
                    <tr>
                        <td>${book.bookId}</td>
                        <td>${book.name}</td>
                        <td>${book.number}</td>
                        <td>
                            <a href="<%=appPath%>/book/detail/${book.bookId}">详情</a> |
                            <a href="<%=appPath%>/book/del/${book.bookId}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="pagination pagination-lg">
                <li><a href="#">prev</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">next</a></li>
            </ul>
        </div>
    </div>
    <div class="row clearfix">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <h4>注意！</h4>
            <strong>Warning!</strong>
            Best check yo self, you're not looking too good.
            <a href="#" class="alert-link">alert link</a>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
    var row = 1;
    var countNum = 0;
    // post请求，查询一共有多少页数据
    $.post("<%=appPath%>/book/countNum", function (data) {
        countNum = data;
    })
    // 分页点击事件
    $('ul li').click(function () {
        var page = 1;
        var who = $(this).index();
        $('#warning').css('display', 'none');
        $('#warning-text').empty();
        if (who == 0) {
            if (now - 1 <= 1) {
                page = 1;
                now = page;
                $('#warning').css('display', 'block');
                $('#warning-text').append("前面没有了！");
            }
            if (now - 1 > 1) {
                page = now - 1;
                now = page;
            }
        }
        if (who > 0 && who < 6) {
            if (who > countNum) {
                page = countNum;
                now = page;
            } else {
                page = who;
                now = who;
            }
        }
        if (who == 6) {
            if (countNum >= now + 1) {
                page = now;
                $('#warning').css('display', 'block');
                $('#warning-text').append("后面没有了！");
            }
        }
        // 请求分页数据
        $.ajax({
            type: 'POST',
            url: '<%=appPath%>/book/listpage',
            data: {'start': (page - 1) * 10},
            dataType: 'json',
            success: function (data) {
                // 回调分页数据
                $('table tbody tr').remove();
                for (var i = 0; i < data.length; i++) {
                    $('table tbody').append(
                        '<tr>' +
                        '<td>' + data[i].bookId + '</td>' +
                        '<td>' + data[i].name + '</td>' +
                        '<td>' + data[i].number + '</td>' +
                        '<td><a href="<%=appPath%>/book/detail/' + data[i].bookId + '"'
                        + '>详情</a> | <a href="<%=appPath%>/book/del/' + data[i].bookId + '"' + '>删除</a></td>'
                        +
                        '</tr>'
                    );
                }
            },
            error: function (data) {
                alert("失败:" + data)
            }
        });
    });
</script>
</body>
</html>

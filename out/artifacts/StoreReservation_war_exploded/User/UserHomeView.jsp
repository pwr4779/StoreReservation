<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-24
  Time: ���� 7:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
         pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <!-- ����Ʈ -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- ��Ÿ�Ͻ�Ʈ ����  -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>������</title>
</head>
<body>
<!-- �׺���̼�  -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expaned="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="UserHomeView.jsp">������� ���� �ý���</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="UserHomeView.jsp">������</a></li>
                <li><a href="OrderView.jsp">�ֹ��ϱ�</a></li>
                <li><a href=".jsp">�����ϱ�</a></li>
            </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">�α׾ƿ�</a></li>
        </ul>
    </div>
</nav>

<!-- ������ -->
<div class="container">
    <div class="row">
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="3"
                    style="background-color: #eeeeee; text-align: center;">�� ���� </th>
            </tr>
            </thead>
            <%--<tbody>--%>
            <%--<tr>--%>
                <%--<td style="width: 20%;"> �����ȣ </td>--%>
                <%--<td colspan="2"><%=  %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>�����</td>--%>
                <%--<td colspan="2"><%=  %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>�ּ�</td>--%>
                <%--<td colspan="2"><%=  %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>��ȭ��ȣ</td>--%>
                <%--<td colspan="2"><%= %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>���̺���</td>--%>
                <%--<td colspan="2"><%=  %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>���½ð�</td>--%>
                <%--<td colspan="2"><%= %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>�����ð�</td>--%>
                <%--<td colspan="2"><%= %></td>--%>
            <%--</tr>--%>

            <%--</tbody>--%>
        </table>

    </div>
</div>

<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>
</body>
</html>
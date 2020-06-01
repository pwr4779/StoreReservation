<%@ page import="java.sql.Connection" %>
<%@ page import="DB.DBconnector" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.StoreDAO" %>
<%@ page import="DB.Store" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-24
  Time: ���� 1:54
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-24
  Time: ���� 7:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
         pageEncoding="euc-kr" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <!-- ����Ʈ -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- ��Ÿ�Ͻ�Ʈ ����  -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>������� ������Ʈ</title>
</head>
<body>

<%
    int StoreNo = 0;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = Integer.parseInt(request.getParameter("StoreNo"));
    }
    if (StoreNo == 0) {%>
        <script>
            alert( "��ȿ���� ���� �����Դϴ�!!")
            location.href='StoreManagementView.jsp'
        </script>
    <%}
    Store store = new StoreDAO().getStore(StoreNo);
%>

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
        <a class="navbar-brand" href="StoreManagementView.jsp">������� ���� �ý���</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="StoreManagementView.jsp">�������</a></li>
            <li><a href="bbs.jsp">�޴�����</a></li>
            <li><a href="bbs.jsp">ȸ������</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">�α׾ƿ�</a></li>
        </ul>
    </div>
</nav>
<!-- �������� -->
<div class="container">
    <div class="row">
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="3"
                    style="background-color: #eeeeee; text-align: center;">���� ���� </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="width: 20%;"> �����ȣ </td>
                <td colspan="2"><%= store.getStoreNo() %></td>
            </tr>
            <tr>
                <td>�����</td>
                <td colspan="2"><%= store.getStoreName()  %></td>
            </tr>
            <tr>
                <td>�ּ�</td>
                <td colspan="2"><%= store.getStoreAddr() %></td>
            </tr>
            <tr>
                <td>��ȭ��ȣ</td>
                <td colspan="2"><%=store.getStorePhone() %></td>
            </tr>
            <tr>
                <td>���̺���</td>
                <td colspan="2"><%= store.getStoreTable() %></td>
            </tr>
            <tr>
                <td>���½ð�</td>
                <td colspan="2"><%= store.getStoreOpen().substring(11, 13) + " : "+  store.getStoreOpen().substring(14, 16) %></td>
            </tr>
            <tr>
                <td>�����ð�</td>
                <td colspan="2"><%= store.getStoreClose().substring(11, 13) + " : "+  store.getStoreClose().substring(14, 16)%></td>
            </tr>

            </tbody>
        </table>
        <a href = "StoreManagementView.jsp" class="btn btn-primary">���</a>
        <a href="alterStoreInfo.jsp?StoreNo=<%= StoreNo %>" class="btn btn-primary">����</a>
        <a href="DeleteStoreInfoAction.jsp?StoreNo=<%= StoreNo %>" class="btn btn-primary">����</a>
    </div>
</div>


<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>
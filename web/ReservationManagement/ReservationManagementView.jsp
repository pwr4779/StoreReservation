<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.*" %><%--
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
    <title>�������</title>
</head>
<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    int pageNumber = 1; //�⺻ ������ �ѹ�
    //�������ѹ����� ������
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>

<!-- �׺���̼�  -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <a class="navbar-brand" href="../User/UserHomeView.jsp">������� �ֹ� & ���� �ý���</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="../StoreManagement/StoreManagementView.jsp">�������</a></li>
            <li><a href="../Menu/MenuManageView.jsp">�޴�����</a></li>
            <li><a href="../Payment/PaymentSelectStore.jsp">�ֹ���Ȳ �� ����ó��</a></li>
            <li><a href="../Payment/PaymentStateView.jsp">����ó����Ȳ</a></li>
            <li><a href="ReservationManagementView.jsp">�������</a></li>
            <li><a href="../UserManagement/UserManagementView.jsp">ȸ������</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">�α׾ƿ�</a></li>
        </ul>
    </div>
</nav>
<!-- ���弱�� -->
<div class="container">
    <div class="row">
        <h3 style="text-align: center;">������ȲȮ�� ������ �������ּ���.</h3>
        <small>ó���� �̿Ϸ�� ����</small>
        <small>NoShow ó�� �� �Ѵ� �� �̷� �� 3���̻� NoShow ������ ���� �� �Ѵ� ���� ���� ����</small>
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">�����ȣ</th>
                <th style="background-color: #eeeeee; text-align: center;">�ּ�</th>
                <th style="background-color: #eeeeee; text-align: center;">��ȭ��ȣ</th>
                <th style="background-color: #eeeeee; text-align: center;">���̺���</th>
                <th style="background-color: #eeeeee; text-align: center;">���½ð�</th>
                <th style="background-color: #eeeeee; text-align: center;">�����ð�</th>
                <th style="background-color: #eeeeee; text-align: center;">�����(����)</th>
            </tr>
            </thead>
            <tbody>
            <%
                StoreDAO storeDAO = new StoreDAO();
                Connection conn = DBconnector.getMySQLConnection();
                ArrayList<Store> list = storeDAO.getList(pageNumber, conn);
                for (int i = 0; i < list.size(); i++) {
            %>
            <tr>
                <td><%=list.get(i).getStoreNo()%></td>
                <td><%=list.get(i).getStoreAddr()%></td>
                <td><%=list.get(i).getStorePhone()%></td>
                <td><%=list.get(i).getStoreTable()%></td>
                <td><%=list.get(i).getStoreOpen().substring(11,13)+" : "+list.get(i).getStoreOpen().substring(14,16)%></td>
                <td><%=list.get(i).getStoreClose().substring(11,13)+" : "+list.get(i).getStoreClose().substring(14,16)%></td>
                <td><a href="ReservationListView.jsp?StoreNo=<%=list.get(i).getStoreNo()%>&StoreNo=<%=list.get(i).getStoreNo()%>"><%=list.get(i).getStoreName()%></a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table

                <!-- ������ �ѱ�� -->
            <%
            if (pageNumber != 1) {
        %>
        <a href="ReservationManagementView.jsp?pageNumber=<%=pageNumber - 1%>"
           class="btn btn-success btn-arrow-left">����</a>
        <%
            }
        %>
        <a href="ReservationManagementView.jsp?pageNumber=<%=pageNumber + 1%>"
           class="btn btn-success btn-arrow-left">����</a>
    </div>
</div>
<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>
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
    <title>����ó�� - ���� �����ϱ�</title>
</head>
<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    String StoreNo = null; //�����ȣ
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
        <a class="navbar-brand" href="../StoreManagement/StoreManagementView.jsp">������� �ֹ� & ���� �ý���</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="../StoreManagement/StoreManagementView.jsp">�������</a></li>
            <li><a href="../Menu/MenuManageView.jsp">�޴�����</a></li>
            <li><a href="./PaymentSelectStore.jsp">�ֹ���Ȳ �� ����ó��</a></li>
            <li><a href="./PaymentStateView.jsp">����ó����Ȳ</a></li>
            <li><a href="../ReservationManagement/ReservationManagementView.jsp">�������</a></li>
            <li><a href="../UserManagement/UserManagementView.jsp">ȸ������</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">�α׾ƿ�</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row">
        <h3 style="text-align: center;">�����Ϸ���Ȳ</h3>
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">�ֹ���ȣ</th>
                <th style="background-color: #eeeeee; text-align: center;">��������</th>
                <th style="background-color: #eeeeee; text-align: center;">��������</th>
                <th style="background-color: #eeeeee; text-align: center;">���������ݾ�</th>
                <th style="background-color: #eeeeee; text-align: center;">�Һ�</th>
                <th style="background-color: #eeeeee; text-align: center;">�������Ʈ</th>
            </tr>
            </thead>
            <tbody>
            <%
                Connection conn = DBconnector.getMySQLConnection();
                ArrayList<Payment> list = PayDAO.getFinishList();

                for (int i = 0; i < list.size(); i++) {
                    String salecode = list.get(i).getSaleCode();
                    if(salecode == null){
                        salecode = "����";
                    }else if(salecode.equals("10")){
                        salecode = "ī������";
                    }else{
                        salecode = "��Ż�����";
                    }
            %>
            <tr>
                <td><%=list.get(i).getOrderNo()%></td>
                <td><%=salecode%></td>
                <td><%=list.get(i).getSaleCoupon()%></td>
                <td><%=list.get(i).getFinalPayAmount()%></td>
                <td><%=list.get(i).getInstall_month()%></td>
                <td><%=list.get(i).getUsingPoint()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
</div>


<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>
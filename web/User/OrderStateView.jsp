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
    <title>�ֹ���ȲȮ��</title>
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
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expaned="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="../StoreManagement/StoreManagementView.jsp">������� ���� �ý���</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="UserHomeView.jsp">������</a></li>
            <li><a href="OrderView.jsp">�ֹ��ϱ�</a></li>
            <li><a href="OrderStateView.jsp">�ֹ���Ȳ</a></li>
            <li><a href=".jsp">�����ϱ�</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">�α׾ƿ�</a></li>
        </ul>
    </div>
</nav>
<!-- �ֹ���Ȳ -->
<%
    ArrayList<OrderState> list = OrderDAO.OrderState(userID);
%>
<div class="container">
    <div class="col-lg-3"></div>
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
                <h3 style="text-align: center;">�ֹ���Ȳ</h3>

                    <h4 style="text-align: center;">�����: <%=list.get(0).getStoreName()%></h4>


                    <h4 style="text-align: center;">���̺���ȣ: <%=list.get(0).getTableNo()%> </h4>


                    <h4 style="text-align: center;">�̿��ο���: <%=list.get(0).getNumOfUsers()%> </h4>


                    <h4 style="text-align: center;">�� ����: <%=list.get(0).getTOTAL_ORDER_AMOUNT()%> </h4>

                <table class="table table-striped"
                       style="text-align: center; border: 1px solid #dddddd">
                    <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">�޴��̸�</th>
                        <th style="background-color: #eeeeee; text-align: center;">����</th>
                        <th style="background-color: #eeeeee; text-align: center;">�޴�����</th>
                        <th style="background-color: #eeeeee; text-align: center;">�޴�����*����</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%

                        for (int i = 0; i < list.size(); i++) {
                    %>
                    <tr>
                        <td><%=list.get(i).getMenuName()%></td>
                        <td><%=list.get(i).getNumOfOrders()%></td>
                        <td><%=list.get(i).getAmount()%></td>
                        <td><%=list.get(i).getOrderAmount()%></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
        </div>
    </div>
</div>

<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>
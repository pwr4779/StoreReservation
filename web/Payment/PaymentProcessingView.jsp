<%@ page import="DB.OrderState" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.OrderDAO" %>
<%@ page import="DB.UserDAO" %>
<%@ page import="DB.UserDetail" %>
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
    <title>�ֹ���ȲȮ�� �� ����ó��</title>
</head>
<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    String OrderNo = null;
    if (request.getParameter("OrderNo") != null) {
        OrderNo = request.getParameter("OrderNo");
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
<!-- �ֹ���Ȳ -->
<%
    ArrayList<OrderState> list = OrderDAO.OrderStateDetail(OrderNo);
    UserDetail userDetail = UserDAO.GetUserDetail(list.get(0).getUserNo());
%>
<div class="container">
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
            <h3 style="text-align: center;">�ֹ�������</h3>
            <h4 style="text-align: center;">�����: <%=list.get(0).getStoreName()%></h4>
            <h4 style="text-align: center;">���̺���ȣ: <%=list.get(0).getTableNo()%> </h4>
            <h4 style="text-align: center;">�̿��ο���: <%=list.get(0).getNumOfUsers()%> </h4>
            <h4 style="text-align: center;">�� ����: <%=list.get(0).getTOTAL_ORDER_AMOUNT()%> </h4>
            <h3 style="text-align: center;">�ֹ��ڻ�����</h3>
            <h4 style="text-align: center;">��밡������Ʈ: <%=userDetail.getACPoint()%></h4>
            <h4 style="text-align: center;">������(10%): <%=userDetail.getCoupon10()%> </h4>
            <h4 style="text-align: center;">������(7%): <%=userDetail.getCoupon7()%> </h4>
            <h4 style="text-align: center;">������(3%): <%=userDetail.getCoupon3()%> </h4>
            <h3 style="text-align: center;">�ֹ���ǰ���</h3>
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
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="NormalPayAction.jsp?OrderNo=<%=OrderNo%>">

                    <h3 style="text-align: center;">�Ϲݰ���</h3>
                     <small>�ֹ������� 1000����Ʈ ����</small>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="�������(10,7,3 �� �Է�)" name="SaleCoupon" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="�������Ʈ" name="UsingPoint" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="�Һ�(�ִ� 6����)" name="InstallMonth" maxlength="20">
                    </div>
                    <input type="submit" class="btn btn-primary form-control" value="����">
                </form>
            <form method="post" action="CardSaleAction.jsp?OrderNo=<%=OrderNo%>">
                <h3 style="text-align: center;">�������ΰ���</h3>
                <small>�ֹ������� 1000����Ʈ ����</small>
                <small>��Ż����� 5% ���� ����</small>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*ī���" name="CardCom" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*ī���ȣ" name="CardNo" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="�������(10,7,3 �� �Է�)" name="SaleCoupon" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="�������Ʈ" name="UsingPoint" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="�Һ�(�ִ� 6����)" name="InstallMonth" maxlength="20">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="����ī�� �������� ����">
            </form>
            <form method="post" action="PhoneSaleAction.jsp?OrderNo=<%=OrderNo%>">
                <h3 style="text-align: center;">��Ż����� ����</h3>
                <small>�ֹ������� 1000����Ʈ ����</small>
                <small>��Ż����� 5% ���� ����</small>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*��Ż�" name="PhoneCom" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*��ȭ��ȣ" name="Phone" maxlengt="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="�������(10,7,3 �� �Է�)" name="SaleCoupon" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="�������Ʈ" name="UsingPoint" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="�Һ�(�ִ� 6����)" name="InstallMonth" maxlength="20">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="������Ż� �������� ����">
            </form>

        </div>
    </div>
</div>

<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>
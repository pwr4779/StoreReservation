<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.*" %>
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
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    String StoreNo = null; //�����ȣ
    //�������ѹ����� ������
    if (request.getParameter("StoreNo") != null) {
        StoreNo = request.getParameter("StoreNo");
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
<!-- �ֹ���Ȳ -->
<div class="container">
    <div class="row">
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">�����ȣ</th>
                <th style="background-color: #eeeeee; text-align: center;">ȸ����ȣ</th>
                <th style="background-color: #eeeeee; text-align: center;">���Թ�ȣ</th>
                <th style="background-color: #eeeeee; text-align: center;">�湮������</th>
                <th style="background-color: #eeeeee; text-align: center;">�湮�����ο�</th>
                <th style="background-color: #eeeeee; text-align: center;">���ó��</th>
                <th style="background-color: #eeeeee; text-align: center;">�湮Ȯ��ó��</th>
                <th style="background-color: #eeeeee; text-align: center;">NoShowó��</th>
            </tr>
            </thead>
            <tbody>
            <%
                StoreDAO storeDAO = new StoreDAO();
                Connection conn = DBconnector.getMySQLConnection();
                ArrayList<Reservation> list = ReservationDAO.getList(StoreNo);
                for (int i = 0; i < list.size(); i++) {
                    String No = list.get(i).getReservationNo();
            %>
            <form method="post">
                <tr>
                    <td><%=list.get(i).getReservationNo()%></td>
                    <td><%=list.get(i).getUserNo()%></td>
                    <td><%=list.get(i).getStoreNo()%></td>
                    <td><%=list.get(i).getVistDate()%></td>
                    <td><%=list.get(i).getNumOfUsers()%></td>
                    <td><input type="submit" class="btn btn-primary form-control" value="���" formaction="CancelReservationAction.jsp?ReservationNo=<%=No%>"></td>
                    <td><input type="submit" class="btn btn-primary form-control" value="�湮�Ϸ�" formaction="VisitFinishAction.jsp?ReservationNo=<%=No%>"></td>
                    <td><input type="submit" class="btn btn-primary form-control" value="NOSHOW" formaction="NoshowAction.jsp?ReservationNo=<%=No%>&UserNo=<%=list.get(i).getUserNo()%>"></td>
                </tr>
            </form>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>


<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>
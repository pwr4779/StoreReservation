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
    <title>�����ϱ�</title>
</head>
<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    String StoreNo = null;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = request.getParameter("StoreNo");
    }
%>

<!-- �׺���̼�  -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <a class="navbar-brand" href="../User/UserHomeView.jsp">������� �ֹ� & ���� �ý���</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="../User/UserHomeView.jsp">������</a></li>
            <li><a href="../User/OrderView.jsp">�ֹ��ϱ�</a></li>
            <li><a href="../User/OrderStateView.jsp">�ֹ���Ȳ</a></li>
            <li><a href="SelectStore.jsp">�����ϱ�</a></li>
            <li><a href="ReservationStateView.jsp">������Ȳ</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">�α׾ƿ�</a></li>
        </ul>
    </div>
</nav>
<!-- �����ϱ� -->
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="ReservationAction.jsp?StoreNo=<%=StoreNo%>">

                <h3 style="text-align: center;">�����ϱ�</h3>
                <div><small>���� �ð� 2�ð� ���� ��� ���� �� ���� �Ұ�</small></div>
                <div><small>���� �ð����� ���� 30�� ��� �� �����ڰ� No-Show ó��</small></div>
                <div><small>No-show 3ȸ �̻� �� �Ѵ� ���� �ý��� �̿�����</small></div>
                <div class="form-group">
                    <input type="date" class="form-control" placeholder="�湮������¥" name="Date" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="time" class="form-control" placeholder="�湮�����ð�" name="Time" maxlength="20" min="08:00:00" max="24:00:00">
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" placeholder="�湮�����ο���" name="numOfUser" maxlength="20">
                </div>
                <div class="form-group">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="����">
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
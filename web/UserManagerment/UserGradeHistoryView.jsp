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
    <title>������� ������Ʈ</title>
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
    String UserNo = null;
    if (request.getParameter("UserNo") != null) {
        UserNo = request.getParameter("UserNo");
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
            <li><a href="../StoreManagement/StoreManagementView.jsp">�������</a></li>
            <li><a href="../Menu/MenuManageView.jsp">�޴�����</a></li>
            <li><a href="../Payment/PaymentView.jsp">����ó��</a></li>
            <li><a href="UserManagementView.jsp">ȸ������</a></li>
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
                <th style="background-color: #eeeeee; text-align: center;">���̵�</th>
                <th style="background-color: #eeeeee; text-align: center;">�ο���¥</th>
                <th style="background-color: #eeeeee; text-align: center;">���</th>
                <th style="background-color: #eeeeee; text-align: center;">���ᳯ¥</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<GradeHistory>  getGradeHistoryList = UserDAO.GetGradeHistoryList(pageNumber, UserNo);
                for (int i = 0; i < getGradeHistoryList.size(); i++) {
            %>
            <tr>
                <td><%=getGradeHistoryList.get(i).getUserNo()%></td>
                <td><%=getGradeHistoryList.get(i).getGrantDate()%></td>
                <td><%=getGradeHistoryList.get(i).getGrade()%></td>
                <td><%=getGradeHistoryList.get(i).getExpireDate()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <!-- ������ �ѱ�� -->
        <%
            if (pageNumber != 1) {
        %>
        <a href="UserGradeHistoryView.jsp?pageNumber=<%=pageNumber - 1%>"
           class="btn btn-success btn-arrow-left">����</a>
        <%
            }
//            if (bbsDAO.nextPage(pageNumber)) {
        %>
        <a href="UserGradeHistoryView.jsp?pageNumber=<%=pageNumber + 1%>"
           class="btn btn-success btn-arrow-left">����</a>
        <%
            //            }
        %>

    </div>
</div>


<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>
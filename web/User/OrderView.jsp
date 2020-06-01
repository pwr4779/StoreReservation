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
    <title>�ֹ��ϱ�</title>
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
            <li><a href=".jsp">������</a></li>
            <li><a href="OrderView.jsp">�ֹ��ϱ�</a></li>
            <li><a href=".jsp">�����ϱ�</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">�α׾ƿ�</a></li>
        </ul>
    </div>
</nav>
<!-- ���弱�� -->
<div class="container">
    <div class="row">
        <h3 style="text-align: center;">������ �������ּ���.</h3>
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
                <td><a href="MenuChoiceView.jsp?StoreNo=<%=list.get(i).getStoreNo()%>&userID=<%=userID%>"><%=list.get(i).getStoreName()%></a></td>
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
        <a href="OrderView.jsp?pageNumber=<%=pageNumber - 1%>"
           class="btn btn-success btn-arrow-left">����</a>
        <%
            }
//            if (bbsDAO.nextPage(pageNumber)) {
        %>
        <a href="OrderView.jsp?pageNumber=<%=pageNumber + 1%>"
           class="btn btn-success btn-arrow-left">����</a>
        <%
            //            }
        %>

        <%
            //if logined userID��� ������ �ش� ���̵� ���� if not null
            if (session.getAttribute("userID") != null) {
        %>
        <a href="insertStoreInfo.jsp" class="btn btn-primary pull-right">�߰�</a>
        <%
        } else {
        %>
        <button class="btn btn-primary pull-right" onclick="if(confirm('�α��� �ϼ���'))location.href='loginView.jsp';" type="button">�߰�</button>
        <%
            }
        %>
    </div>
</div>


<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>
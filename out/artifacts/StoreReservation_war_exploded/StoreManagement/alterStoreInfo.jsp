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
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
        String StoreNostr = ""+request.getParameter("StoreNo");
        StoreNo = Integer.parseInt(StoreNostr);
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
    <div class="col-lg-7">
        <div class="row">
            <table class="table table-striped"
                   style="text-align: center; border: 1px solid #dddddd">
                <thead>
                <tr>
                    <th style="background-color: #eeeeee; text-align: center;">������</th>
                    <th style="background-color: #eeeeee; text-align: center;">�����ȣ</th>
                    <th style="background-color: #eeeeee; text-align: center;">�����ȣ</th>
                    <th style="background-color: #eeeeee; text-align: center;">�ּ�</th>
                    <th style="background-color: #eeeeee; text-align: center;">��ȭ��ȣ</th>
                    <th style="background-color: #eeeeee; text-align: center;">���̺���</th>
                    <th style="background-color: #eeeeee; text-align: center;">���½ð�</th>
                    <th style="background-color: #eeeeee; text-align: center;">�����ð�</th>
                    <th style="background-color: #eeeeee; text-align: center;">�����</th>
                    <th style="background-color: #eeeeee; text-align: center;">�ҷ�����</th>
                </tr>
                </thead>
                <tbody>
                <%
                    StoreDAO storeDAO = new StoreDAO();
                    Connection conn = DBconnector.getMySQLConnection();
                    ArrayList<Store> list = storeDAO.getBeforeInfoList(StoreNo);
                    if(list != null){
                    for (int i = 0; i < list.size(); i++) {
                    %>
                <form method="post" action="BackUpStoreInfo.jsp?StoreNo=<%=StoreNo%>&SelectNo=<%=i%>">
                <tr>
                    <td><%=list.get(i).getHistoryDate()%></td>
                    <td><%=list.get(i).getHistoryNo()%></td>
                    <td><%=list.get(i).getStoreNo()%></td>
                    <td><%=list.get(i).getStoreAddr()%></td>
                    <td><%=list.get(i).getStorePhone()%></td>
                    <td><%=list.get(i).getStoreTable()%></td>
                    <td><%=list.get(i).getStoreOpen().substring(11,13)+":"+list.get(i).getStoreOpen().substring(14,16)%></td>
                    <td><%=list.get(i).getStoreClose().substring(11,13)+":"+list.get(i).getStoreClose().substring(14,16)%></td>
                    <td><%=list.get(i).getStoreName()%></td>
                    <td><input type="submit" class="btn btn-primary form-control"  value="����"></td>
                </tr>
                </form>
                <%  }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" accept-charset="euc-kr" onsubmit="document.charset='euc=kr';"  action="alterStoreInfoAction.jsp?StoreNo=<%= StoreNo %>">
                <h3 style="text-align: center;">������������</h3>
                <div class="form-group" >
                    <input type="text" class="form-control" placeholder="�����" name="StoreName" maxlength="20"    >
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="�ּ�" name="StoreAddr" maxlength="20"  >
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="��ȭ��ȣ" name="StorePhone" maxlength="20" >
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="���̺���" name="StoreTable" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="���½ð�" name="StoreOpen" maxlength="20" >
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="�����ð�" name="StoreClose" maxlength="20">
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
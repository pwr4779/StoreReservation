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
    <title>�޴�����</title>
</head>
<body>

<%
    int StoreNo = 0;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = Integer.parseInt(request.getParameter("StoreNo"));
    }

    String userID = request.getParameter("userID");

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
            <li><a href="UserHomeView.jsp">������</a></li>
            <li><a href="OrderView.jsp">�ֹ��ϱ�</a></li>
            <li><a href=".jsp">�����ϱ�</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">�α׾ƿ�</a></li>
        </ul>
    </div>
</nav>
<!-- ���̺�����-->
<div class="container">
    <form method="post" action="OrderAction.jsp?StoreNo<%=StoreNo%>&userID=<%=userID%>">
    <div class="col-lg-2">
    <h2>���̺�����</h2>
        <select class="form-control" name="tableNum">
        <%
            int tablecount = StoreDAO.getTable(StoreNo);
            ArrayList<Order> orderlist = OrderDAO.getList(0);

            for (int k = 1; k <= tablecount; k++) {
                if(!orderlist.contains(k))
            %>
             <option><%=k%></option>
        <%

            }
        %>
        </select>
    </div>
        <div class="col-lg-2">
            <h2>�ο���</h2>
            <select class="form-control" name="UserCount">
                <%
                    for (int j = 1; j <= 20; j++) {
                %>
                <option><%=j%></option>
                <%
                    }
                %>
            </select>
        </div>
    <div class="col-lg-12"><h2></h2></div>
    <div class="row">
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">�޴���ȣ</th>
                <th style="background-color: #eeeeee; text-align: center;">�޴���</th>
                <th style="background-color: #eeeeee; text-align: center;">�ݾ�</th>
                <th style="background-color: #eeeeee; text-align: center;">�ֹ�����</th>
            </tr>
            </thead>
            <tbody>
            <%
                Connection conn = DBconnector.getMySQLConnection();
                ArrayList<Menu> list = MenuDAO.getList(0, conn);
                for (int i = 0; i < list.size(); i++) {
                    String MenuNo = list.get(i).getMenuNo();
            %>
            <tr>
                <td><div class="col-lg-12"><%=list.get(i).getMenuNo()%></div></td>
                <td><div class="col-lg-12"><%=list.get(i).getMenuName()%></div></td>
                <td><div class="col-lg-12" ><%=list.get(i).getAmount()%></div></td>
                <td><div class="col-lg-12"><input type="text" class="form-control" placeholder="����" name="count<%=i%>" maxlength="20" value="<%=0%>"></div></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
        <input type="submit" class="btn btn-primary form-control" value="�ֹ��ϱ�">
    </form>
</div>


<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>

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
    <title>������� ������Ʈ </title>
</head>
<body>
<%
    int StoreNo = 0;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = Integer.parseInt(request.getParameter("StoreNo"));
    }
    if (StoreNo == 0) {
%>
<script>
    alert("��ȿ�� ���������� �ƴմϴ�!!")
    location.href = 'StoreManagementView.jsp'
</script>
<%
    }
    Store store = new StoreDAO().getStore(StoreNo);

    if (request.getParameter("StoreName") == null || request.getParameter("StoreAddr") == null
            || request.getParameter("StorePhone")==null || request.getParameter("StoreTable")==null|| request.getParameter("StoreOpen")==null || request.getParameter("StoreClose")==null) {
%>
<script>
    alert("�����׸��� �Է����ּ���.")
    location.href = 'alterStoreInfo.jsp?StoreNo=<%=StoreNo%>'
</script>
<%
} else {
        String StoreName = new String(request.getParameter("StoreName").getBytes("8859_1"), "EUC-KR");
        String StoreAddr = new String(request.getParameter("StoreAddr").getBytes("8859_1"), "EUC-KR");
        String StorePhone = new String(request.getParameter("StorePhone").getBytes("8859_1"), "EUC-KR");
    String StoreOpen = new String(request.getParameter("StoreOpen").getBytes("8859_1"), "EUC-KR");
    String StoreClose = new String(request.getParameter("StoreClose").getBytes("8859_1"), "EUC-KR");
        StoreDAO.insertBeforeInfo(store);
        int result = StoreDAO.update(Integer.toString(StoreNo),StoreName,StoreAddr, StorePhone, Integer.parseInt(request.getParameter("StoreTable")), StoreOpen, StoreClose);
        if (result == -1) {
%>
<script>
    alert("���� ����")
    location.href = 'alterStoreInfo.jsp?StoreNo=<%=StoreNo%>'
</script>
<%
} else {
%>
<script>
    alert("���� �Ϸ�!!")
    location.href = 'alterStoreInfo.jsp?StoreNo=<%=StoreNo%>'
</script>
<%

        }
    }

%>
</body>

</html>

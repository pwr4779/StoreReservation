<%@ page import="DB.StoreDAO" %>
<%@ page import="DB.OrderDAO" %><%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-30
  Time: ���� 12:51
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
    <title>�ֹ����</title>
</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    int result = OrderDAO.deleteOrder(userID);
    if(result == -1){
%>
<script>
    alert("�ֹ� ��� ����!!")
    location.href = 'UserHomeView.jsp'
</script>
<%
    }else{
        %>
<script>
    alert("�ֹ� ��� ����!!")
    location.href = 'UserHomeView.jsp'
</script>
<%
    }

   %>
</body>
</html>
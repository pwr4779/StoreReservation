<%@ page import="DB.StoreDAO" %>
<%@ page import="DB.MenuDAO" %><%--
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
    <title>�޴���������</title>
</head>
<body>
<%
    int MenuNo = 0;
    if (request.getParameter("MenuNo") != null) {
        MenuNo = Integer.parseInt(request.getParameter("MenuNo"));
    }
    if (MenuNo == 0) {%>
<script>
    alert( "�޴� ���� ����!!")
    location.href='MenuManageView.jsp'
</script>
<%}else{
    int result = MenuDAO.deleteMenu(MenuNo);
    if(result == -1){
%>
<script>
    alert( "�޴� ���� ����!!")
    location.href = 'MenuManageView.jsp'
</script>
<%
}else{
%>
<script>
    alert( "�޴� ���� �Ϸ�!!")
    location.href = 'MenuManageView.jsp'
</script>
<%
        }
    }
%>
</body>
</html>
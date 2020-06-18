<%@ page import="DB.StoreDAO" %>
<%@ page import="DB.OrderDAO" %><%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-30
  Time: 오전 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
         pageEncoding="euc-kr" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <!-- 뷰포트 -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- 스타일시트 참조  -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>주문취소</title>
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
    alert("주문 취소 실패!!")
    location.href = 'UserHomeView.jsp'
</script>
<%
    }else{
        %>
<script>
    alert("주문 취소 성공!!")
    location.href = 'UserHomeView.jsp'
</script>
<%
    }

   %>
</body>
</html>

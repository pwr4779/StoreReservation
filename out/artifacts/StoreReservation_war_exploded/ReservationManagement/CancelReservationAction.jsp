<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-06-18
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.

--%>
<%@ page  language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%@ page import="DB.DBconnector" %>
<%@ page import="DB.User" %>
<%@ page import="DB.UserDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DB.ReservationDAO" %>


<html>
<head>
    <title>예약처리</title>
</head>
<body>
<%

    String ReservationNo = null;
    if (request.getParameter("ReservationNo") != null) {
        ReservationNo = request.getParameter("ReservationNo");
    }

    Connection conn = DBconnector.getMySQLConnection();
    int result = ReservationDAO.cancelReservation(ReservationNo);
    if(result != -1){
%>
<script>
    alert( "취소 완료!!")
    location.href = 'ReservationManagementView.jsp'
</script>
<%
    }else{
%>
<script>
    alert( "취소 실패!!")
    location.href = 'ReservationManagementView.jsp'
</script>
<%
    }

%>

</body>
</html>

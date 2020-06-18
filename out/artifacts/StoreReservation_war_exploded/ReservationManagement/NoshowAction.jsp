<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-06-18
  Time: 坷饶 4:27
  To change this template use File | Settings | File Templates.

--%>
<%@ page  language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%@ page import="DB.DBconnector" %>
<%@ page import="DB.ReservationDAO" %>


<html>
<head>
    <title>NOSHOW贸府</title>
</head>
<body>
<%
    String UserNo = null;
    if (request.getParameter("UserNo") != null) {
        UserNo = request.getParameter("UserNo");
    }

    String ReservationNo = null;
    if (request.getParameter("ReservationNo") != null) {
        ReservationNo = request.getParameter("ReservationNo");
    }

    Connection conn = DBconnector.getMySQLConnection();
    int result_1 = ReservationDAO.NoShow(ReservationNo);
    int count = ReservationDAO.NoShowCount(UserNo);
    int result_2 = -1;
    if(count >= 3) {
        result_2 = ReservationDAO.PenaltySactionDate(UserNo);
    }
    if(result_1 != -1 && result_2 != -1){
%>
<script>
    alert( "NoShow 贸府 肯丰!!")
    location.href = 'ReservationManagementView.jsp'
</script>
<%
}else{
%>
<script>
    alert( "NoShow 贸府 角菩!!")
    location.href = 'ReservationManagementView.jsp'
</script>
<%
    }

%>

</body>
</html>
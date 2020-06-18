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
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    String ReservationNo = null;
    if (request.getParameter("ReservationNo") != null) {
        ReservationNo = request.getParameter("ReservationNo");
    }

    Connection conn = DBconnector.getMySQLConnection();
    double limit = ReservationDAO.timelimit(userID); //방문예정시간까지 남은 시간
    if(limit > 2){
    int result = ReservationDAO.cancelReservation(ReservationNo);
    if(result != -1){
%>
<script>
    alert( "예약취소 성공!!")
    location.href = '../User/UserHomeView.jsp'
</script>
<%
}else{
%>
<script>
    alert( "예약취소 실패!!")
    location.href = '../User/UserHomeView.jsp'
</script>
<%
    }
    }else{
%>
<script>
    alert( "예약취소 기간이 아닙니다!!")
    location.href = '../User/UserHomeView.jsp'
</script>
<%
    }
%>

</body>
</html>

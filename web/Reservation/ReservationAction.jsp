<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-06-18
  Time: ���� 4:27
  To change this template use File | Settings | File Templates.

--%>
<%@ page  language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%@ page import="DB.DBconnector" %>
<%@ page import="DB.User" %>
<%@ page import="DB.UserDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DB.ReservationDAO" %>
<%@ page import="java.util.Date" %>


<html>
<head>
    <title>����ó��</title>
</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    String StoreNo = null;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = request.getParameter("StoreNo");
    }
    if(ReservationDAO.getReservationState(userID)==null) {
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String current = format.format(System.currentTimeMillis());
        String reservationNo = StoreNo + userID + current;
        String date = DBconnector.NullCheck(request.getParameter("Date"));
        String time = DBconnector.NullCheck(request.getParameter("Time"));
        String numOfUser = DBconnector.NullCheck(request.getParameter("numOfUser"));
        String penalitydate = date + time;
        User user = UserDAO.getUserInfo(userID);
        Connection conn = DBconnector.getMySQLConnection();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-ddHH:mm");
        Date date1 = dateformat.parse(penalitydate);
        long  Sanctiondate_check = date1.getTime() - System.currentTimeMillis();
    if (Sanctiondate_check > 0){
%>
<script>
    alert( "���� ����� ���Ұ��մϴ�!!")
    location.href = '../User/UserHomeView.jsp'
</script>
<%
    }else{
    int result = ReservationDAO.InsertReservation(reservationNo,userID, StoreNo, penalitydate, numOfUser);
    if(result != -1){
%>
<script>
    alert( "���� ����!!")
    location.href = 'ReservationStateView.jsp'
</script>
<%
    }else{
%>
<script>
    alert( "���� ����!!")
    location.href = 'SelectStore.jsp'
</script>
<%
    }
    }

    }else{
%>
<script>
    alert( "�̹� ���� �Ǿ� �ֽ��ϴ�!!")
    location.href = 'SelectStore.jsp'
</script>
<%
    }

    %>

</body>
</html>
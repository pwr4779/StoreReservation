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

    String ReservationNo = null;
    if (request.getParameter("ReservationNo") != null) {
        ReservationNo = request.getParameter("ReservationNo");
    }

    Connection conn = DBconnector.getMySQLConnection();
    double limit = ReservationDAO.timelimit(userID); //�湮�����ð����� ���� �ð�
    if(limit > 2){
    int result = ReservationDAO.cancelReservation(ReservationNo);
    if(result != -1){
%>
<script>
    alert( "������� ����!!")
    location.href = '../User/UserHomeView.jsp'
</script>
<%
}else{
%>
<script>
    alert( "������� ����!!")
    location.href = '../User/UserHomeView.jsp'
</script>
<%
    }
    }else{
%>
<script>
    alert( "������� �Ⱓ�� �ƴմϴ�!!")
    location.href = '../User/UserHomeView.jsp'
</script>
<%
    }
%>

</body>
</html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.*" %><%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-24
  Time: 오전 1:54
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-24
  Time: 오후 7:15
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
    <title>예약현황확인</title>
</head>
<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
%>

<!-- 네비게이션  -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expaned="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="../User/UserHomeView.jsp">레스토랑 주문 & 예약 시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="../User/UserHomeView.jsp">내정보</a></li>
            <li><a href="../User/OrderView.jsp">주문하기</a></li>
            <li><a href="../User/OrderStateView.jsp">주문현황</a></li>
            <li><a href="SelectStore.jsp">예약하기</a></li>
            <li><a href="ReservationStateView.jsp">예약현황</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>
<!-- 예약현황 -->
<%
    Reservation reservationState = ReservationDAO.getReservationState(userID);
    if(reservationState==null){
%>
<script>
    alert("예약 현황이 없습니다!!")
    location.href = '../User/UserHomeView.jsp'
</script>

<%
}else{
%>
<div class="container">
    <div class="col-lg-3"></div>
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
            <h3 style="text-align: center;">예약현황</h3>

            <h4 style="text-align: center;">예약번호: <%=  reservationState.getReservationNo() %></h4>

            <h4 style="text-align: center;">고객번호: <%= reservationState.getUserNo()  %></h4>

            <h4 style="text-align: center;">가게번호:  <%=  reservationState.getStoreNo() %></h4>

            <h4 style="text-align: center;">방문예정일:  <%= reservationState.getVistDate()  %></h4>

            <h4 style="text-align: center;">방문예정인원:  <%= reservationState.getNumOfUsers()  %></h4>

            <h4 style="text-align: center;">취소여부:  <%=  reservationState.getCancelcheck() %></h4>

            <h4 style="text-align: center;">방문여부:  <%= reservationState.getVisitcheck()  %></h4>

            <a href="DeleteReservationAction.jsp?ReservationNo=<%=  reservationState.getReservationNo() %>" class="btn btn-primary form-control" >예약취소</a>
        </div>
    </div>
</div>

<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>
<%
    }
%>
</body>
</html>

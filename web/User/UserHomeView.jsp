<%@ page import="DB.UserDAO" %>
<%@ page import="DB.UserDetail" %>
<%@ page import="DB.User" %><%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-24
  Time: 오후 7:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
         pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <!-- 뷰포트 -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- 스타일시트 참조  -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>내정보</title>
</head>
<body>
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
        <a class="navbar-brand" href="UserHomeView.jsp">레스토랑 예약 시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="UserHomeView.jsp">내정보</a></li>
                <li><a href="OrderView.jsp">주문하기</a></li>
                <li><a href="OrderStateView.jsp">주문현황</a></li>
                <li><a href="../Reservation/SelectStore.jsp">예약하기</a></li>
                <li><a href="../Reservation/ReservationStateView.jsp">예약현황</a></li>
            </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    UserDetail userdetail = UserDAO.GetUserDetail(userID);
    User userinfo = UserDAO.getUserInfo(userID);
    String s_date = userinfo.getSanctionsDate();
    if(s_date==null){
        s_date = "";
    }
%>
<!-- 내정보 -->
<div class="container">
    <div class="col-lg-3"></div>
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
            <h3 style="text-align: center;">내정보</h3>

            <h4 style="text-align: center;">고객번호: <%=userdetail.getUserNo()%></h4>
            <h4 style="text-align: center;">현재포인트: <%=userdetail.getACPoint()%> </h4>
            <h4 style="text-align: center;">총누적포인트: <%=userdetail.getYearACPoint()%> </h4>
            <h4 style="text-align: center;">3%할인쿠폰수: <%=userdetail.getCoupon3()%> </h4>
            <h4 style="text-align: center;">7%할인쿠폰수: <%=userdetail.getCoupon7()%> </h4>
            <h4 style="text-align: center;">10%할인쿠폰수: <%=userdetail.getCoupon10()%> </h4>
            <h4 style="text-align: center;">등급: <%=userdetail.getGrade()%> </h4>
            <h4 style="text-align: center;">주문수: <%=userdetail.getNumOfOrders()%> </h4>
            <h4 style="text-align: center;">예약제재기간: ~ <%=s_date%></h4>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>
</body>
</html>

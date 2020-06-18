<%@ page import="DB.OrderState" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.OrderDAO" %>
<%@ page import="DB.UserDAO" %>
<%@ page import="DB.UserDetail" %>
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
    <title>예약하기</title>
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
%>

<!-- 네비게이션  -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
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
<!-- 예약하기 -->
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="ReservationAction.jsp?StoreNo=<%=StoreNo%>">

                <h3 style="text-align: center;">예약하기</h3>
                <div><small>예약 시간 2시간 전에 취소 가능 그 이후 불가</small></div>
                <div><small>예약 시간으로 부터 30분 경과 시 관리자가 No-Show 처리</small></div>
                <div><small>No-show 3회 이상 시 한달 예약 시스템 이용제한</small></div>
                <div class="form-group">
                    <input type="date" class="form-control" placeholder="방문예정날짜" name="Date" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="time" class="form-control" placeholder="방문예정시간" name="Time" maxlength="20" min="08:00:00" max="24:00:00">
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" placeholder="방문예정인원수" name="numOfUser" maxlength="20">
                </div>
                <div class="form-group">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="예약">
            </form>
        </div>
    </div>
</div>

<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>

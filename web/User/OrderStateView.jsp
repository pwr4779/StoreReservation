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
    <title>주문현황확인</title>
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
        <a class="navbar-brand" href="UserHomeView.jsp">레스토랑 주문 & 예약 시스템</a>
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
<!-- 주문현황 -->
<%
    ArrayList<OrderState> list = OrderDAO.OrderState(userID);
    if(list.size()==0){
%>
<script>
    alert("주문된 현황이 없습니다!!")
    location.href = 'UserHomeView.jsp'
</script>

<%
    }else{
%>
<div class="container">
    <div class="col-lg-3"></div>
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
                <h3 style="text-align: center;">주문현황</h3>

                    <h4 style="text-align: center;">매장명: <%=list.get(0).getStoreName()%></h4>


                    <h4 style="text-align: center;">테이블번호: <%=list.get(0).getTableNo()%> </h4>


                    <h4 style="text-align: center;">이용인원수: <%=list.get(0).getNumOfUsers()%> </h4>


                    <h4 style="text-align: center;">총 가격: <%=list.get(0).getTOTAL_ORDER_AMOUNT()%> </h4>

                <table class="table table-striped"
                       style="text-align: center; border: 1px solid #dddddd">
                    <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">메뉴이름</th>
                        <th style="background-color: #eeeeee; text-align: center;">수량</th>
                        <th style="background-color: #eeeeee; text-align: center;">메뉴가격</th>
                        <th style="background-color: #eeeeee; text-align: center;">메뉴가격*수량</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (int i = 0; i < list.size(); i++) {
                    %>
                    <tr>
                        <td><%=list.get(i).getMenuName()%></td>
                        <td><%=list.get(i).getNumOfOrders()%></td>
                        <td><%=list.get(i).getAmount()%></td>
                        <td><%=list.get(i).getOrderAmount()%></td>
                    </tr>
                    <%
                        }
    }
                    %>
                    </tbody>
                </table>
                <a href="DeleteOrderAction.jsp" class="btn btn-primary form-control" >주문취소</a>
        </div>
    </div>
</div>

<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>

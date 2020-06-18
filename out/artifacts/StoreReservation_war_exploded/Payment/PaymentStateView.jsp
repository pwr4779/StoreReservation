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
    <title>결제처리 - 가게 선택하기</title>
</head>
<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    String StoreNo = null; //매장번호
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
        <a class="navbar-brand" href="../StoreManagement/StoreManagementView.jsp">레스토랑 주문 & 예약 시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="../StoreManagement/StoreManagementView.jsp">매장관리</a></li>
            <li><a href="../Menu/MenuManageView.jsp">메뉴관리</a></li>
            <li><a href="./PaymentSelectStore.jsp">주문현황 및 결제처리</a></li>
            <li><a href="./PaymentStateView.jsp">결제처리현황</a></li>
            <li><a href="../ReservationManagement/ReservationManagementView.jsp">예약관리</a></li>
            <li><a href="../UserManagement/UserManagementView.jsp">회원관리</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row">
        <h3 style="text-align: center;">결제완료현황</h3>
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">주문번호</th>
                <th style="background-color: #eeeeee; text-align: center;">제휴할인</th>
                <th style="background-color: #eeeeee; text-align: center;">할인쿠폰</th>
                <th style="background-color: #eeeeee; text-align: center;">최종결제금액</th>
                <th style="background-color: #eeeeee; text-align: center;">할부</th>
                <th style="background-color: #eeeeee; text-align: center;">사용포인트</th>
            </tr>
            </thead>
            <tbody>
            <%
                Connection conn = DBconnector.getMySQLConnection();
                ArrayList<Payment> list = PayDAO.getFinishList();

                for (int i = 0; i < list.size(); i++) {
                    String salecode = list.get(i).getSaleCode();
                    if(salecode == null){
                        salecode = "없음";
                    }else if(salecode.equals("10")){
                        salecode = "카드할인";
                    }else{
                        salecode = "통신사할인";
                    }
            %>
            <tr>
                <td><%=list.get(i).getOrderNo()%></td>
                <td><%=salecode%></td>
                <td><%=list.get(i).getSaleCoupon()%></td>
                <td><%=list.get(i).getFinalPayAmount()%></td>
                <td><%=list.get(i).getInstall_month()%></td>
                <td><%=list.get(i).getUsingPoint()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
</div>


<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>

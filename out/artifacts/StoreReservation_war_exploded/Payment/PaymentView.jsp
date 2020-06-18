<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.*" %>
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
    <title>레스토랑 웹사이트</title>
</head>
<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    String StoreNo = null; //매장번호
    //페이지넘버값이 있을때
    if (request.getParameter("StoreNo") != null) {
        StoreNo = request.getParameter("StoreNo");
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
<!-- 주문현황 -->
<div class="container">
    <div class="row">
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">매장번호</th>
                <th style="background-color: #eeeeee; text-align: center;">주문번호</th>
                <th style="background-color: #eeeeee; text-align: center;">회원번호</th>
                <th style="background-color: #eeeeee; text-align: center;">테이블번호</th>
                <th style="background-color: #eeeeee; text-align: center;">이용자수</th>
                <th style="background-color: #eeeeee; text-align: center;">총가격</th>
                <th style="background-color: #eeeeee; text-align: center;">결제처리</th>
            </tr>
            </thead>
            <tbody>
            <%
                StoreDAO storeDAO = new StoreDAO();
                Connection conn = DBconnector.getMySQLConnection();
                ArrayList<Order> list = OrderDAO.getList(Integer.parseInt(StoreNo));
                for (int i = 0; i < list.size(); i++) {
                    String orderNo = list.get(i).getOrderNo();
            %>
            <form method="post" action="PaymentProcessingView.jsp?OrderNo=<%=orderNo%>">
            <tr>
                <td><%=list.get(i).getStoreNo()%></td>
                <td><%=list.get(i).getOrderNo()%></td>
                <td><%=list.get(i).getUserNo()%></td>
                <td><%=list.get(i).getTableNo()%></td>
                <td><%=list.get(i).getNumOfUsers()%></td>
                <td><%=list.get(i).getTotalAmount()%></td>
                <td><input type="submit" class="btn btn-primary form-control" value="결제하기"></td>
            </tr>
            </form>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>


<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>

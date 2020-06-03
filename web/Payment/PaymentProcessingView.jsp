<%@ page import="DB.OrderState" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.OrderDAO" %>
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
    String OrderNo = null;
    if (request.getParameter("OrderNo") != null) {
        OrderNo = request.getParameter("OrderNo");
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
        <a class="navbar-brand" href="../StoreManagement/StoreManagementView.jsp">레스토랑 예약 시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="../StoreManagement/StoreManagementView.jsp">매장관리</a></li>
            <li><a href="../Menu/MenuManageView.jsp">메뉴관리</a></li>
            <li><a href="../PaymentView.jsp">결제처리</a></li>
            <li><a href="../UserManagerment/UserManagementView.jsp">회원관리</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>
<!-- 주문현황 -->
<%
    ArrayList<OrderState> list = OrderDAO.OrderStateDetail(OrderNo);
%>
<div class="container">
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
            <h3 style="text-align: center;">주문상세정보</h3>
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
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="signUpAction.jsp">

                    <h3 style="text-align: center;">일반결제</h3>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="쿠폰사용(10,7,3 중 입력)" name="userName" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="사용포인트" name="UsingPoint" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="할부(최대 6개월)" name="userPassword" maxlength="20">
                    </div>
                    <input type="submit" class="btn btn-primary form-control" value="결제">
                </form>
            <form method="post" action="signUpAction.jsp">
                <h3 style="text-align: center;">제휴할인결제</h3>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="카드사" name="userName" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="" name="카드번호" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="쿠폰사용(10,7,3 중 입력)" name="userName" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="사용포인트" name="UsingPoint" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="할부(최대 6개월)" name="userPassword" maxlength="20">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="제휴카드 할인적용 결제">
            </form>
            <form method="post" action="signUpAction.jsp">
                <h3 style="text-align: center;">통신사할인 결제</h3>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="통신사" name="userName" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="" name="전화번호호" maxlengt="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="쿠폰사용(10,7,3 중 입력)" name="userName" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="사용포인트" name="UsingPoint" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="할부(최대 6개월)" name="userPassword" maxlength="20">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="제휴카드 할인적용 결제">
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

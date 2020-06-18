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
    <title>예약관리</title>
</head>
<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    int pageNumber = 1; //기본 페이지 넘버
    //페이지넘버값이 있을때
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>

<!-- 네비게이션  -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <a class="navbar-brand" href="../User/UserHomeView.jsp">레스토랑 주문 & 예약 시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="../StoreManagement/StoreManagementView.jsp">매장관리</a></li>
            <li><a href="../Menu/MenuManageView.jsp">메뉴관리</a></li>
            <li><a href="../Payment/PaymentSelectStore.jsp">주문현황 및 결제처리</a></li>
            <li><a href="../Payment/PaymentStateView.jsp">결제처리현황</a></li>
            <li><a href="ReservationManagementView.jsp">예약관리</a></li>
            <li><a href="../UserManagement/UserManagementView.jsp">회원관리</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>
<!-- 매장선택 -->
<div class="container">
    <div class="row">
        <h3 style="text-align: center;">예약현황확인 매장을 선택해주세요.</h3>
        <small>처리가 미완료된 내역</small>
        <small>NoShow 처리 후 한달 전 이력 중 3번이상 NoShow 내역이 있을 시 한달 예약 제재 적용</small>
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">매장번호</th>
                <th style="background-color: #eeeeee; text-align: center;">주소</th>
                <th style="background-color: #eeeeee; text-align: center;">전화번호</th>
                <th style="background-color: #eeeeee; text-align: center;">테이블수</th>
                <th style="background-color: #eeeeee; text-align: center;">오픈시간</th>
                <th style="background-color: #eeeeee; text-align: center;">마감시간</th>
                <th style="background-color: #eeeeee; text-align: center;">매장명(선택)</th>
            </tr>
            </thead>
            <tbody>
            <%
                StoreDAO storeDAO = new StoreDAO();
                Connection conn = DBconnector.getMySQLConnection();
                ArrayList<Store> list = storeDAO.getList(pageNumber, conn);
                for (int i = 0; i < list.size(); i++) {
            %>
            <tr>
                <td><%=list.get(i).getStoreNo()%></td>
                <td><%=list.get(i).getStoreAddr()%></td>
                <td><%=list.get(i).getStorePhone()%></td>
                <td><%=list.get(i).getStoreTable()%></td>
                <td><%=list.get(i).getStoreOpen().substring(11,13)+" : "+list.get(i).getStoreOpen().substring(14,16)%></td>
                <td><%=list.get(i).getStoreClose().substring(11,13)+" : "+list.get(i).getStoreClose().substring(14,16)%></td>
                <td><a href="ReservationListView.jsp?StoreNo=<%=list.get(i).getStoreNo()%>&StoreNo=<%=list.get(i).getStoreNo()%>"><%=list.get(i).getStoreName()%></a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table

                <!-- 페이지 넘기기 -->
            <%
            if (pageNumber != 1) {
        %>
        <a href="ReservationManagementView.jsp?pageNumber=<%=pageNumber - 1%>"
           class="btn btn-success btn-arrow-left">이전</a>
        <%
            }
        %>
        <a href="ReservationManagementView.jsp?pageNumber=<%=pageNumber + 1%>"
           class="btn btn-success btn-arrow-left">다음</a>
    </div>
</div>
<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>

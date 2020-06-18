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
    <title>주문하기</title>
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
<!-- 매장선택 -->
<div class="container">
    <div class="row">
        <h3 style="text-align: center;">주문할 매장을 선택해주세요.</h3>
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
                <td><a href="MenuChoiceView.jsp?StoreNo=<%=list.get(i).getStoreNo()%>&userID=<%=userID%>"><%=list.get(i).getStoreName()%></a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <!-- 페이지 넘기기 -->
        <%
            if (pageNumber != 1) {
        %>
        <a href="OrderView.jsp?pageNumber=<%=pageNumber - 1%>"
           class="btn btn-success btn-arrow-left">이전</a>
        <%
            }
        %>
        <a href="OrderView.jsp?pageNumber=<%=pageNumber + 1%>"
           class="btn btn-success btn-arrow-left">다음</a>

    </div>
</div>


<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>
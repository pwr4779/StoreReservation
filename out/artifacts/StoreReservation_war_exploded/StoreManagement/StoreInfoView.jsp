<%@ page import="java.sql.Connection" %>
<%@ page import="DB.DBconnector" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.StoreDAO" %>
<%@ page import="DB.Store" %>
<%@ page import="java.util.ArrayList" %><%--
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
    <title>레스토랑 웹사이트</title>
</head>
<body>

<%
    int StoreNo = 0;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = Integer.parseInt(request.getParameter("StoreNo"));
    }
    if (StoreNo == 0) {%>
        <script>
            alert( "유효하지 않은 매장입니다!!")
            location.href='StoreManagementView.jsp'
        </script>
    <%}
    Store store = new StoreDAO().getStore(StoreNo);
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
        <a class="navbar-brand" href="StoreManagementView.jsp">레스토랑 예약 시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="StoreManagementView.jsp">매장관리</a></li>
            <li><a href="bbs.jsp">메뉴관리</a></li>
            <li><a href="bbs.jsp">회원관리</a></li>
        </ul>
    </div>
</nav>
<!-- 매장정보 -->
<div class="container">
    <div class="row">
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="3"
                    style="background-color: #eeeeee; text-align: center;">글 보기 </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="width: 20%;"> 매장번호 </td>
                <td colspan="2"><%= store.getStoreNo() %></td>
            </tr>
            <tr>
                <td>매장명</td>
                <td colspan="2"><%= store.getStoreName()  %></td>
            </tr>
            <tr>
                <td>주소</td>
                <td colspan="2"><%= store.getStoreAddr() %></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td colspan="2"><%=store.getStorePhone() %></td>
            </tr>
            <tr>
                <td>테이블수</td>
                <td colspan="2"><%= store.getStoreTable() %></td>
            </tr>
            <tr>
                <td>오픈시간</td>
                <td colspan="2"><%= store.getStoreOpen().substring(0, 2) + " : "+  store.getStoreOpen().substring(2, 4) %></td>
            </tr>
            <tr>
                <td>마감시간</td>
                <td colspan="2"><%= store.getStoreClose().substring(0, 2) + " : "+  store.getStoreClose().substring(2, 4)%></td>
            </tr>

            </tbody>
        </table>
        <a href = "StoreManagementView.jsp" class="btn btn-primary">목록</a>
        <a href="alterStoreInfo.jsp?StoreNo=<%= StoreNo %>" class="btn btn-primary">수정</a>
        <a href="Delete.jsp?StoreNo=<%= StoreNo %>" class="btn btn-primary">삭제</a>
    </div>
</div>


<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>

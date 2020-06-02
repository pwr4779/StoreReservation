<%--
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
                <li><a href=".jsp">예약하기</a></li>
            </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>

<!-- 내정보 -->
<div class="container">
    <div class="row">
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="3"
                    style="background-color: #eeeeee; text-align: center;">내 정보 </th>
            </tr>
            </thead>
            <%--<tbody>--%>
            <%--<tr>--%>
                <%--<td style="width: 20%;"> 매장번호 </td>--%>
                <%--<td colspan="2"><%=  %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>매장명</td>--%>
                <%--<td colspan="2"><%=  %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>주소</td>--%>
                <%--<td colspan="2"><%=  %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>전화번호</td>--%>
                <%--<td colspan="2"><%= %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>테이블수</td>--%>
                <%--<td colspan="2"><%=  %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>오픈시간</td>--%>
                <%--<td colspan="2"><%= %></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>마감시간</td>--%>
                <%--<td colspan="2"><%= %></td>--%>
            <%--</tr>--%>

            <%--</tbody>--%>
        </table>

    </div>
</div>

<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>
</body>
</html>

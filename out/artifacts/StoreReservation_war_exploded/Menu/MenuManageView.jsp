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
    <title>메뉴관리</title>
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
        <a class="navbar-brand" href="../StoreManagement/StoreManagementView.jsp">레스토랑 예약 시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="../StoreManagement/StoreManagementView.jsp">매장관리</a></li>
            <li><a href="MenuManageView.jsp">메뉴관리</a></li>
            <li><a href=".jsp">회원관리</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>
<!-- 메뉴정보 -->
<div class="container">

    <div class="row">
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">메뉴번호</th>
                <th style="background-color: #eeeeee; text-align: center;">메뉴명</th>
                <th style="background-color: #eeeeee; text-align: center;">금액</th>
                <th style="background-color: #eeeeee; text-align: center;"></th>
            </tr>
            </thead>
            <tbody>
            <%

                Connection conn = DBconnector.getMySQLConnection();
                ArrayList<Menu> list = MenuDAO.getList(pageNumber, conn);
                for (int i = 0; i < list.size(); i++) {
                    String MenuNo = list.get(i).getMenuNo();
            %>
            <tr>
                <td><%=list.get(i).getMenuNo()%></td>
                <td><%=list.get(i).getMenuName()%></td>
                <td><%=list.get(i).getAmount()%></td>
                <td><a href="DeleteMenuAction.jsp?MenuNo=<%=MenuNo%>" class="btn btn-primary">삭제</a></td>
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
        <a href="StoreManagementView.jsp?pageNumber=<%=pageNumber - 1%>"
           class="btn btn-success btn-arrow-left">이전</a>
        <%
            }
//            if (bbsDAO.nextPage(pageNumber)) {
        %>
        <a href="StoreManagementView.jsp?pageNumber=<%=pageNumber + 1%>"
           class="btn btn-success btn-arrow-left">다음</a>
        <%
            //            }
        %>

        <%
            //if logined userID라는 변수에 해당 아이디가 담기고 if not null
            if (session.getAttribute("userID") != null) {
        %>
        <a href="insertMenuInfo.jsp" class="btn btn-primary pull-right">추가</a>
        <%
        } else {
        %>
        <button class="btn btn-primary pull-right" onclick="if(confirm('로그인 하세요'))location.href='loginView.jsp';" type="button">추가</button>
        <%
            }
        %>
        </div>
</div>


<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>

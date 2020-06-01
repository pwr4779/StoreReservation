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
    <title>메뉴선택</title>
</head>
<body>

<%
    int StoreNo = 0;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = Integer.parseInt(request.getParameter("StoreNo"));
    }

    String userID = request.getParameter("userID");

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
            <li><a href="UserHomeView.jsp">내정보</a></li>
            <li><a href="OrderView.jsp">주문하기</a></li>
            <li><a href=".jsp">예약하기</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>
<!-- 테이블선택-->
<div class="container">
    <form method="post" action="OrderAction.jsp?StoreNo<%=StoreNo%>&userID=<%=userID%>">
    <div class="col-lg-2">
    <h2>테이블선택</h2>
        <select class="form-control" name="tableNum">
        <%
            int tablecount = StoreDAO.getTable(StoreNo);
            ArrayList<Order> orderlist = OrderDAO.getList(0);

            for (int k = 1; k <= tablecount; k++) {
                if(!orderlist.contains(k))
            %>
             <option><%=k%></option>
        <%

            }
        %>
        </select>
    </div>
        <div class="col-lg-2">
            <h2>인원수</h2>
            <select class="form-control" name="UserCount">
                <%
                    for (int j = 1; j <= 20; j++) {
                %>
                <option><%=j%></option>
                <%
                    }
                %>
            </select>
        </div>
    <div class="col-lg-12"><h2></h2></div>
    <div class="row">
        <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">메뉴번호</th>
                <th style="background-color: #eeeeee; text-align: center;">메뉴명</th>
                <th style="background-color: #eeeeee; text-align: center;">금액</th>
                <th style="background-color: #eeeeee; text-align: center;">주문수량</th>
            </tr>
            </thead>
            <tbody>
            <%
                Connection conn = DBconnector.getMySQLConnection();
                ArrayList<Menu> list = MenuDAO.getList(0, conn);
                for (int i = 0; i < list.size(); i++) {
                    String MenuNo = list.get(i).getMenuNo();
            %>
            <tr>
                <td><div class="col-lg-12"><%=list.get(i).getMenuNo()%></div></td>
                <td><div class="col-lg-12"><%=list.get(i).getMenuName()%></div></td>
                <td><div class="col-lg-12" ><%=list.get(i).getAmount()%></div></td>
                <td><div class="col-lg-12"><input type="text" class="form-control" placeholder="수량" name="count<%=i%>" maxlength="20" value="<%=0%>"></div></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
        <input type="submit" class="btn btn-primary form-control" value="주문하기">
    </form>
</div>


<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>

</body>
</html>


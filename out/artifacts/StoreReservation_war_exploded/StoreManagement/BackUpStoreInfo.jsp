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
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <!-- 뷰포트 -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- 스타일시트 참조  -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>레스토랑 웹사이트</title>
</head>
<body>

<%
    int StoreNo = 0;
    int SelectNo = 0;
    if (request.getParameter("StoreNo") != null && request.getParameter("SelectNo") !=null) {
        String StoreNostr = ""+request.getParameter("StoreNo");
        StoreNo = Integer.parseInt(StoreNostr);
        String SelectNostr = ""+request.getParameter("SelectNo");
        SelectNo = Integer.parseInt(SelectNostr);
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
        <a class="navbar-brand" href="StoreManagementView.jsp">레스토랑 주문 & 예약 시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="StoreManagementView.jsp">매장관리</a></li>
            <li><a href="../Menu/MenuManageView.jsp">메뉴관리</a></li>
            <li><a href="../Payment/PaymentSelectStore.jsp">주문현황 및 결제처리</a></li>
            <li><a href="../Payment/PaymentStateView.jsp">결제처리현황</a></li>
            <li><a href="../ReservationManagement/ReservationManagementView.jsp">예약관리</a></li>
            <li><a href="../UserManagement/UserManagementView.jsp">회원관리</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>
<!-- 매장정보 -->
<div class="container">
    <div class="col-lg-7">
        <div class="row">
            <table class="table table-striped"
                   style="text-align: center; border: 1px solid #dddddd">
                <thead>
                <tr>
                    <th style="background-color: #eeeeee; text-align: center;">변경일</th>
                    <th style="background-color: #eeeeee; text-align: center;">변경번호</th>
                    <th style="background-color: #eeeeee; text-align: center;">매장번호</th>
                    <th style="background-color: #eeeeee; text-align: center;">주소</th>
                    <th style="background-color: #eeeeee; text-align: center;">전화번호</th>
                    <th style="background-color: #eeeeee; text-align: center;">테이블수</th>
                    <th style="background-color: #eeeeee; text-align: center;">오픈시간</th>
                    <th style="background-color: #eeeeee; text-align: center;">마감시간</th>
                    <th style="background-color: #eeeeee; text-align: center;">매장명</th>
                    <th style="background-color: #eeeeee; text-align: center;">불러오기</th>
                </tr>
                </thead>
                <tbody>
                <%
                    StoreDAO storeDAO = new StoreDAO();
                    Connection conn = DBconnector.getMySQLConnection();
                    ArrayList<Store> list = storeDAO.getBeforeInfoList(StoreNo);
                    if(list != null){
                        for (int i = 0; i < list.size(); i++) {
                %>
                <form method="post" action="BackUpStoreInfo.jsp?StoreNo=<%=StoreNo%>&select=<%=i%>">
                    <tr>
                        <td><%=list.get(i).getHistoryDate()%></td>
                        <td><%=list.get(i).getHistoryNo()%></td>
                        <td><%=list.get(i).getStoreNo()%></td>
                        <td><%=list.get(i).getStoreAddr()%></td>
                        <td><%=list.get(i).getStorePhone()%></td>
                        <td><%=list.get(i).getStoreTable()%></td>
                        <td><%=list.get(i).getStoreOpen().substring(0,2)+":"+list.get(i).getStoreOpen().substring(2,4)%></td>
                        <td><%=list.get(i).getStoreClose().substring(0,2)+":"+list.get(i).getStoreClose().substring(2,4)%></td>
                        <td><%=list.get(i).getStoreName()%></td>
                        <td><input type="submit" class="btn btn-primary form-control" value="선택"></td>
                    </tr>
                </form>
                <%  }
                }
                    String getStoreName = list.get(SelectNo).getStoreName();
                    String getStoreAddr = list.get(SelectNo).getStoreAddr();
                    String getStorePhone = list.get(SelectNo).getStorePhone();
                    int getStoreTable = list.get(SelectNo).getStoreTable();
                    String getStoreOpen = list.get(SelectNo).getStoreOpen().substring(11,13)+list.get(SelectNo).getStoreOpen().substring(14,16);
                    String getStoreClose = list.get(SelectNo).getStoreClose().substring(11,13)+list.get(SelectNo).getStoreClose().substring(14,16);


                %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" accept-charset="euc-kr" onsubmit="document.charset='euc-kr';"  action="alterStoreInfoAction.jsp?StoreNo=<%= StoreNo %>">
                <h3 style="text-align: center;">매장정보수정</h3>
                <div class="form-group" >
                    <input type="text" class="form-control" placeholder="매장명" name="StoreName" maxlength="20" value=<%=getStoreName%>>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="주소" name="StoreAddr" maxlength="20" value=<%=getStoreAddr%> >
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="전화번호" name="StorePhone" maxlength="20" value=<%=getStorePhone%> >
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="테이블수" name="StoreTable" maxlength="20" value=<%=getStoreTable%>>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="오픈시간" name="StoreOpen" maxlength="20" value=<%=getStoreOpen%>>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="마감시간" name="StoreClose" maxlength="20" value=<%=getStoreClose%>>
                </div>

                <input type="submit" class="btn btn-primary form-control" value="수정">
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

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
    <title>레스토랑 웹사이트 </title>
</head>
<body>
<%
    int StoreNo = 0;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = Integer.parseInt(request.getParameter("StoreNo"));
    }
    if (StoreNo == 0) {
%>
<script>
    alert("유효한 매장정보가 아닙니다!!")
    location.href = 'StoreManagementView.jsp'
</script>
<%
    }
    Store store = new StoreDAO().getStore(StoreNo);

    if (request.getParameter("StoreName") == null || request.getParameter("StoreAddr") == null
            || request.getParameter("StorePhone")==null || request.getParameter("StoreTable")==null|| request.getParameter("StoreOpen")==null || request.getParameter("StoreClose")==null) {
%>
<script>
    alert("수정항목을 입력해주세요.")
    location.href = 'alterStoreInfo.jsp?StoreNo=<%=StoreNo%>'
</script>
<%
} else {
        String StoreName = new String(request.getParameter("StoreName").getBytes("8859_1"), "EUC-KR");
        String StoreAddr = new String(request.getParameter("StoreAddr").getBytes("8859_1"), "EUC-KR");
        String StorePhone = new String(request.getParameter("StorePhone").getBytes("8859_1"), "EUC-KR");
    String StoreOpen = new String(request.getParameter("StoreOpen").getBytes("8859_1"), "EUC-KR");
    String StoreClose = new String(request.getParameter("StoreClose").getBytes("8859_1"), "EUC-KR");
        StoreDAO.insertBeforeInfo(store);
        int result = StoreDAO.update(Integer.toString(StoreNo),StoreName,StoreAddr, StorePhone, Integer.parseInt(request.getParameter("StoreTable")), StoreOpen, StoreClose);
        if (result == -1) {
%>
<script>
    alert("수정 실패")
    location.href = 'alterStoreInfo.jsp?StoreNo=<%=StoreNo%>'
</script>
<%
} else {
%>
<script>
    alert("수정 완료!!")
    location.href = 'alterStoreInfo.jsp?StoreNo=<%=StoreNo%>'
</script>
<%

        }
    }

%>
</body>

</html>


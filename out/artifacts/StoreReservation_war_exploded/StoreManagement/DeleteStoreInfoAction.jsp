<%@ page import="DB.StoreDAO" %><%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-30
  Time: 오전 12:51
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
    <title>매장정보삭제</title>
</head>
<body>
<%
    int StoreNo = 0;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = Integer.parseInt(request.getParameter("StoreNo"));
    }
    if (StoreNo == 0) {%>
<script>
    alert( "매장 삭제 실패!!")
    location.href='StoreManagementView.jsp'
</script>
<%}else{
    int result = StoreDAO.deleteStore(StoreNo);
    if(result == -1){
%>
<script>
    alert( "매장 삭제 실패!!")
    location.href = 'StoreManagementView.jsp'
</script>
<%
}else{
%>
<script>
    alert( "매장 삭제 완료!!")
    location.href = 'StoreManagementView.jsp'
</script>
<%
        }
    }
%>
</body>
</html>

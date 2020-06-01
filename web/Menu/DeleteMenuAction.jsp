<%@ page import="DB.StoreDAO" %>
<%@ page import="DB.MenuDAO" %><%--
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
    <title>메뉴정보삭제</title>
</head>
<body>
<%
    int MenuNo = 0;
    if (request.getParameter("MenuNo") != null) {
        MenuNo = Integer.parseInt(request.getParameter("MenuNo"));
    }
    if (MenuNo == 0) {%>
<script>
    alert( "메뉴 삭제 실패!!")
    location.href='MenuManageView.jsp'
</script>
<%}else{
    int result = MenuDAO.deleteMenu(MenuNo);
    if(result == -1){
%>
<script>
    alert( "메뉴 삭제 실패!!")
    location.href = 'MenuManageView.jsp'
</script>
<%
}else{
%>
<script>
    alert( "메뉴 삭제 완료!!")
    location.href = 'MenuManageView.jsp'
</script>
<%
        }
    }
%>
</body>
</html>
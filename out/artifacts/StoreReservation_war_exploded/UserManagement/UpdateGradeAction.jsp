<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-29
  Time: 오후 6:58
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-24
  Time: 오전 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page  language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%@ page import="DB.*" %>


<html>
<head>
    <title>회원 등급 갱신</title>
</head>
<body>
<%
int result = -1;
    result = UserDAO.UpdateGrade();
if(result != -1){
    result = -1;
    result = UserDAO.UserGradeHistoryInsert();
    if(result != -1){
%>
<script>
    alert( "업데이트 성공!!.")
    location.href = 'UserManagementView.jsp'
</script>
<%
    }else{
%>
<script>
    alert( "업데이트 실패!!.")
    location.href = 'UserManagementView.jsp'
</script>
<%
    }
}else{
%>
<script>
    alert( "업데이트 실패!!.")
    location.href = 'UserManagementView.jsp'
</script>
<%
    }
%>


<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>
</body>
</html>

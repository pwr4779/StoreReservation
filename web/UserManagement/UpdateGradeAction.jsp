<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-29
  Time: ���� 6:58
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-24
  Time: ���� 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page  language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%@ page import="DB.*" %>


<html>
<head>
    <title>ȸ�� ��� ����</title>
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
    alert( "������Ʈ ����!!.")
    location.href = 'UserManagementView.jsp'
</script>
<%
    }else{
%>
<script>
    alert( "������Ʈ ����!!.")
    location.href = 'UserManagementView.jsp'
</script>
<%
    }
}else{
%>
<script>
    alert( "������Ʈ ����!!.")
    location.href = 'UserManagementView.jsp'
</script>
<%
    }
%>


<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>
</body>
</html>
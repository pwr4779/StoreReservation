<%@ page import="java.sql.Connection" %>
<%@ page import="DB.DBconnector" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-05-23
  Time: 오전 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<form method="post" name="form">
    <table>
        <h2>Restuarant Reservation System</h2>
        <label>ID : <input type="text" name="id"></label><br/>
        <label>Password : <input type="password" name="password"></label><br/>
        <input type="submit" value="Login" onclick="javascript: form.action='loginCheck.jsp';"/>
        <input type="submit" value="Sign Up" onclick="javascript: form.action='signUp.jsp';"/>
        <%    Connection conn = DBconnector.getMySQLConnection();
        %>
    </table>
</form>
</html>
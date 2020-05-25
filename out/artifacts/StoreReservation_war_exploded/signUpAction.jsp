<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-24
  Time: 오전 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page  language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%@ page import="DB.DBconnector" %>
<%@ page import="DB.User" %>
<%@ page import="DB.UserDAO" %>


<html>
<head>
    <title>회원가입확인</title>
</head>
<body>
<%
    String userName = DBconnector.NullCheck(request.getParameter("userName"));
    String userID = DBconnector.NullCheck(request.getParameter("userID"));
    String userPassword = DBconnector.NullCheck(request.getParameter("userPassword"));
    String userAddr = DBconnector.NullCheck(request.getParameter("userAddr"));
    String userPhone = DBconnector.NullCheck(request.getParameter("userPhone"));
    String userBirth = DBconnector.NullCheck(request.getParameter("userBirth"));
    String userHobby = DBconnector.NullCheck(request.getParameter("userHobby"));
    String userPreferenceStore = DBconnector.NullCheck(request.getParameter("userPreferenceStore"));
    User user = new User(userName, userID, userPassword, userAddr, userPhone, userBirth, userHobby, userPreferenceStore, null);
    Connection conn = DBconnector.getMySQLConnection();
    if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
            || user.getUserAddr() == null || user.getUserPhone() == null || user.getUserBirth()==null){
%>
    <script>
        alert( "필수정보를 입력해주세요.")
        location.href = 'signUpView.jsp'
    </script>
<%
    }else{
        int result = UserDAO.SignUp(user, conn);
        if(result == -1){
%>
    <script>
        alert( "존재하는 아이디 입니다.")
        location.href = 'signUpView.jsp'
    </script>
<%
        }else{
            UserDAO.UserDetailDefaultInsert(user,conn);
%>
    <script>
        alert( "회원가입 완료!!")
        location.href = 'loginView.jsp'
    </script>
<%
        }
    }
%>

</body>
</html>


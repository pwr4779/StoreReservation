<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-05-23
  Time: 오전 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page  language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<%@ page import="DB.DBconnector" %>
<%
    request.setCharacterEncoding("euc-kr");%>

<html>
<head>
    <title>로그인확인</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("password");
    Connection conn = DBconnector.getMySQLConnection();
    String sql = "select count(*) count from USERS where ID = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    int count = rs.getInt("count");
    if(count==0){%>
        <script>
            alert( "일치하는 회원정보가 없습니다!!")
            location.href='loginView.jsp'
        </script>
    <%}else {
        sql = "select * from USERS where ID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        String password;
        rs.next();
        String ID = rs.getString("ID");
        String Password = rs.getString("PASSWORD");
        String User_No = rs.getString("USER_NO");
        DBconnector.close(rs);
        DBconnector.close(pstmt);
        DBconnector.close(conn);

        if(Password.equals(pw)){
            if(User_No.equals("master0000")){%>
                         <script>
                        alert( "로그인완료!!")
                        location.href='StoreManagement/StoreManagementView.jsp'
                        </script>
            <%}else{
        %>
            <script>
    alert( "로그인완료!!")
    location.href='User/UserHomeView.jsp'
</script>
            <%}
                session.setAttribute("userID", ID);
        }else{%>
            <script>
                    alert( "회원정보가 없습니다.")
                    location.href='loginView.jsp'
                    </script >
        <%}
    }
%>
</body>
</html>

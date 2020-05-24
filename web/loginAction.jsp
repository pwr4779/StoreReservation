<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-05-23
  Time: 오전 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page  language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%@ page import="DB.DBconnector" %>
<%
    request.setCharacterEncoding("UTF-8");%>

<html>
<head>
    <title>로그인확인</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("password");
    Connection conn = DBconnector.getMySQLConnection();
    String sql = "select count(*) count from 회원 where 아이디 = ?";
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
        sql = "select * from 회원 where 아이디 = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        String password;
        rs.next();
        String Password = rs.getString("비밀번호");
        String masterNo = rs.getString("회원번호");
        DBconnector.close(rs);
        DBconnector.close(pstmt);
        DBconnector.close(conn);

        if(Password.equals(pw)){
            if(masterNo.equals("master0000")){%>
                         <script>
                        alert( "로그인완료!!")
                        location.href='storeManagementView.jsp'
                        </script>
            <%}else{
        %>
            <script>
                    alert( "로그인완료!!")
                    location.href='UserView.jsp'
             </script>
            <%}
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

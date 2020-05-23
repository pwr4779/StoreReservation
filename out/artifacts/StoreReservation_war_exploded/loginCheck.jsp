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
    String sql = "select count(*) count from testdb2.test where id like ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    int count = rs.getInt("count");
    if(count==0){%>
        <script>
            alert( "일치하는 회원정보가 없습니다!!")
            location.href='index.jsp'
        </script>
    <%}else {
        sql = "select * from testdb2.test where id like ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        String password;
        rs.next();
        password = rs.getString("password");
        DBconnector.close(rs);
        DBconnector.close(pstmt);
        DBconnector.close(conn);

        if(password.equals(pw)){%>
            <script>
                    alert( "로그인완료!!")
                    location.href='index.jsp'
             </script>
        <%}else{%>
            <script>
                    alert( "회원정보가 없습니다.")
                    location.href='index.jsp'
                    </script >
        <%}
    }
%>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-05-23
  Time: 오후 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
   <form action="signUpCheck.jsp" method="post">
       <input type="hidden" name ="ip" value="<%=request.getRemoteAddr()%>"/>
       <table width="400" align="center" border="1">
            <tr><th colspan="2">회원가입</th></tr>
            <tr>
                <td width="200" align="center">아이디</td>
                <td width="200" align="center"><input type="text" name="id"/></td>
            </tr>
           <tr>
               <td width="200" align="center">비밀번호</td>
               <td width="200" align="center"><input type="password" name="password"/></td>
           </tr>
           <tr>
               <td width="200" align="center">이름</td>
               <td width="200" align="center"><input type="text" name="name"/></td>
           </tr>
           <tr>
               <td width="200" align="center">나이</td>
               <td width="200" align="center"><input type="text" name="age"/></td>
           </tr>
       </table>
   </form>
</body>
</html>

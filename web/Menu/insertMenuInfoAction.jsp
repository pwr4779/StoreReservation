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
<%@ page import="static com.sun.xml.internal.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table" %>


<html>
<head>
    <title>메뉴 정보 추가 확인</title>
</head>
<body>
<%
    String MenuName = DBconnector.NullCheck(new String(request.getParameter("MenuName").getBytes("8859_1"), "EUC-KR"));
    String Amount = DBconnector.NullCheck(request.getParameter("Amount"));

    Menu menu = new Menu(null,MenuName,Integer.parseInt(Amount));
    Connection conn = DBconnector.getMySQLConnection();
    if (menu.getMenuName() == null){
%>
<script>
    alert( "필수정보를 입력해주세요.")
    location.href = 'insertStoreInfo.jsp'
</script>
<%
}else{
    int result = MenuDAO.insertMenu(menu);
    if(result == -1){
%>
<script>
    alert( "매장 추가 실패!!.")
    location.href = 'MenuManageView.jsp'
</script>
<%
}else{
%>
<script>
    alert( "매장 추가 완료!!")
    location.href = 'MenuManageView.jsp'
</script>
<%
        }
    }
%>

<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>



</body>
</html>

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
    <title>매장 정보 추가 확인</title>
</head>
<body>
<%
    String storeNo = DBconnector.NullCheck(new String(request.getParameter("storeNo").getBytes("8859_1"), "EUC-KR"));
    String addr = DBconnector.NullCheck(new String(request.getParameter("addr").getBytes("8859_1"), "EUC-KR"));
    String phone = DBconnector.NullCheck(new String(request.getParameter("phone").getBytes("8859_1"), "EUC-KR"));
    String table = DBconnector.NullCheck(new String(request.getParameter("table").getBytes("8859_1"), "EUC-KR"));
    String openTime = DBconnector.NullCheck(new String(request.getParameter("openTime").getBytes("8859_1"), "EUC-KR"));
    String closeTime = DBconnector.NullCheck(new String(request.getParameter("closeTime").getBytes("8859_1"), "EUC-KR"));
    String storeName = DBconnector.NullCheck(new String(request.getParameter("storeName").getBytes("8859_1"), "EUC-KR"));

    Store store = new Store(storeNo,addr,phone,Integer.parseInt(table),openTime,closeTime,storeName,null,null);
    Connection conn = DBconnector.getMySQLConnection();
    if (store.getStoreNo() == null || store.getStoreAddr() == null || store.getStorePhone() == null
            || table == null || store.getStoreOpen() == null || store.getStoreClose()==null){
%>
<script>
    alert( "필수정보를 입력해주세요.")
    location.href = 'insertStoreInfo.jsp'
</script>
<%
}else{
    int result = StoreDAO.insertStore(store);
    if(result == -1){
%>
<script>
    alert( "매장 추가 실패!!.")
    location.href = 'insertStoreInfo.jsp'
</script>
<%
}else{
%>
<script>
    alert( "매장 추가 완료!!")
    location.href = 'StoreManagementView.jsp'
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
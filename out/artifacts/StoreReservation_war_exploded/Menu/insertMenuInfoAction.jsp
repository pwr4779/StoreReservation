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
<%@ page import="static com.sun.xml.internal.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table" %>


<html>
<head>
    <title>�޴� ���� �߰� Ȯ��</title>
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
    alert( "�ʼ������� �Է����ּ���.")
    location.href = 'insertStoreInfo.jsp'
</script>
<%
}else{
    int result = MenuDAO.insertMenu(menu);
    if(result == -1){
%>
<script>
    alert( "���� �߰� ����!!.")
    location.href = 'MenuManageView.jsp'
</script>
<%
}else{
%>
<script>
    alert( "���� �߰� �Ϸ�!!")
    location.href = 'MenuManageView.jsp'
</script>
<%
        }
    }
%>

<!-- �ִϸ��̼� ��� JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>



</body>
</html>
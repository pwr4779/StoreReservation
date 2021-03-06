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
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>


<html>
<head>
    <title>주문하기</title>
</head>
<body>
<%
    int StoreNo = 0;
    if (request.getParameter("StoreNo") != null) {
        StoreNo = Integer.parseInt(request.getParameter("StoreNo"));
    }

    String UserNo = null;
    if (request.getParameter("userID") != null) {
        UserNo = request.getParameter("userID");
    }
    Connection conn = DBconnector.getMySQLConnection();
    ArrayList<Menu> list = MenuDAO.getList(0, conn);
    SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHHmmss");
    String current = format.format (System.currentTimeMillis());

    String OrderNo = StoreNo+UserNo+current;
    int count = OrderDAO.checkOrder(UserNo);
    if(count==0){
    int flag = 0;
    for (int i = 0; i < list.size(); i++) {
        String MenuNo = list.get(i).getMenuNo();
        int MenuAmount = list.get(i).getAmount();
        if ( Integer.parseInt(request.getParameter("count" + i)) > 0) {
            if(flag == 0){
                int r = OrderDAO.InsertOrder(OrderNo, StoreNo+ "", UserNo + "", 0, Integer.parseInt(request.getParameter("tableNum")), Integer.parseInt(request.getParameter("UserCount")));
            }
            OrderDAO.InsertOrderMenu(MenuNo, OrderNo, Integer.parseInt(request.getParameter("count" + i)), MenuAmount);
        }
    }
    int totalamount = OrderDAO.totalAmount(OrderNo);
    int result = -1;
    if(totalamount >0) {
        result = OrderDAO.UpdateTotalAmount(OrderNo,  totalamount);
    }
        if(result != -1){
%>
<script>
    alert( "주문 성공!!")
    location.href = 'OrderStateView.jsp'
</script>
<%
    }else{
%>
<script>
        alert( "주문 실패!!")
    location.href = 'OrderView.jsp'
            </script>
<%
    }
}else{
%>
<script>
    alert( "이미 주문이 들어가 있습니다!!")
    location.href = 'OrderView.jsp'
</script>
<%
}
    %>
</body>
</html>


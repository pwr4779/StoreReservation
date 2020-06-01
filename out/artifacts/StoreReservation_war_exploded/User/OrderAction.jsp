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

    int UserNo = 0;
    if (request.getParameter("UserNo") != null) {
        UserNo = Integer.parseInt(request.getParameter("userID"));
    }
    Connection conn = DBconnector.getMySQLConnection();
    ArrayList<Menu> list = MenuDAO.getList(0, conn);
    String OrderNo = StoreNo+""+UserNo;
    for (int i = 0; i < list.size(); i++) {
        String MenuNo = list.get(i).getMenuNo();
        int MenuAmount = list.get(i).getAmount();
        if (request.getParameter("count") != null && Integer.parseInt(request.getParameter("count" + i)) > 0) {
            OrderDAO.InsertOrderMenu(MenuNo, OrderNo, Integer.parseInt(request.getParameter("count" + i)), MenuAmount);
        }
    }
    int totalamount = OrderDAO.totalAmount(OrderNo);
    OrderDAO.InsertOrder(OrderNo,StoreNo+"",UserNo+"",totalamount,Integer.parseInt(request.getParameter("tableNum")),Integer.parseInt(request.getParameter("UserCount")));
%>

</body>
</html>


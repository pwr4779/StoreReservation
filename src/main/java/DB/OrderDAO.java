package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrderDAO {

    public static ArrayList<Order> getList(int StoreNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM ORDERS WHERE STORE_NO = ?";
        ArrayList<Order> list = new ArrayList<Order>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, Integer.toString(StoreNo));
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getString("ORDER_NO"), rs.getString("STORE_NO"), rs.getString("USER_NO"), rs.getInt("TOTAL_ORDER_AMOUNT"), rs.getInt("TABLE_NO"), rs.getInt("NUM_OF_USERS"));        list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static int InsertOrderMenu(String MenuNo,String OrderNo, int count, int Menuamount){
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO ORDER_MENU VALUES(?,?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            int amount = Menuamount*count;
            pstmt.setString(1, MenuNo);
            pstmt.setString(2, OrderNo);
            pstmt.setInt(3, count);
            pstmt.setInt(4, amount);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    public static int totalAmount(String OrderNo){
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT SUM(ORDER_AMOUNT) AS SUM FROM ORDER_MENU WHERE ORDER_NO=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, OrderNo);
            ResultSet rs = pstmt.executeQuery();
            rs.next();

            return rs.getInt("SUM");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int InsertOrder(String OrderNo,String StoreNo, String UserNo, int totalamount, int tableNo, int Usercount){
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO ORDERS VALUES(?,?,?,?,?,?,'N')";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, OrderNo);
            pstmt.setString(2, StoreNo);
            pstmt.setString(3, UserNo);
            pstmt.setInt(4, totalamount);
            pstmt.setInt(5, tableNo);
            pstmt.setInt(6, Usercount);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int UpdateTotalAmount(String OrderNo, int totalamount){
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "UPDATE ORDERS SET TOTAL_ORDER_AMOUNT=? WHERE ORDER_NO=? AND orders.payment='N'";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, totalamount);
            pstmt.setString(2, OrderNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static ArrayList<OrderState> OrderState(String UserID){
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "select * from order_menu left outer join menu on order_menu.menu_no = menu.menu_no left outer join orders on order_menu.order_no = orders.order_no left outer join store on orders.store_no=store.store_no where user_no=? and orders.payment_check='N'";
        ArrayList<OrderState> list = new ArrayList<OrderState>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, UserID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String OrderNo = rs.getString("ORDER_NO");
                String StoreNo = rs.getString("STORE_NO");
                String STORE_NAME = rs.getString("STORE_NAME");
                String MenuName = rs.getString("MENU_NAME");
                String UserNo = rs.getString("USER_NO");
                int AMOUNT = rs.getInt("AMOUNT");
                int NUM_OF_ORDERS = rs.getInt("NUM_OF_ORDERS");
                int ORDER_AMOUNT =  rs.getInt("ORDER_AMOUNT");
                int TOTAL_ORDER_AMOUNT = rs.getInt("TOTAL_ORDER_AMOUNT");
                int TABLE_NO = rs.getInt("TABLE_NO");
                int NUM_OF_USERS = rs.getInt("NUM_OF_USERS");
                OrderState orderState = new OrderState(OrderNo,StoreNo,STORE_NAME,MenuName ,UserNo,AMOUNT ,NUM_OF_ORDERS,ORDER_AMOUNT,TOTAL_ORDER_AMOUNT ,TABLE_NO, NUM_OF_USERS);
                list.add(orderState);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<OrderState> OrderStateDetail(String Order_No){
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "select * from order_menu left outer join menu on order_menu.menu_no = menu.menu_no left outer join orders on order_menu.order_no = orders.order_no left outer join store on orders.store_no=store.store_no where orders.order_no=? and orders.payment_check='N'";
        ArrayList<OrderState> list = new ArrayList<OrderState>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, Order_No);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String OrderNo = rs.getString("ORDER_NO");
                String StoreNo = rs.getString("STORE_NO");
                String STORE_NAME = rs.getString("STORE_NAME");
                String MenuName = rs.getString("MENU_NAME");
                String UserNo = rs.getString("USER_NO");
                int AMOUNT = rs.getInt("AMOUNT");
                int NUM_OF_ORDERS = rs.getInt("NUM_OF_ORDERS");
                int ORDER_AMOUNT =  rs.getInt("ORDER_AMOUNT");
                int TOTAL_ORDER_AMOUNT = rs.getInt("TOTAL_ORDER_AMOUNT");
                int TABLE_NO = rs.getInt("TABLE_NO");
                int NUM_OF_USERS = rs.getInt("NUM_OF_USERS");
                OrderState orderState = new OrderState(OrderNo,StoreNo,STORE_NAME,MenuName ,UserNo,AMOUNT ,NUM_OF_ORDERS,ORDER_AMOUNT,TOTAL_ORDER_AMOUNT ,TABLE_NO, NUM_OF_USERS);
                list.add(orderState);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

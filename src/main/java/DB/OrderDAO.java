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
        String SQL = "INSERT INTO ORDER_MENU VALUES(? ?,?,?)";
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
        String SQL = "SELECT SUM(amount) AS SUM INTO ORDER_MENU WHERE ORDER_NO=?";
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
        String SQL = "INSERT INTO ORDERS VALUES(?,?,?,?,?,?)";
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

}

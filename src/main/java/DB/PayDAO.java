package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PayDAO {

    public static int NullToZero(String str){
        if(str.equals("")){
            return 0;
        }
        return Integer.parseInt(str);
    }


    public static int PaymentInsert(String orderNo, int SaleCoupon , int amount, int installMonth, int usingPoint) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO PAYMENT VALUES(?,null,?,?,?,?)";
        double total = amount;
        if(SaleCoupon != 0){
            total = total - (total*SaleCoupon)/100;
        }
        total = total- usingPoint;
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, orderNo);
            pstmt.setInt(2, SaleCoupon);
            pstmt.setDouble(3, total);
            pstmt.setInt(4, installMonth);
            pstmt.setInt(5, usingPoint);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int AffiliatePaymentInsert(String orderNo, int orderCode, int SaleCoupon , int amount, int installMonth, int usingPoint) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO PAYMENT VALUES(?,?,?,?,?,?)";
        double total = amount;
        if(SaleCoupon != 0){
            total = total - (total*SaleCoupon)/100;
        }
        total = total- usingPoint;
        if(orderCode == 10 || orderCode == 20){
            total = total - (total*5)/100;
        }
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, orderNo);
            pstmt.setInt(2, orderCode);
            pstmt.setInt(3, SaleCoupon);
            pstmt.setDouble(4, total);
            pstmt.setInt(5, installMonth);
            pstmt.setInt(6, usingPoint);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


    public static int UserUpdateAboutPay(String userNo, int saleCoupon, int usingPoint) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = null;
        if(saleCoupon == 0) {
            SQL = "UPDATE USER_DETAIL SET NUM_OF_ORDERS=NUM_OF_ORDERS+1,AC_POINT=AC_POINT-"+usingPoint+"+1000," +
                    "YEAR_AC_POINT=YEAR_AC_POINT+1000 WHERE USER_NO=? ";
        }else{
            String coupon_count = "COUPON_COUNT_"+saleCoupon+"P";
            SQL = "UPDATE USER_DETAIL SET NUM_OF_ORDERS=NUM_OF_ORDERS+1,AC_POINT=AC_POINT-"+usingPoint+"+1000," +
                    coupon_count+"="+coupon_count+"-1, YEAR_AC_POINT=YEAR_AC_POINT+1000 WHERE USER_NO=? ";
        }
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int FinishPaymentProcessing(String orderNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = null;
        SQL = "UPDATE ORDERS SET PAYMENT_CHECK = 'Y' WHERE ORDER_NO = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, orderNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static ArrayList<Payment> getFinishList() {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM PAYMENT";
        ArrayList<Payment> list = new ArrayList<Payment>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String ORDER_NO = rs.getString("ORDER_NO");
                String SALE_CODE = rs.getString("SALE_CODE");
                String SALE_COUPON = rs.getString("SALE_COUPON");
                String FINAL_PAY_AMOUNT = rs.getString("FINAL_PAY_AMOUNT");
                String INSTALL_MONTH = rs.getString("INSTALL_MONTH");
                String USING_POINT = rs.getString("USING_POINT");
                Payment payment = new Payment(ORDER_NO,SALE_CODE,SALE_COUPON,FINAL_PAY_AMOUNT,INSTALL_MONTH,USING_POINT);
                list.add(payment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int CardDiscountTableInsert(String orderNo, String cardCom, String cardNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO CARD_DISCOUNT VALUES(?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, orderNo);
            pstmt.setString(2, cardCom);
            pstmt.setString(3, cardNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int PhoneDiscountTableInsert(String orderNo, String phoneCom, String phoneNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO PHONE_DISCOUNT VALUES(?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, orderNo);
            pstmt.setString(2, phoneCom);
            pstmt.setString(3, phoneNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}

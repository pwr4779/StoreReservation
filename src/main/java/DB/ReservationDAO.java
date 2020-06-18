package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReservationDAO {
    public static int InsertReservation(String reservationNo, String userID, String storeNo, String DATE, String numOfUser) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO Reservation VALUES (?,?,?,TO_DATE(?,'YYYY-MM-DDHH24:MI'),?,'N','N', 'N')";
        PreparedStatement pstmt;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, reservationNo);
            pstmt.setString(2, userID);
            pstmt.setString(3, storeNo);
            pstmt.setString(4, DATE);
            pstmt.setString(5, numOfUser);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB 오류
    }

    public static Reservation getReservationState(String userID) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM RESERVATION WHERE USER_NO=? AND CANCEL_CHECK='N' AND VISIT_CHECK='N' AND NOSHOW_CHECK='N' AND SYSDATE<VISIT_SC_DATE ORDER BY VISIT_SC_DATE DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            Reservation reservation = new Reservation(rs.getString("RESERVATION_NO"),rs.getString("USER_NO"),rs.getString("STORE_NO"),rs.getString("VISIT_SC_DATE"),rs.getString("SC_NUM_OF_USERS"),rs.getString("CANCEL_CHECK"),rs.getString("VISIT_CHECK"),rs.getString("NOSHOW_CHECK"));
            return  reservation;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static ArrayList<Reservation> getList(String StoreNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM RESERVATION WHERE STORE_NO=? AND CANCEL_CHECK='N' AND VISIT_CHECK='N' AND NOSHOW_CHECK='N' ORDER BY VISIT_SC_DATE DESC";
        ArrayList<Reservation> list = new ArrayList<Reservation>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, StoreNo);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Reservation reservation = new Reservation(rs.getString("RESERVATION_NO"), rs.getString("USER_NO"), rs.getString("STORE_NO"), rs.getString("VISIT_SC_DATE"), rs.getString("SC_NUM_OF_USERS"), rs.getString("CANCEL_CHECK"), rs.getString("VISIT_CHECK"), rs.getString("NOSHOW_CHECK"));
                list.add(reservation);
            }
            return  list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
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

    public static double timelimit(String userID) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT ROUND((VISIT_SC_DATE-SYSDATE)*24,2) limit FROM RESERVATION WHERE USER_NO=? AND CANCEL_CHECK='N' AND VISIT_CHECK='N' AND NOSHOW_CHECK='N' ORDER BY VISIT_SC_DATE DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            return rs.getDouble("limit");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static int cancelReservation(String reservationNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "UPDATE RESERVATION SET CANCEL_CHECK='Y' WHERE RESERVATION_NO=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, reservationNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int VisitFinish(String reservationNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "UPDATE RESERVATION SET VISIT_CHECK='Y' WHERE RESERVATION_NO=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, reservationNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int NoShow(String reservationNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "UPDATE RESERVATION SET NOSHOW_CHECK='Y' WHERE RESERVATION_NO=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, reservationNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int PenaltySactionDate(String userNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "UPDATE USERS SET RE_SA_DATE=ADD_MONTHS(SYSDATE,1) WHERE USER_NO=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int NoShowCount(String userNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT COUNT(*) COUNT FROM RESERVATION WHERE USER_NO=? AND SYSDATE>VISIT_SC_DATE AND VISIT_SC_DATE>ADD_MONTHS(SYSDATE,-1) AND NOSHOW_CHECK='Y'";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userNo);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt("COUNT");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}

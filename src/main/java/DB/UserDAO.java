package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
    public static int SignUp(User user, Connection conn) {
        String SQL = "INSERT INTO USERS VALUES (?,?,?,?,?,?,TO_DATE(?,'YYYYMMDD'),?,?,?)";
        PreparedStatement pstmt;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserName());
            pstmt.setString(3, user.getUserID());
            pstmt.setString(4, user.getUserPassword());
            pstmt.setString(5, user.getUserAddr());
            pstmt.setString(6, user.getUserPhone());
            pstmt.setString(7, user.getUserBirth());
            pstmt.setString(8, user.getUserHobby());
            pstmt.setString(9, user.getUserPreferenceStore());
            pstmt.setString(10, user.getUserSanctonDate());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB 오류
    }

    public static int UserDetailDefaultInsert(User user, Connection conn) {
        String SQL = "INSERT INTO USER_DETAIL VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setInt(2, 1000);
            pstmt.setInt(3, 0);
            pstmt.setString(4, null);
            pstmt.setInt(5, 0);
            pstmt.setInt(6, 0);
            pstmt.setInt(7, 0);
            pstmt.setInt(8, 1000);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB 오류
    }

    public static  ArrayList<UserDetail>  GetUserDetailList(int pageNumber) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM USER_DETAIL WHERE ? <= ROWNUM AND ROWNUM < ? ORDER BY USER_NO";
        ArrayList<UserDetail> list = new ArrayList<UserDetail>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, pageNumber);
            pstmt.setInt(2, (pageNumber+10));
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                UserDetail userDetail = new UserDetail(rs.getString("USER_NO"),rs.getInt("AC_POINT"),rs.getInt("NUM_OF_ORDERS"),rs.getString("GRADE"),rs.getInt("COUPON_COUNT_10p"),rs.getInt("COUPON_COUNT_7p"),rs.getInt("COUPON_COUNT_3p"),rs.getInt("YEAR_AC_POINT"));
                list.add(userDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    public static int UserGradeHistoryInsert(User user) {
//        Connection conn = DBconnector.getMySQLConnection();
//        String SQL = "INSERT INTO USER_GRADE_HISTORY VALUES (?,sysdate,'일반',)";
//        PreparedStatement pstmt;
//        try {
//            pstmt = conn.prepareStatement(SQL);
//            pstmt.setString(1, user.getUserID());
//            return pstmt.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return -1; // DB 오류
//    }
}

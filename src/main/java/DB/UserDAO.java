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
            pstmt.setString(4, "N");
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

    public static ArrayList<GradeHistory>  GetGradeHistoryList(int pageNumber, String UserNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM USER_GRADE_HISTORY WHERE ? <= ROWNUM AND ROWNUM < ? AND USER_NO=? ORDER BY GRANT_DATE";
        ArrayList<GradeHistory> list = new ArrayList<GradeHistory>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, pageNumber);
            pstmt.setInt(2, (pageNumber+10));
            pstmt.setString(3, UserNo);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                GradeHistory gradeHistory = new GradeHistory(rs.getString("USER_NO"),rs.getString("GRANT_DATE"),rs.getString("GRADE"),rs.getString("EXPIRE_DATE"));
                list.add(gradeHistory);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static  int  UpdateGrade() {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "UPDATE USER_DETAIL SET GRADE = (CASE WHEN NUM_OF_ORDERS>=20 AND YEAR_AC_POINT>=10000 THEN 'G' WHEN NUM_OF_ORDERS>=10 AND YEAR_AC_POINT>5000 THEN 'S' ELSE 'N' END)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


    public static int UserGradeHistoryInsert() {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO USER_GRADE_HISTORY(USER_NO,GRANT_DATE,GRADE,EXPIRE_DATE) SELECT USER_NO, SYSDATE, GRADE, ADD_MONTHS(SYSDATE,12) from USER_DETAIL";
            PreparedStatement pstmt;
            try {
                pstmt = conn.prepareStatement(SQL);
                return pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
        }
        return -1; // DB 오류
    }
}

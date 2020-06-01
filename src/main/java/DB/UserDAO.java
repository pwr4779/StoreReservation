package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;

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

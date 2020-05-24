package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {
    public static int SignUp(User user, Connection conn) {
        String SQL = "INSERT INTO 회원 VALUES (?,?,?,?,TO_DATE(?,'YYYYMMDD'),?,?,?,?,?)";
        PreparedStatement pstmt;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserName());
            pstmt.setString(3, user.getUserAddr());
            pstmt.setString(4, user.getUserPhone());
            pstmt.setString(5, user.getUserBirth());
            pstmt.setString(6, user.getUserHobby());
            pstmt.setString(7, user.getUserPreferenceStore());
            pstmt.setString(8, user.getUserSanctonDate());
            pstmt.setString(9, user.getUserPassword());
            pstmt.setString(10, user.getUserID());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB 오류
    }

    public static int UserDetailDefaultInsert(User user, Connection conn) {
        String SQL = "INSERT INTO 회원상세 VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, 1000);
            pstmt.setInt(2, 0);
            pstmt.setString(3, null);
            pstmt.setInt(4, 0);
            pstmt.setInt(5, 0);
            pstmt.setInt(6, 0);
            pstmt.setString(7, user.getUserID());
            pstmt.setInt(8, 1000);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB 오류
    }
}

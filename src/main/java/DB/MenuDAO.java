package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MenuDAO {
    public static ArrayList<Menu> getList(int pageNumber, Connection conn) {
        String SQL = "SELECT * FROM MENU WHERE ? <= ROWNUM AND ROWNUM < ? ORDER BY MENU_NO";
        ArrayList<Menu> list = new ArrayList<Menu>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            System.out.println(pageNumber);
            pstmt.setInt(1, pageNumber);
            pstmt.setInt(2, (pageNumber+10));
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Menu menu = new Menu(rs.getString("MENU_NO"),rs.getString("MENU_NAME"),rs.getInt("AMOUNT"));
                list.add(menu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int insertMenu(Menu menu) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO MENU VALUES(menu_seq.nextval,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, menu.getMenuName());
            pstmt.setInt(2, menu.getAmount());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int deleteMenu(int menuNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "DELETE FROM MENU WHERE MENU_NO=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, Integer.toString(menuNo));
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}

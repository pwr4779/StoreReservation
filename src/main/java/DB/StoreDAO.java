package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StoreDAO {

    public static int insertStore(Store store) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO STORE VALUES(?,?,?,?,?,to_timestamp(?,'HH24:MI'),to_timestamp(?,'HH24:MI'))";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, store.getStoreNo());
            pstmt.setString(2, store.getStoreName());
            pstmt.setString(3, store.getStoreAddr());
            pstmt.setString(4, store.getStorePhone());
            pstmt.setInt(5, store.getStoreTable());
            pstmt.setString(6, store.getStoreOpen());
            pstmt.setString(7, store.getStoreClose());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int deleteStore(int storeNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "DELETE FROM STORE WHERE STORE_NO=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, Integer.toString(storeNo));
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int getTable(int storeNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM STORE WHERE STORE_NO=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, Integer.toString(storeNo));
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt("NUM_OF_TABLE");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<Store> getList(int pageNumber , Connection conn){
        String SQL = "SELECT * FROM STORE WHERE ? <= ROWNUM AND ROWNUM < ? ORDER BY STORE_NO";
        ArrayList<Store> list = new ArrayList<Store>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, pageNumber);
            pstmt.setInt(2, (pageNumber+10));
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Store store = new Store(rs.getString("STORE_NO"),rs.getString("ADDR"),rs.getString("PHONE"),rs.getInt("NUM_OF_TABLE"),rs.getString("OPEN_TIME"),rs.getString("CLOSE_TIME"),rs.getString("STORE_NAME"),null,null);
                list.add(store);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Store> getBeforeInfoList(int StoreNo){
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM STORE_HISTORY WHERE STORE_NO = ?";
        ArrayList<Store> list = new ArrayList<Store>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, Integer.toString(StoreNo));
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Store store = new Store(rs.getString("STORE_NO"),rs.getString("ADDR"),rs.getString("PHONE"),rs.getInt("NUM_OF_TABLE"),rs.getString("OPEN_TIME"),rs.getString("CLOSE_TIME"),rs.getString("STORE_NAME"),rs.getString("HISTORY_NO"),rs.getString("HISTORY_DATE"));
                list.add(store);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Store getStore(int StoreNo) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM STORE WHERE STORE_NO = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, StoreNo);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Store store = new Store(rs.getString("STORE_NO"),rs.getString("ADDR"),rs.getString("PHONE"),rs.getInt("NUM_OF_TABLE"),rs.getString("OPEN_TIME"),rs.getString("CLOSE_TIME"),rs.getString("STORE_NAME"),null,null);
                return store;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static int insertBeforeInfo(Store store) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO STORE_HISTORY VALUES(storeUpdate_seq.nextval,?,?,?,?,?,?,?,sysdate)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, store.getStoreNo());
            pstmt.setString(2, store.getStoreName());
            pstmt.setString(3, store.getStoreAddr());
            pstmt.setString(4, store.getStorePhone());
            pstmt.setInt(5, store.getStoreTable());
            pstmt.setString(6, store.getStoreOpen());
            pstmt.setString(7, store.getStoreClose());


            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    //수정 함수
    public static int update(String StoreNo, String StoreName, String StoreAddr,  String StorePhone, int StoreTable,String StoreOpen,String StoreClose) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "UPDATE STORE SET STORE_NAME = ?, ADDR = ?, PHONE = ?, NUM_OF_TABLE = ?,OPEN_TIME =to_timestamp(?,'HH24MI'),CLOSE_TIME =to_timestamp(?,'HH24MI')  WHERE STORE_NO = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, StoreName);
            pstmt.setString(2, StoreAddr);
            pstmt.setString(3, StorePhone);
            pstmt.setInt(4, StoreTable);
            pstmt.setString(5, StoreOpen);
            pstmt.setString(6, StoreClose);
            pstmt.setString(7, StoreNo);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

}

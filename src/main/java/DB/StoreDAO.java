package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StoreDAO {

    public ArrayList<Store> getList(int pageNumber , Connection conn){
        String SQL = "SELECT * FROM 매장 WHERE ? <= ROWNUM AND ROWNUM < ? ORDER BY 매장번호";
        ArrayList<Store> list = new ArrayList<Store>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            System.out.println(pageNumber);
            pstmt.setInt(1, pageNumber);
            pstmt.setInt(2, (pageNumber+10));
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Store store = new Store(rs.getString("매장번호"),rs.getString("주소"),rs.getString("전화번호"),rs.getInt("테이블수"),rs.getString("오픈시간"),rs.getString("마감시간"),rs.getString("매장명"),null,null);
                list.add(store);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Store> getBeforeInfoList(int StoreNo){
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "SELECT * FROM 매장변경이력 WHERE 매장번호 = ?";
        ArrayList<Store> list = new ArrayList<Store>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, StoreNo);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Store store = new Store(rs.getString("매장번호"),rs.getString("주소"),rs.getString("전화번호"),rs.getInt("테이블수"),rs.getString("오픈시간"),rs.getString("마감시간"),rs.getString("매장명"),rs.getString("변경변호"),rs.getString("변경일"));
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
        String SQL = "SELECT * FROM 매장 WHERE 매장번호 = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, StoreNo);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Store store = new Store(rs.getString("매장번호"),rs.getString("주소"),rs.getString("전화번호"),rs.getInt("테이블수"),rs.getString("오픈시간"),rs.getString("마감시간"),rs.getString("매장명"),null,null);
                return store;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static int insertBeforeInfo(Store store) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "INSERT INTO 매장변경이력 VALUES(?,?,?,?,?,?,storeUpdate_seq.nextval,sysdate,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, store.getStoreAddr());
            pstmt.setString(2, store.getStorePhone());
            pstmt.setInt(3, store.getStoreTable());
            pstmt.setString(4, store.getStoreOpen());
            pstmt.setString(5, store.getStoreClose());
            pstmt.setString(6, store.getStoreNo());
            pstmt.setString(7, store.getStoreName());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    //수정 함수
    public static int update(String StoreNo, String StoreName, String StoreAddr,  String StorePhone, int StoreTable,String StoreOpen,String StoreClose) {
        Connection conn = DBconnector.getMySQLConnection();
        String SQL = "UPDATE 매장 SET 매장명 = ?, 주소 = ?, 전화번호 = ?, 테이블수 = ?,오픈시간 =to_timestamp(?,'HH24MI'),마감시간 =to_timestamp(?,'HH24MI')  WHERE 매장번호 = ?";
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

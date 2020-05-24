package DB;

import java.sql.*;

public class DBconnector {
    public static Connection getMySQLConnection(){
        Connection conn = null;
        try{
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String user = "hr";
            String password = "1234";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, user, password);

        }catch(SQLException e){
            System.out.println("계정불일치.<br/>");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }
    public static void close(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Statement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(PreparedStatement pstmt) {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void close(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static String NullCheck(String str){
        if(str.equals("")){
            return null;
        }
        return str;
    }

    }

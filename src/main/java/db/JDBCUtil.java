package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {

    // Walab MariaDB 접속 정보
    private static final String URL = "jdbc:mariadb://walab.handong.edu:3306/W25_22400661";
    private static final String USER = "W25_22400661";
    private static final String PASSWORD = "zah0Pi";

    // DB 연결 메서드
    public static Connection getConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 연결 닫기용 (DAO에서 씀)
    public static void close(Connection conn) {
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
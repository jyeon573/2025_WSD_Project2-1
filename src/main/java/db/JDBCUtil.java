package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {

    // 로컬 MariaDB 접속 정보
    private static final String URL = "jdbc:mariadb://localhost:3306/wsd_proj2";
    private static final String USER = "root";
    private static final String PASSWORD = "1234"; // MyMariaDB 컨테이너 만들 때 쓴 비번 넣기!

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
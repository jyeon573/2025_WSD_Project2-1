package test;

import db.JDBCUtil;
import java.sql.Connection;

public class DBTest {
    public static void main(String[] args) {
        Connection conn = JDBCUtil.getConnection();
        if (conn != null) {
            System.out.println("DB 연결 성공!");
        } else {
            System.out.println("DB 연결 실패...");
        }
    }
}
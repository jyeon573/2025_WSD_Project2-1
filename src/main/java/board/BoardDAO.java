package board;

import db.JDBCUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    // 1. 전체 글 목록 가져오기
    public List<BoardVO> getBoardList() {
        List<BoardVO> list = new ArrayList<>();

        String sql = "SELECT id, title, writer, content, regdate, hit FROM board ORDER BY id DESC";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setId(rs.getInt("id"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setContent(rs.getString("content"));
                vo.setRegdate(rs.getTimestamp("regdate"));
                vo.setHit(rs.getInt("hit"));

                list.add(vo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
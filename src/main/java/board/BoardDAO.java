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

    // 글 추가 (INSERT)
    public int insertBoard(BoardVO vo) {
        String sql = "INSERT INTO board (title, writer, content) VALUES (?, ?, ?)";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getContent());

            return pstmt.executeUpdate();  // 1이 리턴되면 성공

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // 실패
    }

    // 글 삭제 (DELETE)
    public int deleteBoard(int id) {
        String sql = "DELETE FROM board WHERE id = ?";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            return pstmt.executeUpdate();  // 1이 리턴되면 성공

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 검색 메소드
    public List<BoardVO> searchBoard(String keyword) {
        List<BoardVO> list = new ArrayList<>();
        String sql = "SELECT id, title, writer, content, regdate, hit " +
                "FROM board " +
                "WHERE title LIKE ? OR content LIKE ? " +
                "ORDER BY id DESC";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String like = "%" + keyword + "%";
            pstmt.setString(1, like);
            pstmt.setString(2, like);

            try (ResultSet rs = pstmt.executeQuery()) {
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 한 게시글 조회 메서드
    public BoardVO getBoardById(int id) {
        BoardVO vo = null;
        String sql = "SELECT id, title, writer, content, regdate, hit FROM board WHERE id = ?";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    vo = new BoardVO();
                    vo.setId(rs.getInt("id"));
                    vo.setTitle(rs.getString("title"));
                    vo.setWriter(rs.getString("writer"));
                    vo.setContent(rs.getString("content"));
                    vo.setRegdate(rs.getTimestamp("regdate"));
                    vo.setHit(rs.getInt("hit"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
    }

}
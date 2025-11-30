package board;

import db.JDBCUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    // 1. 전체 글 목록 가져오기
    public List<BoardVO> getBoardList() {
        List<BoardVO> list = new ArrayList<>();

        String sql = "SELECT id, title, writer, content, regdate, hit, file_name " +
                "FROM board ORDER BY id DESC";

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

                // ⬇ 추가: file_name 매핑
                vo.setFileName(rs.getString("file_name"));

                list.add(vo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 글 추가 (INSERT)
    public int insertBoard(BoardVO vo) {
        String sql = "INSERT INTO board (title, writer, content, file_name) VALUES (?, ?, ?, ?)";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getContent());

            // ⬇ 아직 파일 업로드 안 붙였으면 null 들어가도 상관 없음
            pstmt.setString(4, vo.getFileName());

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

    // 검색 메서드
    public List<BoardVO> searchBoard(String keyword) {
        List<BoardVO> list = new ArrayList<>();
        String sql = "SELECT id, title, writer, content, regdate, hit, file_name " +
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

                    // ⬇ 추가
                    vo.setFileName(rs.getString("file_name"));

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
        String sql = "SELECT id, title, writer, content, regdate, hit, file_name " +
                "FROM board WHERE id = ?";

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

                    // ⬇ 추가
                    vo.setFileName(rs.getString("file_name"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
    }

    // ⬇ 글 수정 (UPDATE)
    public int updateBoard(BoardVO vo) {
        String sql = "UPDATE board " +
                "SET title = ?, writer = ?, content = ?, file_name = ? " +
                "WHERE id = ?";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getContent());
            pstmt.setString(4, vo.getFileName());
            pstmt.setInt(5, vo.getId());

            return pstmt.executeUpdate(); // 1이면 성공

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 정렬 지원 메서드
    public List<BoardVO> getBoardList(String sort) {
        List<BoardVO> list = new ArrayList<>();

        String orderBy = "id DESC"; // 기본값

        if ("title".equals(sort)) {
            orderBy = "title ASC";
        } else if ("date".equals(sort)) {
            orderBy = "regdate DESC";
        } else if ("hit".equals(sort)) {
            orderBy = "hit DESC";
        }

        String sql = "SELECT id, title, writer, content, regdate, hit, file_name " +
                "FROM board ORDER BY " + orderBy;

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
                vo.setFileName(rs.getString("file_name"));

                list.add(vo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
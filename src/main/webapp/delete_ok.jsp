<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idStr = request.getParameter("id");
    int id = 0;
    try {
        id = Integer.parseInt(idStr);
    } catch (Exception e) {
        id = 0;
    }

    BoardDAO dao = new BoardDAO();

    // 1) 먼저 글 정보 읽어서 파일 이름 가져오기
    BoardVO vo = dao.getBoardById(id);
    String fileName = null;
    if (vo != null) {
        fileName = vo.getFileName();
    }

    // 2) 실제 서버에서 파일 삭제
    if (fileName != null && !fileName.isEmpty()) {
        // 업로드 폴더 경로 (write 할 때랑 똑같은 경로 사용해야 함)
        String uploadPath = request.getServletContext().getRealPath("upload");
        File file = new File(uploadPath, fileName);

        if (file.exists()) {
            file.delete();
        }
    }

    // 3) DB에서 게시글 삭제
    int result = dao.deleteBoard(id);
%>

<jsp:include page="header.jsp"/>

<h2 class="mb-4">Delete Result</h2>

<%
    if (result == 1) {
%>
<div class="alert alert-success">The post has been deleted successfully.</div>
<%
} else {
%>
<div class="alert alert-danger">Failed to delete the post.</div>
<%
    }
%>

<a href="list.jsp" class="btn btn-secondary mt-3">Back to List</a>

<jsp:include page="footer.jsp"/>
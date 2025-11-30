<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="file.FileUpload" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idStr = request.getParameter("id");
    int id = 0;
    try {
        id = Integer.parseInt(idStr);
    } catch (Exception e) { id = 0; }

    BoardDAO dao = new BoardDAO();
    BoardVO vo = dao.getBoardById(id);

    String fileName = null;
    if (vo != null) {
        fileName = vo.getFileName();
    }

    // 파일 삭제
    FileUpload.deleteFile(request, "upload", fileName);

    // 게시글 삭제
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
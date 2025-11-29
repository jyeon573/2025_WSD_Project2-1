<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="board.BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="file.FileUpload" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<jsp:include page="header.jsp"/>

<%
    request.setCharacterEncoding("UTF-8");

    int sizeLimit = 15 * 1024 * 1024;
    int result = 0;
    int id = 0;

    try {
        MultipartRequest multi = FileUpload.upload(request, "upload", sizeLimit);

        String idStr = multi.getParameter("id");
        String title = multi.getParameter("title");
        String writer = multi.getParameter("writer");
        String content = multi.getParameter("content");

        String oldFileName = multi.getParameter("oldFileName");
        String newFileName = multi.getFilesystemName("photo"); // 새로 올린 파일

        try {
            id = Integer.parseInt(idStr);
        } catch (Exception e) { id = 0; }

        // 최종 fileName 결정
        String finalFileName = null;

        if (newFileName != null && !newFileName.isEmpty()) {
            // 새 파일 올라왔으면 예전 파일 삭제
            FileUpload.deleteFile(request, "upload", oldFileName);
            finalFileName = newFileName;
        } else {
            // 새 파일 없으면 기존 것 유지
            if (oldFileName != null && !oldFileName.isEmpty()) {
                finalFileName = oldFileName;
            }
        }

        BoardVO vo = new BoardVO();
        vo.setId(id);
        vo.setTitle(title);
        vo.setWriter(writer);
        vo.setContent(content);
        vo.setFileName(finalFileName);

        BoardDAO dao = new BoardDAO();
        result = dao.updateBoard(vo);

    } catch (Exception e) {
        e.printStackTrace();
        result = 0;
    }
%>

<h2 class="mb-4">Edit Result</h2>

<%
    if (result == 1) {
%>
<div class="alert alert-success">The post has been updated successfully.</div>
<%
} else {
%>
<div class="alert alert-danger">Failed to update the post.</div>
<%
    }
%>

<div class="mt-3">
    <a href="view.jsp?id=<%= id %>" class="btn btn-primary">Back to Post</a>
    <a href="list.jsp" class="btn btn-secondary">Back to List</a>
</div>

<jsp:include page="footer.jsp"/>
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

    String title = null;
    String writer = null;
    String content = null;
    String finalFileName = null;

    try {
        MultipartRequest multi = FileUpload.upload(request, "upload", sizeLimit);

        String idStr = multi.getParameter("id");
        title = multi.getParameter("title");
        writer = multi.getParameter("writer");
        content = multi.getParameter("content");

        String oldFileName = multi.getParameter("oldFileName");
        String newFileName = multi.getFilesystemName("photo");

        try {
            id = Integer.parseInt(idStr);
        } catch (Exception e) {
            id = 0;
        }

        if (newFileName != null && !newFileName.isEmpty()) {
            // 새 파일 업로드 → 예전 파일 삭제
            file.FileUpload.deleteFile(request, "upload", oldFileName);
            finalFileName = newFileName;
        } else {
            // 새 파일 없으면 기존 파일 유지
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
<div class="card mb-3">
    <div class="card-body">
        <p><strong>Id:</strong> <%= id %></p>
        <p><strong>Title:</strong> <%= title %></p>
        <p><strong>Writer:</strong> <%= writer %></p>
        <p><strong>Content:</strong></p>
        <p style="white-space: pre-line;"><%= content %></p>

        <%
            if (finalFileName != null && !finalFileName.isEmpty()) {
        %>
        <p><strong>File:</strong> <%= finalFileName %></p>
        <img src="<%= request.getContextPath() %>/upload/<%= finalFileName %>"
             alt="attachment"
             class="img-fluid mt-2"
             style="max-width: 400px; height: auto;">
        <%
        } else {
        %>
        <p><strong>File:</strong> none</p>
        <%
            }
        %>
    </div>
</div>

<div class="mt-3">
    <a href="list.jsp" class="btn btn-secondary">Back to List</a>
</div>
<%
} else {
%>
<div class="alert alert-danger">Failed to update the post.</div>

<div class="mt-3">
    <a href="list.jsp" class="btn btn-secondary">Back to List</a>
</div>
<%
    }
%>

<jsp:include page="footer.jsp"/>
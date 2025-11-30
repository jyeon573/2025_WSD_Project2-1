<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="board.BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="file.FileUpload" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<jsp:include page="header.jsp"/>

<%
    request.setCharacterEncoding("UTF-8");

    int sizeLimit = 15 * 1024 * 1024; // 15MB
    int result = 0;

    String title = null;
    String writer = null;
    String content = null;
    String fileName = null;

    try {
        MultipartRequest multi = FileUpload.upload(request, "upload", sizeLimit);

        title = multi.getParameter("title");
        writer = multi.getParameter("writer");
        content = multi.getParameter("content");
        fileName = multi.getFilesystemName("photo"); // 새로 업로드된 파일명

        BoardVO vo = new BoardVO();
        vo.setTitle(title);
        vo.setWriter(writer);
        vo.setContent(content);
        vo.setFileName(fileName);

        BoardDAO dao = new BoardDAO();
        result = dao.insertBoard(vo);

    } catch (Exception e) {
        e.printStackTrace();
        result = 0;
    }
%>

<h2 class="mb-4">Write Result</h2>

<%
    if (result == 1) {
%>
<div class="card mb-3">
    <div class="card-body">
        <p><strong>Title:</strong> <%= title %></p>
        <p><strong>Writer:</strong> <%= writer %></p>
        <p><strong>Content:</strong></p>
        <p style="white-space: pre-line;"><%= content %></p>

        <%
            if (fileName != null && !fileName.isEmpty()) {
        %>
        <p><strong>File:</strong> <%= fileName %></p>
        <img src="<%= request.getContextPath() %>/upload/<%= fileName %>"
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
<div class="alert alert-danger">Failed to save the post.</div>
<a href="list.jsp" class="btn btn-secondary mt-3">Back to List</a>
<%
    }
%>

<jsp:include page="footer.jsp"/>